class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :location
      t.string :image
      t.belongs_to :user
    end
  end
end
