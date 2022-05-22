class CreatePostalCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :postal_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
