#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
        NSMutableArray *numberArray = [NSMutableArray array];
        [s enumerateSubstringsInRange:NSMakeRange(0, [s length])
                                    options:(NSStringEnumerationByComposedCharacterSequences)
                                 usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
            [numberArray addObject:substring];
        }];
        
    //    for (NSString *i in numberArray){
    //        NSLog(@"%@",i);
    //    }
        
        NSInteger numberOfChecks = 0, maxValue = 0;
        NSInteger size = [n integerValue];
        
        //092282
        for (long i = 0, j = size - 1; i < size / 2; i++, j--) {
            NSInteger firstElement = [[numberArray objectAtIndex:i] integerValue];
            NSInteger secondElement = [[numberArray objectAtIndex:j] integerValue];
            
            if (firstElement != secondElement) {
                NSInteger largerElement = MAX(firstElement, secondElement);
            
                if (maxValue < largerElement) {
                    maxValue = largerElement;
                }
            
                numberOfChecks++;
            }
        }
        
        if (numberOfChecks > [k integerValue]) {
            return @"-1";
        }
        
        for (long i = 0, j = size - 1; i < size / 2; i++, j--) {
            NSInteger firstElement = [[numberArray objectAtIndex:i] integerValue];
            NSInteger secondElement = [[numberArray objectAtIndex:j] integerValue];
            
            if (firstElement != secondElement) {
                numberArray[i] = [NSNumber numberWithInteger:maxValue];
                numberArray[j] = [NSNumber numberWithInteger:maxValue];
            }
        }
        
        return [numberArray componentsJoinedByString:@""];
}

@end
