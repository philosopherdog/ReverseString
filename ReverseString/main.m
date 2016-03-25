//
//  main.m
//  ReverseString
//
//  Created by steve on 2016-03-25.
//  Copyright © 2016 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 Question 1:
 -----------
 Write a command line app in Objective-C that takes an NSString and returns the string reversed.
 reverseString:(“hello world”) -> “dlrow olleh”
 */

/*
 Explanation:
 ------------
 There are lots of ways to do this.
 You could write a loop and slice off each single string and put the string back together.
 I'll show 2 ways. 1) looping backwards using a mutable string, and 1) looping forward and adding the slice to the front of the result.
 
 */


//
NSString* reverseStringUnwindLoop(NSString *inputStr){
    NSInteger length = inputStr.length;
    // early return
    if (length <= 1) {
        return inputStr;
    }
    NSMutableString *result = [[NSMutableString alloc] init];
    // reverse for loop (not really necessary)
    for (NSInteger i = length-1; i > -1; --i) {
        NSRange range = NSMakeRange(i, 1);
        NSString *slice = [inputStr substringWithRange:range];
        [result appendString:slice];
    }
    return result;
}

NSString *reverseStringAppendToFront(NSString* inputStr) {
    
    NSInteger length = inputStr.length;
    if (length <= 1) {
        return inputStr;
    }
    
    NSString *result = @"";
    
    for (NSInteger i = 0; i < length; ++i) {
        NSRange range = NSMakeRange(i, 1);
        NSString *slice = [inputStr substringWithRange:range];
        result = [slice stringByAppendingString:result];
    }
    return result;
}

int main(int argc, const char * argv[]) {
    
    NSString *r1 = reverseStringUnwindLoop(@"hello world");
    NSLog(@"%@", r1);
    
    NSString *r2 = reverseStringAppendToFront(@"hello world");
    NSLog(@"%@", r2);
    return 0;
}
