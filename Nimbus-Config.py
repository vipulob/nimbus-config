#!/usr/bin/env python

import sys
import os
import logging

class Nimbus_Config:
    
    def __init__(self,NIMBUS_HOME_DIR):
        
        self.files_to_be_modified = {'common':NIMBUS_HOME_DIR+'/services/etc/nimbus/workspace-service/other/common.conf',
                                     'network_public':NIMBUS_HOME_DIR+'services/etc/nimbus/workspace-service/network-pools/public'}
        
        print self.files_to_be_modified
        
        self.logger = logging.getLogger('nimbus-config')
        hdlr = logging.FileHandler(NIMBUS_HOME_DIR+'/nimbus-config.log')
        formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
        hdlr.setFormatter(formatter)
        self.logger.addHandler(hdlr)
        self.logger.setLevel(logging.DEBUG)
        self.logger.debug("Nimbus Config file")
        
        

if __name__ == "__main__":
    
    print "Nimbus Config script"

    NIMBUS_HOME_DIR = os.getcwd()
    
    nc = Nimbus_Config(NIMBUS_HOME_DIR)
    
    