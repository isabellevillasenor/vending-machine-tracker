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

  describe 'instance methods' do
    before :each do 
      @o1 = Owner.create!(name: 'Owner 1')
      @m1 = @o1.machines.create!(location: 'denver')
      @takis = Snack.create!(name: 'Takis', price: 1.00)
      @snv = Snack.create!(name: 'Salt and Vinegar Chips', price: 1.00)
      @twix = Snack.create!(name: 'Twix', price: 1.25)
      @stroop = Snack.create!(name: 'Stroopwaffel', price: 2.00)
      MachineSnack.create!(machine: @m1, snack: @takis)
      MachineSnack.create!(machine: @m1, snack: @snv)
      MachineSnack.create!(machine: @m1, snack: @twix)
    end

    describe '#average_price' do
      it 'should return the average price of all snacks in a machine' do
        expect(@m1.average_price).to eq(0.108e1)
      end
    end

    describe '#snack_count' do
      it 'should return the count of all snacks' do
        expect(@m1.snack_count).to eq(3)
      end
    end
  end
end
