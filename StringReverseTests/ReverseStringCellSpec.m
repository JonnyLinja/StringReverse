#import <Specta/Specta.h>
#import "Expecta.h"
#import <OCMock/OCMock.h>

#import "ReverseStringCell.h"
#import "NSString+Reversed.h"
//#import "StringReverser.h"

SpecBegin(ReverseStringCell)

describe(@"when cell is loaded", ^{
    it(@"should display reversed label", ^{
        //sut
        ReverseStringCell *cell = [[ReverseStringCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        //expectations
        expect(cell.contentView.subviews).to.contain(cell.reverseLabel);
    });
});

describe(@"when given a string", ^{
    it(@"should display the string in reverse", ^{
        //strings
        NSString *reversedString = @"raboof";
        
        //mocks
        id stringMock = OCMClassMock([NSString class]);
        OCMStub([stringMock reversedString]).andReturn(reversedString);
        id labelMock = OCMClassMock([UILabel class]);
        
        //sut
        ReverseStringCell *cell = [[ReverseStringCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.reverseLabel = labelMock;
        
        //because
        [cell setReversedText:stringMock];
        
        //expectations
        OCMVerify([stringMock reversedString]);
        OCMVerify([labelMock setText:reversedString]);
    });
});

/*
describe(@"when given a string", ^{
    it(@"should display the string in reverse", ^{
        //strings
        NSString *origString = @"foobar";
        NSString *reversedString = @"raboof";
        
        //mocks
        id stringReverserMock = OCMStrictProtocolMock(@protocol(StringReverser));
        OCMStub([stringReverserMock reverseString:origString]).andReturn(reversedString);
        
        //sut
        ReverseStringCell *cell = [[ReverseStringCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.stringReverser = stringReverserMock;
        
        //because
        [cell setReversedText:origString];
        
        //expectations
        OCMVerify([stringReverserMock reverseString:origString]);
        expect(cell.reverseLabel.text).to.equal(reversedString);
    });
});
*/

SpecEnd