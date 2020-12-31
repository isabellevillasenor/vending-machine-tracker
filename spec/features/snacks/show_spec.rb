require 'rails_helper'

describe 'Snack Show Page' do
  before :each do 
    @o1 = Owner.create!(name: 'Owner 1')
    @o2 = Owner.create!(name: 'Owner 2')

    @m1 = @o1.machines.create!(location: 'denver')
    @m2 = @o2.machines.create!(location: 'utrecht')

    @takis = Snack.create!(name: 'Takis', price: 1.00)
    @beuno = Snack.create!(name: 'Beuno', price: 1.25)
    @stroop = Snack.create!(name: 'Stroopwaffel', price: 2.00)

    MachineSnack.create!(machine: @m1, snack: @takis)
    MachineSnack.create!(machine: @m2, snack: @beuno)
    MachineSnack.create!(machine: @m2, snack: @stroop)
    MachineSnack.create!(machine: @m2, snack: @takis)

    visit snack_path(@takis)
  end

  it 'should display snack name and price' do
    expect(page).to have_content(@takis.name)
    expect(@takis.name).to eq('Takis')

    expect(page).to have_content('Price: ')
    expect(page).to have_content(@takis.price)
    expect(@takis.price).to eq(1)
  end
  
  it 'should have machine name, num of snacks and avg price' do
    expect(page).to have_content('Locations:')
    expect(page).to have_content(@m1.location.capitalize)
    expect(@m1.location.capitalize).to eq('Denver')

    expect(page).to have_content(@m2.location.capitalize)
    expect(@m2.location.capitalize).to eq('Utrecht')
  end

  it 'should have a count of all snacks each machine has' do
    expect(page).to have_content('kinds of snacks')
    expect(page).to have_content(@m1.snack_count)
    expect(@m1.snack_count).to eq(1)

    expect(page).to have_content(@m2.snack_count)
    expect(@m2.snack_count).to eq(3)
  end

  it 'should have an average price for all snacks each machine has' do
    expect(page).to have_content('average price of $')
    expect(page).to have_content(@m1.average_price)
    expect(@m1.average_price).to eq(1)

    expect(page).to have_content(@m2.average_price)
    expect(@m2.average_price).to eq(0.142e1)
  end
end