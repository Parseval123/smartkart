require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product=Product.create(name:"Pasta", label:"Barilla", package:"500 g")
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?
  end

  test "label should be present" do
    @product.label = ""
    assert_not @product.valid?
  end

  test "package should be present" do
    @product.package = ""
    assert_not @product.valid?
  end

  test "name should not be too long" do
    @product.name = "a" * 51
    assert_not @product.valid?
  end

  test "label should not be too long" do
    @product.label = "a" * 51
    assert_not @product.valid?
  end

  test "package should not be too long" do
    @product.package = "a" * 51
    assert_not @product.valid?
  end
end
