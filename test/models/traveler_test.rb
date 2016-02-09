require 'test_helper'

class TravelerTest < ActiveSupport::TestCase
  def setup
    @traveler = Traveler.new(name:"Ahyun", email:"ahyun@example.com")
  end
 
  test "traveler should be valid" do
    assert @traveler.valid?
  end
 
  test "name should be present" do
    @traveler.name = " "
    assert_not @traveler.valid?
    end
 
  test "name length should not be too long" do
    @traveler.name = "a" * 41
    assert_not @traveler.valid?
  end
 
  test "name length should not be too short" do
    @traveler.name = "aa"
    assert_not @traveler.valid?
  end

  test "email should be present" do
    @traveler.email = " "
    assert_not @traveler.valid?
  end
 
  test "email within the length bound" do
    @traveler.email = "a"*101 + "@example.com"
    assert_not @traveler.valid?
  end
 
  test "email must be unique" do
    dup_traveler = @traveler.dup
    dup_traveler.email = @traveler.email.upcase
    @traveler.save
    assert_not dup_traveler.valid?
    end
 
  test "email validation must accept valid addresses" do
    valid_addresses = %w[user@example.com R_TDD_DS@eee.hello.org user.name@eem.eu hello+world@exp.cm]
    valid_addresses.each do |va|
      @traveler.email = va
      assert @traveler.valid?, '#{va.inspect} should be valid'
    end
  end
 
  test "email validation must reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@eem. hoo@hello+world.com]
    invalid_addresses.each do |ia|
      @traveler.email = ia
      assert_not @traveler.valid?, '#{ia.inspect} should be invalid'
    end  
  end
end