require 'rails_helper'

RSpec.describe PostalCode, type: :model do
  describe '#code' do
    it { is_expected.to validate_presence_of :code }
  end
end
