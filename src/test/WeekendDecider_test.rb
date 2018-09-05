require 'test/unit'
require_relative '../WeekendDecider'
# When running this file please change DEBUG_MODE = true

class WeekendDeciderTest < Test::Unit::TestCase
    
    def test_add
        weekend = WeekendList.new([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'}])
        list = weekend.add
        assert_equal([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'},{activity: 'gym', time: '2'}],list)
    end
    # test notes - when prompted please enter the following
    # What would you like to add to your fun list?
    # enter: gym
    # How long are you going to spend on this activity?
    # enter: 2

    def test_decide
        weekend = WeekendList.new([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'}])
        bool = weekend.decide
        assert_equal(true,bool)
    end
    # test notes - when prompted please enter the following
    # should I 'activity' for 'time' hours?
    # enter: quit

    def test_delete
        weekend = WeekendList.new([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'}])
        bool = weekend.decide
        assert_equal(false,bool)
    end
    # test notes - when prompted please enter the following
    # should I 'activity' for 'time' hours?
    # enter: delete
    

end
