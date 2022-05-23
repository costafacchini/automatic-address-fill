require 'rails_helper'

RSpec.describe 'people/edit', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(code: '123', name: 'City'))
    @person = assign(:person, Person.create!(
      name: 'MyString',
      postal_code: '1234',
      city: @city
    ))
  end

  it 'renders the edit person form' do
    render

    assert_select 'form[action=?][method=?]', person_path(@person), 'post' do

      assert_select 'input[name=?]', 'person[name]'

      assert_select 'input[name=?]', 'person[postal_code]'

      assert_select 'select[name=?]', 'person[city_id]'
    end
  end
end
