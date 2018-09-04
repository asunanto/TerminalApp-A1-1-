require 'test/unit'
require_relative '../WeekendDecider'

class WeekendDeciderTest < Test::Unit::TestCase
    def test_add
        weekend = WeekendList.new([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'}])
        last = weekend.add
        assert_equal({activity: 'gym', time: '2'},last)
    end
end
