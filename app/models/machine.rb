class Machine < ApplicationRecord
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
  belongs_to :owner
  validates_presence_of :location

  def average_price
    snacks.average(:price).round(2)
  end
end
