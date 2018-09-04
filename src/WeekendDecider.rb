require 'json'
class WeekendList
    attr_accessor :list
    def initialize(list)
        @list = list
    end

    def add
        puts "What would you like to add to your fun list?"
        @new_activity = gets.chomp
        puts "How long are you going to spend on this activity?"
        @new_time = (gets.chomp).to_f
        puts "Are you sure that you wanna add #{@new_activity} for #{@new_time}hours? (y/n)"
        @confirmation = (gets.chomp).downcase
        if @confirmation == 'y'
            @list << {activity: @new_activity, time: @new_time}
            File.write('Data.json', JSON.dump(@list))
        elsif @confirmation == 'n'
            
        else
            puts "please enter y or n :D"
        end
        
    end

    def decide
        begin
            @decided_act = @list[rand(0...@list.length)] #rand(0...@list.length) returns random number from 0 to the length of list
            puts "should I #{@decided_act[:activity]} for #{"%.1f" % @decided_act[:time]} hours? => (options: redecide/change time/delete/quit)"# random range from 0 to length of list
            decide_options = gets.chomp
            case decide_options
            when "redecide"
                self.decide # recalls class method decide
            when "change time"
                puts "How long would like to do #{@decided_act[:activity]}? "
                @update_time = gets.chomp
                @decided_act[:time] = @update_time
                puts @decided_act
            when "delete"
                @list.delete_if { |hash| hash[:activity] == @decided_act[:activity] } # looks through each hash element in array and deletes the decided activity
                puts @list
            when "quit"
                exit
            else

        end
        rescue TypeError #empty array returns TypeError
            puts "your list is empty! please select 'add activity' option first"    
        end
    end
end

# list_of_actities = [{activity: "basketball", time: 1.55},{activity: "tennis", time: 2.55},{activity: "picnic" ,time: 3.55}]
begin
    list_of_activities = JSON.parse(File.read('Data.json'),:symbolize_names => true)
rescue Errno::ENOENT => e
    list_of_activities = []
end

weekend = WeekendList.new(list_of_activities)
options = ""
while(options!="quit")
    puts "What would like to do for your weekends? (options: decide/add activity/quit)"
    options = gets.chomp
    case options
    when "decide"
        weekend.decide
    when "add activity"
        weekend.add
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



