class Snack < ApplicationRecord
  has_many :machine_snacks, dependent: :destroy
  has_many :machines, through: :machine_snacks
  validates_presence_of :name
  validates :price, numericality: { greater_than: 0 }
end