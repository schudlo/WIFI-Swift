//
//  WifiIPManager.swift
//  WifiManager
//
//  Created by Andrii Shchudlo on 31.12.15.
//  Copyright © 2015 WarWar. All rights reserved.
//

import UIKit

class WifiIPManager: NSObject
{
////    let netmask = getIFAddresses().last!.netmask
    
    class var sharedInstance: WifiIPManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: WifiIPManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WifiIPManager()
        }
        return Static.instance!
    }
    
    func getRouterIpAddressString() -> String
    {
        let objectiveIpClass:IPObjectiveManager = IPObjectiveManager()
        return objectiveIpClass.getGatewayIP()
    }
    
    func getRouterMacAddressString() -> String
    {
        let temporaryIpString = getRouterIpAddressString()
        if temporaryIpString == ""
        {
            return ""
        }
        else
        {
            let objectiveCMACManager:MacAddressManager = MacAddressManager()
            let ipString = (temporaryIpString as NSString).UTF8String
            let ip = UnsafeMutablePointer<Int8>(ipString)
            
            return objectiveCMACManager.getMacFromIp(ip)
        }
    }
}
