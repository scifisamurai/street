require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
    login_as users(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference("LineItem.count") do
      post line_items_url, params: { product_id: products(:pragprog).id }
    end

    follow_redirect!

    assert_select "h2", "Your Cart"
    assert_select "td", "The Pragmatic Programmer"
  end

  test 'should create line item via turbo-stream' do
    assert_difference("LineItem.count") do
      post line_items_url, params: { product_id: products(:pragprog).id },
        as: :turbo_stream
    end

    assert_response :success
    assert_match /<tr class="line-item-highlight">/, @response.body
  end

  test 'should add one line item per unique products in a cart' do
    # initially our session doesn't exist
    p1_id = products(:one).id
    p2_id = products(:two).id
    2.times do
      post line_items_url, params: { product_id: p1_id }
    end
    post line_items_url, params: { product_id: p2_id }

    items = LineItem.where(cart_id: session[:cart_id], product_id: p1_id)
    assert_equal(items.count, 1)
    assert_equal(items.first.quantity, 2)

    items = LineItem.where(cart_id: session[:cart_id], product_id: p2_id)
    assert_equal(items.count, 1)
    assert_equal(items.first.quantity, 1)
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: {
      line_item: { product_id: @line_item.product_id }
    }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference("LineItem.count", -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to cart_url(@line_item.cart)
  end
end
