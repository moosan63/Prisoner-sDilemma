class Game
  def initialize(prisoner1, prisoner2)
    #when prisoner's strategy is TFT, searching opponent strategy and changing own strategy.
    @prisoner1 = prisoner1
    if prisoner1.strategy.respond_to?(:search_opponent,true)
      @prisoner1.strategy.search_opponent(prisoner2.strategy)
    end

    @prisoner2 = prisoner2
    if prisoner2.strategy.respond_to?(:search_opponent,true)
      @prisoner2.strategy.search_opponent(prisoner1.strategy)
    end
  end

  public
  def play
    #puts "=*=*=*= Play =*=*=*="
    #puts "#{@prisoner1.strategy.title} VS #{@prisoner2.strategy.title}"
    trials1 = @prisoner1.strategy.trials
    trials2 = @prisoner2.strategy.trials
    #judgement trials
    tmp_p1 = 0
    tmp_p2 = 0
    trials1.each_with_index do |trial,i|
      if trial == :betray
        if trials2[i] == :betray #betray && betray
          @prisoner1.point += 1
          tmp_p1 += 1          
          @prisoner2.point += 1
          tmp_p2 += 1
        else #betray && coop 
          @prisoner1.point += 5
          tmp_p1 += 5
          @prisoner2.point += 0
          tmp_p2 += 0
        end
      else #trial == :coop
        if trials2[i] == :betray #coop && betray
          @prisoner1.point += 0
          tmp_p1 += 0
          @prisoner2.point += 5
          tmp_p2 += 5
        else #coop && coop
          @prisoner1.point += 3
          tmp_p1 += 3
          @prisoner2.point += 3
          tmp_p2 += 3
        end
      end #end if trial == :betray
    end #end trials1.each
    
    #puts "=-= points =-="
    #puts "#{@prisoner1.strategy.title } : #{@prisoner1.point} : #{tmp_p1}"
    #puts "#{@prisoner2.strategy.title } : #{@prisoner2.point} : #{tmp_p2}"
  end #end def play

  def self.output_results(prisoners)
    puts " -*-= results =-*- "
    prisoners.each do |prisoner|
      f = ->(i){i+" "*(25 - i.size) }
      puts f.(prisoner.strategy.title)+": #{prisoner.point}"
    end
  end
end
