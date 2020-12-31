require 'rails_helper'

describe 'Owner Machine Index Page' do
  before :each do 
    @o1 = Owner.create!(name: 'Owner 1')
    @m1 = @o1.machines.create!(location: 'denver')
    @m2 = @o1.machines.create!(location: 'utrecht')
    @beuno = Snack.create!(name: 'Beuno', price: 1.25)
    MachineSnack.create!(machine: @m1, snack: @beuno)

  
    visit owner_machines_path(@o1)
  end

  it 'displays all vending machine locations that belong to owner' do
    expect(page).to have_link(@m1.location.capitalize)
    expect(@m1.location.capitalize).to eq('Denver')

    expect(page).to have_link(@m2.location.capitalize)
    expect(@m2.location.capitalize).to eq('Utrecht')
  end

  it 'should redirect when vending machine location is clicked' do
    click_link 'Denver'

    expect(current_path).to eq(machine_path(@m1))
  end
end
