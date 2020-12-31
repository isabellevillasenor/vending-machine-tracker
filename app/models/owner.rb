class Owner < ApplicationRecord
  has_many :machines, dependent: :destroy
  validates_presence_of :name

end
