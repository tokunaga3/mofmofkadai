class Property < ApplicationRecord
  has_many :moyoriekis, dependent: :destroy
  accepts_nested_attributes_for :moyoriekis,allow_destroy: true,reject_if: :all_blank
end
