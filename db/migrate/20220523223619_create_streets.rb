class CreateStreets < ActiveRecord::Migration[7.0]
  def change
    create_table :streets do |t|
      t.string :name
      t.string :code
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
