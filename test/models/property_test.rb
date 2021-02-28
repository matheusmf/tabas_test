require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  test "property_count" do
    assert_equal 2, Property.count
  end
  test "new_property" do
    Property.new(name: "Tabas 01").save
    assert_equal 3, Property.count
  end
  test "required_name" do
    property = Property.new
    assert_equal property.save, false
  end
end
