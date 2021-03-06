require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/people", type: :request do
  let(:city) { City.create!(name: 'City', code: '123') }
  let(:street) { Street.create!(name: 'Rue Number 2', code: '483', city: city) }
  let(:street_number) { StreetNumber.create!(number: '002', street: street) }

  let(:valid_attributes) {
    { name: 'John Doe', city_id: city.id, street_id: street.id, street_number_id: street_number.id }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Person.create! valid_attributes
      get people_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      person = Person.create! valid_attributes
      get person_url(person)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_person_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      person = Person.create! valid_attributes
      get edit_person_url(person)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Person" do
        expect {
          post people_url, params: { person: valid_attributes }
        }.to change(Person, :count).by(1)
      end

      it "redirects to the created person" do
        post people_url, params: { person: valid_attributes }
        expect(response).to redirect_to(person_url(Person.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Person" do
        expect {
          post people_url, params: { person: invalid_attributes }
        }.to change(Person, :count).by(0)
      end

      it "renders a successful response" do
        post people_url, params: { person: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:city2) { City.create!(name: 'City 2', code: '456') }
      let(:street2) { Street.create!(name: 'Rue Number 2', code: '483', city: city2) }
      let(:street_number2) { StreetNumber.create!(number: '002', street: street2) }

      let(:new_attributes) {
        { name: 'John Silva', city_id: city2.id, street_id: street2.id, street_number_id: street_number2.id }
      }

      it "updates the requested person" do
        person = Person.create! valid_attributes
        patch person_url(person), params: { person: new_attributes }
        person.reload
        expect(person.name).to eq('John Silva')
        expect(person.city_id).to eq(city2.id)
        expect(person.street_id).to eq(street2.id)
        expect(person.street_number_id).to eq(street_number2.id)
      end

      it "redirects to the person" do
        person = Person.create! valid_attributes
        patch person_url(person), params: { person: new_attributes }
        person.reload
        expect(response).to redirect_to(person_url(person))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response" do
        person = Person.create! valid_attributes
        patch person_url(person), params: { person: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested person" do
      person = Person.create! valid_attributes
      expect {
        delete person_url(person)
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      person = Person.create! valid_attributes
      delete person_url(person)
      expect(response).to redirect_to(people_url)
    end
  end
end
