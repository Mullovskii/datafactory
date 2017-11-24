class Website < ApplicationRecord
  belongs_to :country
  belongs_to :company, optional: true
  has_many :traffics, dependent: :destroy
  has_many :countries, through: :traffics
  has_one :setup, dependent: :destroy

  enum category: [ 'Marketplace', 'Electronics', 'Apparel', 'Classifieds', 'Webservice', 'Food', 'Communications', 'Media', 'Aggregator', 'News', 'Porno', 'Exhange', 'Betting', 'Casino', 'Coupon', 'Tickets', 'Auction'. 'Other']
  enum status: [ 'Invalid', 'Awaiting', 'Pipelined', 'Underway', 'Boarded']

  after_create :generate_setup



  def generate_setup
  	setting = Setting.last
  	Setup.create(website_id: self.id, conversion: setting.conversion, average_bill: setting.average_bill, yandex_net_fee: setting.yandex_net_fee, yandex_share: setting.yandex_share)
  end

end
