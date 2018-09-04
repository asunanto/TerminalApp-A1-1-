class WeekendList
    attr_accessor :list
    def initialize(list)
        @list = list
    end
    def add(hash)
        @list << hash
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

puts "What would like to do for your weekends? (options: decide/add activity/quit)"
options = gets.chomp

case options
    when "d"
        puts weekend.decide
    when "add activity"
    when "quit"
    else
        puts "Can you please enter the right options? Please check the spelling :D"
end
# hash = {activity: "soccer", time:1}
# weekend.add(hash)
# puts weekend.list
# puts
# weekend.delete("tennis")
# puts weekend.list



