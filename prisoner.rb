class Prisoner
  attr_accessor :point,:strategy
  
  def initialize strategy
    @point = 0
    @strategy = strategy
  end

end

#five strategies
class TFTStrategy
  attr_reader :title,:trials
  def initialize 
    @trials = Array.new << :coop
    @title  = 'TFTStrategy'
  end

  #TFT strategy changes own strategy by opponent's strategy  
  public
  def search_opponent(opponent_strategy)
    opponent_strategy.trials.each_with_index do |trial,i|      
      @trials[i+1] = (trial == :betray) ? :betray : :coop      
    end
    @trials.delete_at(200)
  end
end

class AllBetrayalStrategy
  attr_reader :title,:trials
  def initialize
    @trials = Array.new
    200.times do        
      @trials << :betray
    end
    @title  = 'AllBetrayalStrategy'
  end
end

class OddCooperationStrategy
  attr_reader :title,:trials
  def initialize
    @trials = Array.new
    200.times do |i|
      if (i+1)%2 == 0
        @trials << :betray 
      else
        @trials << :coop
      end
    end
    @title  = 'OddCooperationStrategy'
  end
end

class OddBetrayalStrategy
  attr_reader :title,:trials
  def initialize
    @trials = Array.new
    200.times do |i|
      if (i+1)%2 == 0
        @trials << :coop
      else
        @trials << :betray
      end
    end
    @title  = 'OddBetrayalStrategy'
  end
end

class AllRandomStrategy
  attr_reader :title,:trials
  def initialize
    @trials = Array.new
    200.times do
      @trials << [:coop,:betray].sample
    end
    @title  = 'AllRandomStrategy'
  end
  
  public
  def re_strategy
    @trials = Array.new
    200.times do
      @trials << [:coop,:betray].sample
    end
  end
end

