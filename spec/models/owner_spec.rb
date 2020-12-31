require 'rails_helper'

describe Owner do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  
  describe 'relationships' do
    it { should have_many(:machines) }
  end
end
