class CreateStreetNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :street_numbers do |t|
      t.string :number
      t.references :street, foreign_key: true

      t.timestamps
    end
  end
end
