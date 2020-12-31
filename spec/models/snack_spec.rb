require 'rails_helper'

describe Snack do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  describe 'relationships' do
    it { should have_many(:machine_snacks) }
    it { should have_many(:machines).through(:machine_snacks) }
  end
end