require 'rails_helper'

RSpec.describe 'people/index', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(code: '123', name: 'City'))
    @street = assign(:city, Street.create!(code: '285', name: 'Street Number 1', city: @city))
    @street_number = assign(:street_number, StreetNumber.create!(number: '001', street: @street))
    assign(:people, [
      Person.create!(
        name: 'Name',
        postal_code: '1234',
        city: @city,
        street: @street,
        street_number: @street_number
      ),
      Person.create!(
        name: 'Name',
        postal_code: '1234',
        city: @city,
        street: @street,
        street_number: @street_number
      )
    ])
  end

  it 'renders a list of people' do
    render
    assert_select 'span', text: 'Name'.to_s, count: 2
    assert_select 'span', text: '1234'.to_s, count: 2
    assert_select 'span', text: 'City'.to_s, count: 2
    assert_select 'span', text: 'Street Number 1'.to_s, count: 2
    assert_select 'span', text: '001'.to_s, count: 2
  end
end
