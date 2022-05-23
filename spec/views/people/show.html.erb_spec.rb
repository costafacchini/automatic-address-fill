require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(code: '123', name: 'City'))
    @street = assign(:city, Street.create!(code: '285', name: 'Street Number 1', city: @city))
    @person = assign(:person, Person.create!(
      name: 'Name',
      postal_code: '1234',
      city: @city,
      street: @street
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1234/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Street Number 1/)
  end
end
