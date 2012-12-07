class ZoneUpdater < ActiveRecord::Base
  belongs_to :zone
  attr_accessible :algorithim, :key, :server

  #send updates to dns server
  def push
    res = Dnsruby::Resolver.new(self.server)
    res.dnssec=false
    tsig=Dnsruby::RR.create({:name=>zone.domain,:type="TSIG",key=>self.key})
    update=Dnsruby::Update.new(zone.domain)
    #addtotheupdate
    tsig.apply(update) 
    response=res.send_message(update)
  end

  #update this zone file from DNS server
  def pull
    zt=Dnsruby::ZoneTransfer.new
    zt.transfer_type=Dnsruby::Types.AXFR
    zt.server=self.server
    zone=zt.transfer(self.zone.domain)
    zone.tsig=self.zone.domain+".", self.key
    soa=zone[0]
    recl=zone[1]
    for record in zone
      src,type,target=record.to_s.match(/([A-z\.0-9]*)[0-9\t ]*(IN\t[A-z]*)\t([A-z0-9\. ]*)/).captures
      if type=='IN\tMX' or type=='IN\tA' or type=='IN\tCNAME'
	createRecord(record)
      elsif type=='IN\tSOA'
        updateSerial(record)
      end
  end
end
