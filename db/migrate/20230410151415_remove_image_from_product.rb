class RemoveImageFromProduct < ActiveRecord::Migration[7.0]
  def self.up
    remove_column :products, :image
  end
end

