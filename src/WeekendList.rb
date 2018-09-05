# https://mentalized.net/journal/2011/04/14/ruby-how-to-check-if-a-string-is-numeric/
DEBUG_MODE = true

class String  #string class that checks for positive and numeric numbers
    def numeric?
      (Float(self) != nil)  rescue false
    end
    def positive?
      (Float(self) > 0)  rescue false 
    end
end

class NonNumericArgumentError < StandardError
end

class NegativeNumberError < StandardError
end

class EmptyInputError <  StandardError
end

class WeekendList
    attr_accessor :list
    def initialize(list)
        @list = list
    end

    def add
        begin
            puts "What would you like to add to your fun list?"
            @new_activity = gets.chomp
            raise EmptyInputError, "please enter your activity" if @new_activity.empty?
            puts "How long are you going to spend on this activity?"
            @new_time = gets.chomp
            raise NonNumericArgumentError, "Please enter a number" if(!@new_time.numeric?)
            raise NegativeNumberError, "it must be a positive number" if(!@new_time.positive?)
            puts "Are you sure that you wanna add #{@new_activity} for #{@new_time} hours? (y/n)"
            @confirmation = (gets.chomp).downcase

            if @confirmation == 'y'
                @list << {activity: @new_activity, time: @new_time}
                puts @list.last                             if DEBUG_MODE == true
                File.write('Data.json', JSON.dump(@list))   if DEBUG_MODE == false
            elsif @confirmation == 'n'
            
            else
                puts "please enter y or n :D"
            end
            
        rescue EmptyInputError => e
            puts e.message
            retry
        rescue NonNumericArgumentError => e
            puts e.message
            retry
        rescue NegativeNumberError => e
            puts e.message
            retry
        end
        
    end

    def decide
        begin
            @decided_act = @list[rand(0...@list.length)] #rand(0...@list.length) returns random number from 0 to the length of list
            puts "should I #{@decided_act[:activity]} for #{"%.1f" % @decided_act[:time]} hours? => (options: redecide/change time/delete/quit)"# random range from 0 to length of list
            decide_options = gets.chomp.strip #removes white spaces at the ends

            case decide_options
            when "redecide"
                self.decide # recalls class method decide
            when "change time"
                begin
                    puts "How long would like to do #{@decided_act[:activity]}? "
                    @update_time = gets.chomp
                    raise NonNumericArgumentError, "Please enter a number" if(!@update_time.numeric?)
                    raise NegativeNumberError, "it must be a positive number" if(!@update_time.positive?)
                    @decided_act[:time] = @update_time
                rescue NonNumericArgumentError => e
                    puts e.message
                    retry
                rescue NegativeNumberError => e
                    puts e.message
                    retry
                end
            when "delete"
                @list.delete_if { |hash| hash[:activity] == @decided_act[:activity] } # looks through each hash element in array and deletes the decided activity
                puts @list.include?(@decided_act) if DEBUG_MODE == true
            when "quit"
                puts @list.include?(@decided_act) if DEBUG_MODE == true
            else
                puts "You have entered the wrong options, please check your spelling :D"

        end
        
        rescue TypeError #empty array returns TypeError
            puts "your list is empty! please select 'add activity' option first"    
        end
    end
end


