#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    if (array.count == 0) {
        return nil;
    }
    
    if (array.count == 1) {
        return @[array[0], array[0]];
    }
    
    NSInteger min = 0, max = 0;
    
    NSArray *sortedAsc = [array sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]]];
    NSArray *sortedDesc = [array sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:nil ascending:NO]]];
    
    for (int i = 1; i < array.count; i++) {
        min += [sortedDesc[i] intValue];
        max += [sortedAsc[i] intValue];
    }
    
    NSNumber *resultMin = [NSNumber numberWithLong:min];
    NSNumber *resultMax = [NSNumber numberWithLong:max];
                
    return @[resultMin, resultMax];
}

@end
