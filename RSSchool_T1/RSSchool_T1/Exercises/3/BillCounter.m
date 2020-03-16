#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSInteger allSum = 0;
    
    NSMutableArray *billArray = [NSMutableArray arrayWithArray:bill];
    [billArray removeObjectAtIndex:index];
    
    for (NSNumber *num in billArray)
    {
        allSum += [num intValue];
    }
    
    NSInteger refundValue = [sum integerValue] - allSum/2;
    
    if ([sum integerValue] == allSum/2) {
        return @"Bon Appetit";
    }
    else {
        return [NSString stringWithFormat:@"%li", refundValue];
    }
}

@end
