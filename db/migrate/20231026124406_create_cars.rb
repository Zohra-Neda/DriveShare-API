class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :image
      t.string :description
      t.boolean :available

      t.timestamps
    end
  end
end
