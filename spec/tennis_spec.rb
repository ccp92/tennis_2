# frozen_string_literal: true

require 'tennis'

describe Tennis do
  let(:tennis) { Tennis.new }
  describe 'No-one has scored' do
    it 'returns Love-Love' do
      expect(tennis.score).to eq('Love-Love')
    end
  end

  describe 'Only Player 1 scoring' do
    describe 'Player 1 has scored' do
      it 'returns 15-Love' do
        tennis.player1scores
        expect(tennis.score).to eq('Fifteen-Love')
      end
    end

    describe 'Player 1 scores again' do
      it 'returns 30-Love' do
        2.times { tennis.player1scores }
        expect(tennis.score).to eq('Thirty-Love')
      end
    end

    describe 'Player 1 scores again' do
      it 'returns 40-Love' do
        3.times { tennis.player1scores }
        expect(tennis.score).to eq('Forty-Love')
      end
    end
  end

  describe 'Only Player 2 scoring' do
    describe 'Player 2 has scored' do
      it 'returns Love-Fifteen' do
        tennis.player2scores
        expect(tennis.score).to eq('Love-Fifteen')
      end
    end

    describe 'Player 2 has scored again' do
      it 'returns Love-Thirty' do
        2.times { tennis.player2scores }
        expect(tennis.score).to eq('Love-Thirty')
      end
    end

    describe 'Player 2 has scored again again' do
      it 'returns Love-Forty' do
        3.times { tennis.player2scores }
        expect(tennis.score).to eq('Love-Forty')
      end
    end
  end

  describe 'Player 1 and 2 scoring' do
    describe 'Player 1 and player 2 score once' do
      it 'returns 15-15' do
        tennis.player1scores
        tennis.player2scores
        expect(tennis.score).to eq('Fifteen-Fifteen')
      end
    end

    describe 'Player 1 scores thrice and player two scores once' do
      it 'returns Forty-Fifteen' do
        3.times { tennis.player1scores }
        tennis.player2scores
        expect(tennis.score).to eq('Forty-Fifteen')
      end
    end

    context 'Deuce Scenarios' do
      describe 'Player one and Player two score three times' do
        it 'returns Deuce' do
          3.times do
            tennis.player1scores
            tennis.player2scores
          end
        expect(tennis.score).to eq('Deuce')
        end
      end

      describe 'Player one scores during Deuce' do
        it 'returns Advantage Player 1' do
          3.times do
            tennis.player1scores
            tennis.player2scores
          end
          tennis.player1scores
          expect(tennis.score).to eq('Advantage Player 1')
        end
      end

      describe 'Player two scores during Deuce' do
        it 'returns Advantage Player 2' do
          3.times do
            tennis.player1scores
            tennis.player2scores
          end
          tennis.player2scores
          expect(tennis.score).to eq('Advantage Player 2')
        end
      end

      describe 'Player 2 scores whilst player 1 has advantage' do
        it 'returns Deuce' do
          4.times do
            tennis.player1scores
            tennis.player2scores
          end
          expect(tennis.score).to eq('Deuce')
        end
      end

      describe 'Player 1 scores whilst player 2 has advantage' do
        it 'returns Deuce' do
          4.times do
            tennis.player2scores
            tennis.player1scores
          end
          expect(tennis.score).to eq('Deuce')
        end
      end
    end

    context 'Winning Conditions' do
      describe 'Player 1 wins without advantage' do
        it 'returns Player 1 wins' do
          4.times { tennis.player1scores }
          expect(tennis.score).to eq('Player 1 Wins')
        end
      end

      describe 'Player 2 wins without advantage' do
        it 'returns Player 2 wins' do
          4.times { tennis.player2scores }
          expect(tennis.score).to eq('Player 2 Wins')
        end
      end

      describe 'Player 1 wins without advantage (but with player 2 scoring)' do
        it 'returns Player 1 wins' do
          3.times { tennis.player1scores }
          tennis.player2scores
          tennis.player1scores
          expect(tennis.score).to eq('Player 1 Wins')
        end
      end

      describe 'Player 2 wins without advantage (but with player 1 scoring)' do
        it 'returns Player 2 wins' do
          3.times { tennis.player2scores }
          tennis.player1scores
          tennis.player2scores
          expect(tennis.score).to eq('Player 2 Wins')
        end
      end

      describe 'Player 1 wins with advantage' do
        it 'returns Player 1 wins' do
          3.times do
            tennis.player1scores
            tennis.player2scores
          end
          2.times { tennis.player1scores}
          expect(tennis.score).to eq('Player 1 Wins')
        end
      end

      describe 'Player 2 wins with advantage' do
        it 'returns Player 2 wins' do
          3.times do
            tennis.player1scores
            tennis.player2scores
          end
          2.times { tennis.player2scores}
          expect(tennis.score).to eq('Player 2 Wins')
        end
      end

      describe 'Player 1 Wins after returns to deuce from Player 2s Adv' do
        it 'returns Player 1 Wins' do
          4.times do
            tennis.player2scores
            tennis.player1scores
          end
          2.times { tennis.player1scores }
          expect(tennis.score).to eq('Player 1 Wins')
        end
      end
    end
  end
end
