require 'test/unit'
require_relative '../WeekendList'
require_relative 'fake_io'
# When running this file please change DEBUG_MODE = true
# Also thanks for the fake_io class you made Matt :D
class WeekendDeciderTest < Test::Unit::TestCase
    
    def test_add
        out = fake_io(['gym','2','y']) do
            weekend = WeekendList.new([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'}])
            weekend.add
        end
        assert_includes(out, {activity: 'gym', time: '2'}.to_s )
    end


    def test_decide
        out = fake_io(['quit']) do
            weekend = WeekendList.new([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'}])
            weekend.decide
        end
        assert_includes(out, 'true')
    end
 

    def test_delete
        out = fake_io(['delete']) do
            weekend = WeekendList.new([{activity: 'swimming', time: '2'},{activity: 'study', time: '2'}])
            weekend.decide
        end
        assert_includes(out, 'false')
    end


end
