require 'rails_helper'

RSpec.describe 'people/new', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(code: '123', name: 'City'))

    assign(:person, Person.new(
      name: 'MyString',
      postal_code: '1234',
      city: @city
    ))
  end

  it 'renders new person form' do
    render

    assert_select 'form[action=?][method=?]', people_path, 'post' do

      assert_select 'input[name=?]', 'person[name]'

      assert_select 'input[name=?]', 'person[postal_code]'

      assert_select 'select[name=?]', 'person[city_id]'
    end
  end
end
