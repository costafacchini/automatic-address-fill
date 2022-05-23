require 'rails_helper'

RSpec.describe Person, type: :model do
  describe '#city' do
    it { is_expected.to belong_to(:city).required }
  end

  it { is_expected.to validate_presence_of :name }
end
