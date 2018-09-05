require 'json'
require_relative 'WeekendList'

    begin
        list_of_activities = JSON.parse(File.read('Data.json'),:symbolize_names => true)
    rescue Errno::ENOENT  #catches error when there is no 'Data.json'
        list_of_activities = []
    end

    weekend = WeekendList.new(list_of_activities)
    options = ""
    while(options!="quit")
        puts "What would you like to do for your weekends? (options: decide/add activity/quit)"
        options = gets.chomp
        case options
        when "decide"
            quit = weekend.decide
            exit if(quit == true)
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



