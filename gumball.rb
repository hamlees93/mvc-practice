class Gumball
end

class GumballMachineModel

  def initialize(gumballCount: 0)
    @gumballCount = gumballCount
  end
  
  def dispense
    if @gumballCount > 0
      @gumballCount -= 1
      return Gumball.new
    else
      return nil
    end
  end

  def refill(count)
    @gumballCount += count
  end

end

class GumballMachineView

  def greeting
    puts "Hi there! Welcome to gum-topia"
  end

  def menu
    choice = nil
    while choice != "G" && choice != "R" && choice != "X"
      puts "Press G to get a gumball, R to refill, or X to exit"
      choice = gets.chomp.upcase
    end
    
    choice
  end

  def getGumball
    puts "Yum, here's your gumball"
  end

  def machineEmpty
    puts "Unfortunately the machine is empty. Please refill and retry."
  end

  def refill(count)
    puts "You have successfully filled the machine with #{6} new gumballs"
    puts "If my math is correct that leads to a total of #{count} gumballs!"
  end

  def exit
    puts "Thank you for visiting gum-topia. Please do come again."
  end

end

class GumballMachineController

  def initialize
    @gumballMachineModel = GumballMachineModel.new
    @gumballMachineView = GumballMachineView.new
  end

  def run
    @gumballMachineView.greeting
    choice = @gumballMachineView.menu 
    
    while choice != "X"
      if choice == "G"
        gumball = @gumballMachineModel.dispense
        if gumball.nil?
          @gumballMachineView.machineEmpty
        else
          @gumballMachineView.getGumball
        end
      end
      if choice == "R"
        numGumballs = @gumballMachineModel.refill(6)
        @gumballMachineView.refill(numGumballs)
      end
      choice = @gumballMachineView.menu
    end
    @gumballMachineView.exit
  end
end

gumballMachineController = GumballMachineController.new
gumballMachineController.run