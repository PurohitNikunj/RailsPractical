class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.decimal :price, precision: 3, scale: 2
      t.belongs_to :author, foreign_key: true

      t.timestamps
    end
  end
end
