class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    Freebie.create(item_name: item_name, value: value, dev_id: dev.id, company_id: id)
  end
  
  def self.oldest_company
    #Company.minimum(:founding_year)
    Company.order(:founding_year).first
  end

end
