//
//  ReverseStringCell.h
//  StringReverse
//
//  Created by N A on 5/21/15.
//  Copyright (c) 2015 N A. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "StringReverser.h"

@interface ReverseStringCell : UITableViewCell
@property (nonatomic, strong) UILabel *reverseLabel;
//@property (nonatomic, strong) id<StringReverser> stringReverser;
- (void) setReversedText:(NSString *)pText;
@end
