class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :location
      t.string :image
      t.string :description
      t.integer :lengthOfStay
      t.belongs_to :user
    end
  end
end
