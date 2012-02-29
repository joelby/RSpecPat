class Game
  def initialize
    @score = 0
  end
  
  def score
    @score
  end
  
  def roll(pins_down)
    @score += pins_down
  end  
end

describe "bowling" do
  describe "a new game" do
    it "scores 0" do
      Game.new.score.should == 0
    end
  end
  
  describe "rolling a 5" do
    it "scores 5" do
      game = Game.new
      game.roll 5
      game.score.should == 5
    end
  end
  
  describe "rolling a strike" do
     it "scores 10" do
       game = Game.new
       game.roll 10 
       game.score.should == 10
     end
   end
      
  describe "rolling a 5 followed by a strike" do
     it "scores 15" do
       game = Game.new
       game.roll 5 
       game.roll 10
       game.score.should == 15
     end
   end
   
  #     
  # describe "rolling a strike followed by a 5" do
  #    it "scores 20" do
  #      game = Game.new
  #      game.roll 10 
  #      game.roll 5
  #      game.score.should == 20
  #    end
  #  end
end