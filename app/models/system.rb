class System < ApplicationRecord
	has_many :habbits
	enum payment_type: [ 'International cards', 'Local cards', 'Online banking', 'E-wallets', 'Prepaid', 'Encashment', 'Cash on delivery']
	enum source_type: ['Adyen', 'Worldpay', 'Xsolla', 'YM', 'Other']
end
