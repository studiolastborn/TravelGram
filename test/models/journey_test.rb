require 'test_helper'

class JourneyTest < ActiveSupport::TestCase
  def setup
    @traveler = Traveler.create(name:"Ahyun", email:"ahyun@example.com")
    @journey = @traveler.journeys.new(title:"Christmas trip", location: "Switzerland", 
         description: "Snow was everywhere, and the view was awesome!")
  end
  test "journey should be valid" do
    assert @journey.valid?
  end
  test "traveler_id should be valid" do
    @journey.traveler_id = nil
    assert_not @journey.valid?
  end
  test "title should be present" do
    @journey.title = ""
    assert_not @journey.valid?
  end
  test "title length should not be too long" do
    @journey.title = "a" * 101
    assert_not @journey.valid?
  end
  test "title length should not be too short" do
    @journey.title = "aaaa"
    assert_not @journey.valid?
  end
  test "location should be present" do
    @journey.location = ""
    assert_not @journey.valid?
  end
  test "location length should not be too long" do
    @journey.location = "a" * 151
    assert_not @journey.valid?
  end
  test "location length should not be too short" do
    @journey.location = "aaaa"
    assert_not @journey.valid?
  end
  test "description should be present" do
    @journey.description = ""
    assert_not @journey.valid?
  end
  test "description length should not be too long" do
    @journey.description = "a" * 501
    assert_not @journey.valid?
  end
  test "description length should not be too short" do
    @journey.description = "a"*19
    assert_not @journey.valid?
  end
end