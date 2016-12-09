class AddFriendlyIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :friendly_id, :string
  end
end
