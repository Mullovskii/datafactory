class Habbit < ApplicationRecord
  belongs_to :country
  belongs_to :system
  belongs_to :share
end
