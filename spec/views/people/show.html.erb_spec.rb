require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(code: '123', name: 'City'))
    @street = assign(:street, Street.create!(code: '285', name: 'Street Number 1', city: @city))
    @street_number = assign(:street_number, StreetNumber.create!(number: '001', street: @street))
    @person = assign(:person, Person.create!(
      name: 'Name',
      postal_code: '1234',
      city: @city,
      street: @street,
      street_number: @street_number
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1234/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Street Number 1/)
    expect(rendered).to match(/001/)
  end
end
