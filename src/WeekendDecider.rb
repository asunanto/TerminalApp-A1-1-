class WeekendList
    attr_accessor :list
    def initialize(list)
        @list = list
    end

    def add
        puts "What would you like to add to your fun list?"
        @new_activity = gets.chomp
        puts "How long are you going to spend on this activity?"
        @new_time = (gets.chomp).to_i
        puts "Are you sure that you wanna add #{@new_activity} for #{@new_time}hours? (y/n)"
        @confirmation = (gets.chomp).downcase
        if @confirmation == 'y'
            @list << {activity: @new_activity, time: @new_time}
        elsif @confirmation == 'n'
            
        else
            puts "please enter y or n :D"
        end
        
    end

    def delete(activity)
        @list.delete_if { |hash| hash[:activity] == activity }
    end
    def decide
         return @list[rand(0...@list.length)] # random range from 0 to length of list
    end
end

list_of_actities = [{activity: "basketball", time: 1},{activity: "tennis", time: 2},{activity: "picnic" ,time: 3}]
weekend = WeekendList.new(list_of_actities)
options = ""
while(options!="quit")
    puts "What would like to do for your weekends? (options: decide/add activity/quit)"
    options = gets.chomp
    case options
    when "decide"
        puts weekend.decide
    when "add activity"
        puts weekend.add
    when "quit"
        
    else
        puts "Can you please enter the right options? Please check the spelling :D"
    end
end
# hash = {activity: "soccer", time:1}
# weekend.add(hash)
# puts weekend.list
# puts
# weekend.delete("tennis")
# puts weekend.list



