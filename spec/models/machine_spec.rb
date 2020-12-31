require 'rails_helper'

describe Machine do
  describe 'validations' do
    it { should validate_presence_of(:location) }
  end
  
  describe 'relationships' do
    it { should belong_to(:owner) }
    it { should have_many(:machine_snacks) }
    it { should have_many(:snacks).through(:machine_snacks) }
  end
end
