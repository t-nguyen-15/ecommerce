class RemoveNoOfStarsFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :no_of_stars, :string
  end
end
