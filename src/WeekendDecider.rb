class WeekendList
    attr_accessor :list
    def initialize(list)
        @list = list
    end
end

list_of_actities = [{activity: "basketball", time: 1},{activity: "tennis", time:2}]
weekend = WeekendList.new(list_of_actities)
puts weekend.list