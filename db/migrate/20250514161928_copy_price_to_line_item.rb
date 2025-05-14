class CopyPriceToLineItem < ActiveRecord::Migration[8.0]
  def up
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!
    end
  end

  def down
    puts "Nil'ing line item price"
    LineItem.update_all(price: nil)
  end
end
