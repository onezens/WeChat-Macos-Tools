//
//  main.m
//  testdemo
//
//  Created by wz on 2019/8/15.
//  Copyright © 2019 wz. All rights reserved.
//

#import <Foundation/Foundation.h>
static inline void write_fully(int fd, const char *buffer, size_t length)
{
    while (length) {
        ssize_t result = write(fd, buffer, length);
        if (result == -1)
            break;
        buffer += result;
        length -= result;
    }
}

static inline void write_string(const char *string)
{
    if(string != NULL){
        write_fully(1, string, strlen(string));
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        printf("2323");
        write_string("Hellllll");
        
    }
    return 0;
}
