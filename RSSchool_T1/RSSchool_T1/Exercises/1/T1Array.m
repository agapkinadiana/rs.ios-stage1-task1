#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *happyArray = [NSMutableArray arrayWithArray:sadArray];
    
    if (happyArray.count == 0) {
        return @[];
    }
    else {
        BOOL isSad = YES;
        while (isSad) {
            isSad = NO;
            for (int i = 1; i < happyArray.count - 1; i++) {
                if (([happyArray[i - 1] intValue] + [happyArray[i + 1] intValue]) < [happyArray[i] intValue]) {
                    [happyArray removeObjectAtIndex:i];
                    isSad = YES;
                }
            }
        }
        return happyArray;
    }
}

@end
