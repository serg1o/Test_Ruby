require_relative '../connect4'
 
describe Game do

  before(:all) do
    @player1 = Player.new("Sergio", "X", "player1")
    @player2 = Player.new("Sam", "O", "player2")
  end

  context "All methods"
    
    before(:each) do
      @game = Game.new
    end

    describe "#display_board" do

      it "displays the board grid" do
        out = "\n     0   1   2   3   4   5   6 "
        out << "\n"
        (0..5).each do |index|
          out << "\n   |   |   |   |   |   |   |   |"
          out << "\n   |---|---|---|---|---|---|---|" unless index == 5
        end
        out << "\n   -----------------------------\n"
        expect{@game.game_board.display_board}.to output(out).to_stdout
      end
    end

    context "when player1 wins" do
    
      context "when a row is completed" do
        it "#check_win returns player1 name when row 0 completed" do
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(1, @player1)
          @game.game_board.mark_position(2, @player1)
          expect(@game.game_board.mark_position(3, @player1)).to eql(@player1.name)
        end

        it "#check_win returns player1 name when row 1 completed" do
          @game.game_board.mark_position(1, @player1)
          @game.game_board.mark_position(2, @player1)
          @game.game_board.mark_position(3, @player2)
          @game.game_board.mark_position(4, @player1)
          @game.game_board.mark_position(4, @player2)
          @game.game_board.mark_position(1, @player2)
          @game.game_board.mark_position(2, @player2)
          expect(@game.game_board.mark_position(3, @player2)).to eql(@player2.name)
      end


        it "#check_win returns player1 name when row 0 completed" do
          @game.game_board.mark_position(3, @player1)
          @game.game_board.mark_position(4, @player1)
          @game.game_board.mark_position(5, @player1)
          expect(@game.game_board.mark_position(6, @player1)).to eql(@player1.name)
        end
      end

      context "when a column is made" do
        it "#check_win returns player1 name when vertical completed" do
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(1, @player2)
          @game.game_board.mark_position(5, @player2)
          @game.game_board.mark_position(6, @player2)
          @game.game_board.mark_position(1, @player2)
          @game.game_board.mark_position(2, @player2)

          expect(@game.game_board.mark_position(0, @player1)).to eql(@player1.name)

        end
      end

      context "when a diagonal is made" do
        it "#check_win returns player2 name when diagonal 1 completed" do
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(1, @player1)
          @game.game_board.mark_position(2, @player1)
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(1, @player1)
          @game.game_board.mark_position(0, @player1)
          @game.game_board.mark_position(0, @player2)
          @game.game_board.mark_position(1, @player2)
          @game.game_board.mark_position(2, @player2)
          expect(@game.game_board.mark_position(3, @player2)).to eql(@player2.name)
      end

        it "#check_win returns player1 name when diagonal 2 completed" do
          @game.game_board.mark_position(6, @player1)
          @game.game_board.mark_position(5, @player1)
          @game.game_board.mark_position(4, @player1)
          @game.game_board.mark_position(6, @player1)
          @game.game_board.mark_position(5, @player1)
          @game.game_board.mark_position(6, @player1)
          @game.game_board.mark_position(6, @player2)
          @game.game_board.mark_position(5, @player2)
          @game.game_board.mark_position(4, @player2)
          expect(@game.game_board.mark_position(3, @player2)).to eql(@player2.name)
        end
    end
  end

  context "When using a double to check which player won" do
    it "#check_column returns the name of the winner" do     
      tab = double("Board")
      game = Game.new(tab)
      allow(tab).to receive(:check_column) {@player1.name} #the @tab object will return @player1.name when it receives the check_win message
      expect(game.game_board.check_column).to eql(@player1.name)
    end

    it "#check_diag1 returns the name of the winner" do     
      tab = double("Board")
      game = Game.new(tab)
      allow(tab).to receive(:check_diag1) {@player2.name}
      expect(game.game_board.check_diag1).to eql(@player2.name)
    end

    it "#check_diag2 returns the name of the winner" do     
      tab = double("Board")
      game = Game.new(tab)
      allow(tab).to receive(:check_diag2) {@player2.name}
      expect(game.game_board.check_diag2).to eql(@player2.name)
    end

    it "#check_horizontal returns the name of the winner" do     
      tab = double("Board")
      game = Game.new(tab)
      allow(tab).to receive(:check_horizontal) {@player1.name}
      expect(game.game_board.check_horizontal).to eql(@player1.name)
    end

  end
end

