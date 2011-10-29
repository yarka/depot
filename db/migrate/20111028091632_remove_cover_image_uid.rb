class RemoveCoverImageUid < ActiveRecord::Migration
  def up
    remove_column :products, :cover_image_uid
  end

  def down
    add_column :products, :cover_image_uid, :integer
  end
end
