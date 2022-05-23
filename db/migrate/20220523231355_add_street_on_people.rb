class AddStreetOnPeople < ActiveRecord::Migration[7.0]
  def change
    add_reference :people, :street, index: true, null: false, foreign_key: { on_delete: :restrict }
  end
end
