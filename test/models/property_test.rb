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

  test "property_with_photos" do
    property = properties(:itaim_bibi)
    property.photos.create(name: "photo 1", url: "url photo 1")
    property.save
    assert_equal property.photos.length, 1
  end

  test "property_cover" do
    property = properties(:jardim_paulista)
    property.photos.create(name: "photo 1", url: "url photo 1")
    property.photos.create(name: "photo 2", url: "url photo 2")
    property.photos.create(name: "photo 3", url: "url photo 3")
    property.photos.create(name: "photo 4", url: "url photo 4")
    property.save
    assert_equal property.cover.name, "photo 3"
  end

  test "property_without_ cover" do
    property = properties(:itaim_bibi)
    property.photos.create(name: "photo 1", url: "url photo 1")
    property.save
    assert_nil property.cover
  end
end
