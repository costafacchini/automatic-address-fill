require 'rails_helper'

RSpec.describe 'people/index', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(code: '123', name: 'City'))

    assign(:people, [
      Person.create!(
        name: 'Name',
        postal_code: '1234',
        city: @city
      ),
      Person.create!(
        name: 'Name',
        postal_code: '1234',
        city: @city
      )
    ])
  end

  it 'renders a list of people' do
    render
    assert_select 'span', text: 'Name'.to_s, count: 2
    assert_select 'span', text: '1234'.to_s, count: 2
    assert_select 'span', text: 'City'.to_s, count: 2
  end
end
