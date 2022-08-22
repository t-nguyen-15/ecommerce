class AddNoOfStarsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :no_of_stars, :string
  end
end
