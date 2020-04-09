class AddPhotoToMerchandises < ActiveRecord::Migration[5.2]
  def change
    add_column :merchandises, :photo, :string
  end
end
