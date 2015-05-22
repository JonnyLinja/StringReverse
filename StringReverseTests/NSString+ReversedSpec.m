#import <Specta/Specta.h>
#import "Expecta.h"
#import <OCMock/OCMock.h>

#import "NSString+Reversed.h"

SpecBegin(NSStringReversedSpec)

describe(@"when given a string", ^{
    it(@"should return reversed string", ^{
        //strings
        NSString *origString = @"foobar";
        NSString *reversedString = @"raboof";

        //because
        NSString *result = [origString reversedString];
        
        //expect
        expect(result).to.equal(reversedString);
    });
});

SpecEnd
