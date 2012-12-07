class TargetValidator <  ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    if !(record.recordType=~/IN.A/).nil? and !(value=~/[A-z]/).nil?
      record.errors[:name]<<'A Record must be IP address'
    elsif !(record.recordType=~/IN.MX/).nil? and (value=~/^[0-9]* /).nil?
      record.errors[:name]<<'MX Records must hava a priority. EX: 10 example.com'
    end
    
  end
end

class Record < ActiveRecord::Base
  belongs_to :zone
  attr_accessible :source, :target, :recordType, :zone
  validates :recordType, :inclusion => {:in => ['IN MX','IN A', 'IN CNAME'], :message=> "%{value} is not an allowable record type"}
  validates :target, :presence=>true, :target=>true
  validates :source, :presence=>true
  before_save :update_zone
  before_destroy :update_zone

  def update_zone 
    self.zone.update_serial
  end
  
end
