require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @user = users(:amybobamy)
    # This code is not idiomatically correct.
    @event = @user.events.build(title: "Lorem ipsum", 
                                event_date: "2017-12-01 15:15:15", description: "Oh this is my event.")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "creator id should be present" do
    @event.creator = nil
    assert_not @event.valid?
  end
end
