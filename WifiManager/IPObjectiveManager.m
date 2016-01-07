//
//  IPObjectiveManager.m
//  WifiManager
//
//  Created by Andrii Shchudlo on 31.12.15.
//  Copyright © 2015 WarWar. All rights reserved.
//

#import "IPObjectiveManager.h"
#import "getgateway.h"
#import <arpa/inet.h>

@implementation IPObjectiveManager

- (NSString *)getGatewayIP
{
    NSString *ipString = @"";
    struct in_addr gatewayaddr;
    int r = getdefaultgateway(&(gatewayaddr.s_addr));
    if(r >= 0)
    {
        ipString = [NSString stringWithFormat: @"%s",inet_ntoa(gatewayaddr)];
    }
    
    return ipString;
}

@end
