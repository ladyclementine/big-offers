class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :avatar
      t.float :price
      t.string :created_by
      t.boolean :archived, default: false
      t.datetime :archived_at
      t.timestamps
    end
  end
end
