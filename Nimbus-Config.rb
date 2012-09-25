#!/usr/bin/env ruby

require('yaml')

class Nimbus
  
  def initialize()
    @@nimbus_home = Dir.pwd
    @@network_file = "#@@nimbus_home/services/etc/nimbus/workspace-service/network-pools/public"
    
    config_file = YAML.load_file('nimbus-config.yaml')
    
    @@IPStart = config_file['IPStart']
    @@Range = config_file['Range']
    
   #puts @@network_file
  end
  
  def add_IPAddresses()
    
    if !File.file?( @@network_file )
      puts " File Doesn't exist"
      exit
    end
    
    aFile = File.new(@@network_file, "a")
    
    x = @@IPStart.match(/(\d+).(\d+).(\d+).(\d+)/)
    
  
    
    for i in (0..@@Range-1)
      
      sum = Integer(x[4]) + i 
      
      ip = x[1]+"."+x[2]+"."+x[3]+"."+String(sum)
      
      aFile.syswrite(ip+"\n")
      
      #puts x[1]+"."+x[2]+"."+x[3]+"."+String(sum)
      #aFile.syswrite(i)
    end
    
    
    
    
  end
  
end




##### This is main program ###################

nimbus = Nimbus.new
nimbus.add_IPAddresses


