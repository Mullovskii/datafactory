class Traffic < ApplicationRecord
  belongs_to :country
  belongs_to :website
end
