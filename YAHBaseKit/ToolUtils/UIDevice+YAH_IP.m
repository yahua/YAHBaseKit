//
//  UIDevice+YAH_IP.m
//  YAHBaseKit
//
//  Created by yahua on 2021/2/3.
//  Copyright © 2021 yahua. All rights reserved.
//

#import "UIDevice+YAH_IP.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
 #define IOS_CELLULAR    @"pdp_ip0"//有些分配的地址为en0 有些分配的en1
#define IOS_WIFI2       @"en2"
#define IOS_WIFI1       @"en1"
#define IOS_WIFI        @"en0"//
#define IOS_VPN       @"utun0"  //vpn很少用到可以注释
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@implementation UIDevice (YAH_IP)

+ (NSString *)yah_IPAddress {
    
    //从字典中按顺序查询 查询到不为空即停止（顺序为4G(3G)、Wi-Fi、局域网）
        NSArray *searchArray =
        @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_WIFI2 @"/" IP_ADDR_IPv4, IOS_WIFI1 @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv4,
           IOS_VPN @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_WIFI2 @"/" IP_ADDR_IPv6, IOS_WIFI1 @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv6] ;
     
        NSDictionary *addresses = [self getIPAddresses];
     
        __block NSString *address;
        [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
            {
                address = addresses[key];
                if(address) *stop = YES;
            } ];
        return address ? address : @"0.0.0.0";
}

//获取所有相关IP信息
+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
 
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

@end
