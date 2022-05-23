require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(code: '123', name: 'City'))
    @person = assign(:person, Person.create!(
      name: 'Name',
      postal_code: '1234',
      city: @city
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1234/)
    expect(rendered).to match(/City/)
  end
end
