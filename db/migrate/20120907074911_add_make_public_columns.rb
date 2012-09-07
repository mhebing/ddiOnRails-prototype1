class AddMakePublicColumns < ActiveRecord::Migration
  def change
    add_column :user_profiles, :make_public, :boolean
    add_column :baskets, :make_public, :boolean
  end
end
