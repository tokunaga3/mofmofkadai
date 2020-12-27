class Property < ApplicationRecord
  has_many :moyoriekis
  accepts_nested_attributes_for :moyoriekis,allow_destroy: true
end
