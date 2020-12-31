class Machine < ApplicationRecord
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
  belongs_to :owner
  validates_presence_of :location

end
