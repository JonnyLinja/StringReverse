//
//  NSString+Reversed.m
//  StringReverse
//
//  Created by N A on 5/21/15.
//  Copyright (c) 2015 N A. All rights reserved.
//

#import "NSString+Reversed.h"

@implementation NSString (Reversed)

- (NSString *)reversedString {
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:self.length];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              [reversedString appendString:substring];
                          }];
    
    return [reversedString copy];
}

@end
