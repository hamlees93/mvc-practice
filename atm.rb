class Atm_model
    def initialize (balance: 0)
        @balance = balance
    end

    def dispense_money amount
        @balance >= amount ? @balance -= amount : nil
    end

    def get_balance
        @balance
    end

    def deposit_funds amount
        @balance += amount
    end
end

class Atm_view
    def user_choice
        choice = nil
        while choice != 'balance' && choice != 'withdraw' && choice != 'deposit'
            puts "Would you like to view your 'balance', 'withdraw' or 'deposit' some cash or 'exit' the system?"
            choice = gets.chomp.downcase
        end
        choice
    end

    def withdraw
        puts "Please enter amount you wish to withdraw."
        amount = gets.chomp.to_i #.to_f.round(2)
    end

    def deposit
        puts "Please enter the amonut you wish to deposit."
        amount = gets.chomp.to_i
    end

    def display_balance balance
        puts "Your current balance is $#{balance}!"
    end

    def insufficient_funds
        puts("Insufficient funds. Please try a smaller amount next time.")
    end

    def exit
        puts ("Thanks for the visit. Your money is safe with us..")
    end
end

class Atm_controller
    def initialize
        @atm_model = Atm_model.new
        @atm_view = Atm_view.new
    end

    def run
        choice = @atm_view.user_choice
        while choice != 'exit'
            if choice == 'balance' 
                balance = @atm_model.get_balance
                @atm_view.display_balance balance
            end
            if choice == 'deposit'
                amount = @atm_view.deposit
                dispense = @atm_model.deposit_funds amount
            end
            if choice == 'withdraw'
                amount = @atm_view.withdraw
                dispense = @atm_model.dispense_money amount
                @atm_view.insufficient_funds if dispense == nil
            end
            choice = @atm_view.user_choice
        end
        @atm_view.exit
    end
end

atm = Atm_controller.new
atm.run

