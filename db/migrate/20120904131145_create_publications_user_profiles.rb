class CreatePublicationsUserProfiles < ActiveRecord::Migration
  def change
    create_table :publications_user_profiles, id: false do |t|
      t.integer :publication_id
      t.integer :user_profile_id
    end
  end
end
