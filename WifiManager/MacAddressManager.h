//
//  MacAddressManager.h
//  WifiManager
//
//  Created by Andrii Shchudlo on 31.12.15.
//  Copyright © 2015 WarWar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#include <sys/param.h>
#include <sys/file.h>
#include <sys/socket.h>
#include <sys/sysctl.h>

#include <net/if.h>
#include <net/if_dl.h>
#include "if_types.h"

#if TARGET_IPHONE_SIMULATOR
#include <net/route.h>
#else
#include "route.h"
#endif

#include "if_ether.h"
#include <netinet/in.h>


#include <arpa/inet.h>

#include <err.h>
#include <errno.h>
#include <netdb.h>

#include <paths.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

@interface MacAddressManager : NSObject
{
    int nflag;
}

- (NSString*) getMacFromIp: (char*)ip;

@end
