# frozen_string_literal: true

class Tennis
  def initialize
    @player_1_score = 0
    @player_2_score = 0
    @deuce = false
  end

  def score
    if deuce?
      @deuce = true
    end
    if !@deuce && @player_1_score >= 4
      'Player 1 Wins'
    elsif !@deuce && @player_2_score >= 4
      'Player 2 Wins'
    elsif @deuce
      deuce_scenario
    else
      "#{SCORES[@player_1_score]}-#{SCORES[@player_2_score]}"
    end
  end

  def player1scores
    if @player_2_score == 4
      @player_2_score -= 1
    else
      @player_1_score += 1
    end
  end

  def player2scores
    if @player_1_score == 4
      @player_1_score -= 1
    else
      @player_2_score += 1
    end
  end


  private

  SCORES = { 0 => 'Love', 1 => 'Fifteen', 2 => 'Thirty', 3 => 'Forty', 4 => 'Advantage' }.freeze

  def deuce?
    @player_1_score >= 3 && @player_2_score >= 3
  end

  def deuce_scenario
    if @player_1_score == 5 && @player_2_score == 3
      'Player 1 Wins'
    elsif @player_2_score == 5 && @player_1_score == 3
      'Player 2 Wins'
    elsif @player_1_score == 4 && @player_2_score == 3
      "#{SCORES[4]} Player 1"
    elsif @player_1_score == 3 && @player_2_score == 4
      "#{SCORES[4]} Player 2"
    else
      'Deuce'
    end
  end
end
