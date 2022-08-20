require "test_helper"

class ProductTest < ActiveSupport::TestCase
  
  def setup 
    @user = users(:tony)
    # This code is not idiomatically correct.
    @product = @user.products.build(name: "proudct 1", description: "Lorem ipsum", 
                price: 9.99)
  end

  test "should be valid" do 
    assert @product.valid?
  end

  test "user id should be present" do 
    @product.user_id = nil
    assert_not @product.valid?
  end

  test "name should be present" do 
    @product.name = ""
    assert_not @product.valid?
  end

  test "description should be present" do 
    @product.description = ""
    assert_not @product.valid?
  end

  test "price should be greater than zero" do 
    @product.price = 0
    assert_not @product.valid?
  end

  test "order should be most recent first" do 
    assert_equal products(:most_recent), Product.first
  end
end
