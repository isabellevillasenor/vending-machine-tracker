require 'rails_helper'

describe 'Owner Index Page' do
  it 'should display a list of owners' do
    o1 = Owner.create!(name: 'Owner 1')
    o2 = Owner.create!(name: 'Owner 2')

    visit owners_path

    expect(page).to have_content(o1.name)
    expect(o1.name).to eq('Owner 1')

    expect(page).to have_content(o2.name)
    expect(o2.name).to eq('Owner 2')
  end
end