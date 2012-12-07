class Zone < ActiveRecord::Base
  attr_accessible :defaultIp, :domain, :serial
  has_many :records, :dependent => :destroy
  has_one :zone_updater, :dependent => :destroy
  accepts_nested_attributes_for :records
  validates :domain, :uniqueness => true

  def update_serial
    day=Time.now.strftime("%Y%m%d").to_i*100
    serialdate=self.serial.to_s.to_i
    if day>serialdate
      self.serial=day
    else
      self.serial=self.serial+1
    end
    self.save
  end
end
