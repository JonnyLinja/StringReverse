//
//  ReverseStringCell.m
//  StringReverse
//
//  Created by N A on 5/21/15.
//  Copyright (c) 2015 N A. All rights reserved.
//

#import "ReverseStringCell.h"
#import "NSString+Reversed.h"

@implementation ReverseStringCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.reverseLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 44)];
        [self.contentView addSubview:self.reverseLabel];
    }
    return self;
}

- (void) setReversedText:(NSString *)pText {
    NSString *reversedString = [pText reversedString];
    self.reverseLabel.text = reversedString;
}

/*
- (void) setReversedText:(NSString *)pText {
    NSString *reversedString = [self.stringReverser reverseString:pText];
    self.reverseLabel.text = reversedString;
}
*/

@end
