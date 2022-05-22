class AddCityOnPostalCodes < ActiveRecord::Migration[7.0]
  def change
    add_reference :postal_codes, :city, index: true, null: false, foreign_key: { on_delete: :restrict }
  end
end
