require 'rails_helper'

describe 'Machine Show Page' do
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

    visit machine_path(@m1)
  end

  it 'should display the location of the machine' do
    expect(page).to have_content('Denver Vending Machine')
  end

  it 'should display all associated snack names and price' do
    expect(page).to have_content('Snacks:')
    expect(page).to have_content(@takis.name)
    expect(page).to have_content(@takis.price)
    expect(page).to have_content(@snv.name)
    expect(page).to have_content(@snv.price)
    expect(page).to have_content(@twix.name)
    expect(page).to have_content(@twix.price)

    expect(page).not_to have_content(@stroop.name)
  end
end