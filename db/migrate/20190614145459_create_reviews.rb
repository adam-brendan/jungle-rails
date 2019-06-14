class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.string :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
