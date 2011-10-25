class AddImageUrl < ActiveRecord::Migration
  def change
    add_column :products, :cover_image_uid, :string
  end
end
