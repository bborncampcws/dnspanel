class Zone < ActiveRecord::Base
  attr_accessible :defaultIp, :domain, :serial
  has_many :records
end
