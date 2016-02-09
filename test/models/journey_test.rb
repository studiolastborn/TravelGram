require 'test_helper'

class JourneyText < ActiveSupport::TestCase
  def setup
    @journey = Journey.new(title:"Christmas trip", location: "Switzerland", 
         description: "Snow was everywhere, and the view was awesome!")
  end
  test "journey should be valid" do
    assert @journey.valid?
  end
  test "name should be present" do
    @journey.title = ""
    assert_not @journey.valid?
    end
end