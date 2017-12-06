class Website < ApplicationRecord
  belongs_to :country
  belongs_to :company, optional: true
  has_many :traffics, dependent: :destroy
  has_many :countries, through: :traffics
  has_one :setup, dependent: :destroy

  enum category: [ 'Marketplace', 'Electronics', 'Apparel', 'Classifieds', 'Gazette', 'Webservice', 'Food', 'Communications', 'Media', 'Aggregator', 'News', 'Adult', 'Exchange', 'Betting', 'Casino', 'Coupon', 'Tickets', 'Auction', 'Other']
  enum status: [ 'Invalid', 'Awaiting', 'Pipelined', 'Underway', 'Boarded']

  after_create :generate_setup
  after_update :renew_traffic



  def generate_setup
  	setting = Setting.last
  	Setup.create(website_id: self.id, conversion: setting.conversion, average_bill: setting.average_bill, yandex_net_fee: setting.yandex_net_fee, yandex_share: setting.yandex_share)
  end

  def renew_traffic
    self.traffics.each do |traffic|
      unless traffic.mother_country_id == self.country_id
        traffic.update!(mother_country_id: self.country_id)
      end
    end
  end

end
