class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    freebies.exists?(item_name: item_name)
  end

  def give_away(dev, freebie)
    received_one?(freebie.item_name) ? freebie.update(dev_id: dev.id) : "#{name} does not own #{freebie.item_name}"
  end

end
