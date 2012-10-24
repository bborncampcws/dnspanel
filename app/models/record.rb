class TargetValidator <  ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    if !(record.recordType=~/IN.A/).nil? and !(value=~/[A-z]/).nil?
      record.errors[:name]<<'A Record must be IP address'
    end
  end
end

class Record < ActiveRecord::Base
  belongs_to :zone
  attr_accessible :source, :target, :recordType
  validates :recordType, :inclusion => {:in => ['IN MX 0','IN MX 10','IN MX 20', 'IN A', 'IN CNAME'], :message=> "%{value} is not an allowable record type"}
  validates :target, :presence=>true, :target=>true
  validates :source, :presence=>true
end
