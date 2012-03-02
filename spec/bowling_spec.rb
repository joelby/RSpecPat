class Game
  def initialize
    @score = 0
  end
  
  def score
    @score
  end
  
  def roll(pins_down)
    add_score(pins_down) if check_for_strike
    add_score(pins_down) if check_for_spare(pins_down)
    add_score pins_down
    
    @two_balls_ago_strike = @one_ball_ago_strike
    @one_ball_ago_strike = (pins_down == 10)
    @previous_roll = pins_down
    @second_ball = !@second_ball
  end
  
  def add_score(pins_down)
    @score += pins_down
  end
  
  def check_for_strike
    @one_ball_ago_strike || @two_balls_ago_strike
  end

  def check_for_spare(pins_down)
    @second_ball && ((@previous_roll + pins_down) == 10)
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
   
      
  describe "rolling a strike followed by a 5" do
     it "scores 20" do
       game = Game.new
       game.roll 10 
       game.roll 5
       game.score.should == 20
     end
   end

  describe "rolling a spare followed by a 5" do
     it "scores 20" do
       game = Game.new
       3.times { game.roll 5 }
       game.score.should == 20
     end
   end
   
  describe "rolling a spare followed by a 5 followed by a 3" do
       it "scores 23" do
         game = Game.new
         3.times { game.roll 5 }
         game.roll 3
         game.score.should == 23
       end
     end
     
  describe "rolling a strike followed by a 5 followed by a 3" do
       it "scores 26" do
         game = Game.new
         game.roll 10
         game.roll 5
         game.roll 3
         game.score.should == 26
       end
     end
  
end