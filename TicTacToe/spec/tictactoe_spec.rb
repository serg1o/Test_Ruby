require_relative '../tictactoe'
 
describe Game do

  before(:all) do
    @player1 = Player.new("Sergio", "X", "player1")
    @player2 = Player.new("Sam", "O", "player2")
    @game = Game.new(@player1, @player2)
  end

  context "when no player wins" do
    context "when only one square marked" do
      it "#check_win returns nil when 1 cell marked by player1" do
        @game.mark_position(1, 1, @player1)
        expect(@game.check_win).to eql(nil)
      end

      it "#check_win returns nil when 1 cell marked by player2" do
        @game.mark_position(2, 1, @player2)
        expect(@game.check_win).to eql(nil)
      end
    end

    context "when two squares marked by each player" do
      it "#check_win returns nil" do
        @game.mark_position(1, 1, @player2)
        @game.mark_position(1, 2, @player2)
        @game.mark_position(1, 0, @player1)
        @game.mark_position(0, 2, @player1)
        expect(@game.check_win).to eql(nil)
      end
    end

   context "when three unaligned squares marked by each player" do
      it "#check_win returns nil" do
        @game.mark_position(1, 1, @player2)
        @game.mark_position(1, 2, @player2)
        @game.mark_position(0, 0, @player2)
        @game.mark_position(2, 0, @player1)
        @game.mark_position(1, 0, @player1)
        @game.mark_position(0, 2, @player1)
        expect(@game.check_win).to eql(nil)
      end
    end

  end


  context "when player1 wins" do
    context "when a row is made" do
      it "#check_win returns player1 name when row 0 completed" do
        @game.mark_position(0, 0, @player1)
        @game.mark_position(0, 1, @player1)
        @game.mark_position(0, 2, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end

      it "#check_win returns player1 name when row 1 completed" do
        @game.mark_position(1, 0, @player1)
        @game.mark_position(1, 1, @player1)
        @game.mark_position(1, 2, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end

      it "#check_win returns player1 name when row 2 completed" do
        @game.mark_position(2, 0, @player1)
        @game.mark_position(2, 1, @player1)
        @game.mark_position(2, 2, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end
    end

    context "when a column is made" do
      it "#check_win returns player1 name when column 0 completed" do
        @game.mark_position(0, 0, @player1)
        @game.mark_position(1, 0, @player1)
        @game.mark_position(2, 0, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end

      it "#check_win returns player1 name when column 1 completed" do
        @game.mark_position(0, 1, @player1)
        @game.mark_position(1, 1, @player1)
        @game.mark_position(2, 1, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end

      it "#check_win returns player1 name when column 2 completed" do
        @game.mark_position(0, 2, @player1)
        @game.mark_position(1, 2, @player1)
        @game.mark_position(2, 2, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end
    end

    context "when a diagonal is made" do
      it "#check_win returns player1 name when diagonal 1 completed" do
        @game.mark_position(0, 0, @player1)
        @game.mark_position(1, 1, @player1)
        @game.mark_position(2, 2, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end

      it "#check_win returns player1 name when row 1 completed" do
        @game.mark_position(2, 0, @player1)
        @game.mark_position(1, 1, @player1)
        @game.mark_position(0, 2, @player1)
        expect(@game.check_win).to eql(@player1.name)
      end
    end
  end

  context "when player2 wins" do
    context "when a row is made" do
      it "#check_win returns player2 name when row 0 completed" do
        @game.mark_position(0, 0, @player2)
        @game.mark_position(0, 1, @player2)
        @game.mark_position(0, 2, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end

      it "#check_win returns player2 name when row 1 completed" do
        @game.mark_position(1, 0, @player2)
        @game.mark_position(1, 1, @player2)
        @game.mark_position(1, 2, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end

      it "#check_win returns player2 name when row 2 completed" do
        @game.mark_position(2, 0, @player2)
        @game.mark_position(2, 1, @player2)
        @game.mark_position(2, 2, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end
    end

    context "when a column is made" do
      it "#check_win returns player2 name when column 0 completed" do
        @game.mark_position(0, 0, @player2)
        @game.mark_position(1, 0, @player2)
        @game.mark_position(2, 0, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end

      it "#check_win returns player2 name when column 1 completed" do
        @game.mark_position(0, 1, @player2)
        @game.mark_position(1, 1, @player2)
        @game.mark_position(2, 1, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end

      it "#check_win returns player2 name when column 2 completed" do
        @game.mark_position(0, 2, @player2)
        @game.mark_position(1, 2, @player2)
        @game.mark_position(2, 2, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end
    end

    context "when a diagonal is made" do
      it "#check_win returns player2 name when diagonal 1 completed" do
        @game.mark_position(0, 0, @player2)
        @game.mark_position(1, 1, @player2)
        @game.mark_position(2, 2, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end

      it "#check_win returns player2 name when row 1 completed" do
        @game.mark_position(2, 0, @player2)
        @game.mark_position(1, 1, @player2)
        @game.mark_position(0, 2, @player2)
        expect(@game.check_win).to eql(@player2.name)
      end
    end
  end

  

  context "using a stub for checking the name of player" do
    it "returns the name of a hypothetical" do

      pl1 = double('Player')
      #pl1.stub(:name).and_return("player_h")
      pl1.stub(:name) {"player_h"}
      pl2 = double('Player2')
      pl2.stub(:name) {"player_h2"}
      game = Game.new(pl1, pl2)
      expect(game.player1.name).to eql("player_h") 
    end
  end
end

