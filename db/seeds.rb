Owner.destroy_all
Machine.destroy_all

o1 = Owner.create!(name: 'Owner 1')
o2 = Owner.create!(name: 'Owner 2')

m1 = o1.machines.create!(location: 'denver')
m2 = o2.machines.create!(location: 'utrecht')

takis = Snack.create!(name: 'Takis', price: 1.00)
beuno = Snack.create!(name: 'Beuno', price: 1.25)
snv = Snack.create!(name: 'Salt and Vinegar Chips', price: 1.00)
twix = Snack.create!(name: 'Twix', price: 1.25)
stroop = Snack.create!(name: 'Stroopwaffel', price: 2.00)

MachineSnack.create!(machine: m1, snack: takis)
MachineSnack.create!(machine: m1, snack: snv)
MachineSnack.create!(machine: m1, snack: twix)
MachineSnack.create!(machine: m2, snack: beuno)
MachineSnack.create!(machine: m2, snack: stroop)
MachineSnack.create!(machine: m2, snack: takis)