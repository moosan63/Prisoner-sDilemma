class Start
  #this is program for executing of prisoner's dilemma program
  require "./game.rb"
  require "./prisoner.rb"
  tft_prisoner             = Prisoner.new(TFTStrategy.new)
  betrayal_prisoner        = Prisoner.new(AllBetrayalStrategy.new)
  odd_betrayal_prisoner    = Prisoner.new(OddBetrayalStrategy.new)
  odd_cooperative_prisoner = Prisoner.new(OddCooperationStrategy.new)
  random_prisoner          = Prisoner.new(AllRandomStrategy.new)
  
  prisonersA = [tft_prisoner,
               betrayal_prisoner,
               odd_betrayal_prisoner,
               odd_cooperative_prisoner,
               random_prisoner]
  #same object set for comparing whether same object or not
  prisonersB = prisonersA

  #For output results, because prisonerA will be reject!ed.
  results_prisoners = Array.new
  results_prisoners = prisonersA.clone

  prisonersA.each do |prisonerA|
    #half is waste,so rejecing half of game
    prisonersB.reject!{|x| x == prisonerA }
    prisonersB.each do |prisonerB|
      5.times do
        if prisonerB == random_prisoner
          prisonerB.strategy.re_strategy
        end
        Game.new(prisonerA,prisonerB).play
      end
    end
  end
  prisonersA = results_prisoners.clone
  Game.output_results(results_prisoners)

end
