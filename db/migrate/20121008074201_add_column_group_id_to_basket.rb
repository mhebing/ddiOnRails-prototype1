class AddColumnGroupIdToBasket < ActiveRecord::Migration
  def change
    add_column :baskets, :group_id, :integer
  end
end
