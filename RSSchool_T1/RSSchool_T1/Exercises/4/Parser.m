#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray <NSString*> *resultArray = [NSMutableArray array];
    
    for (int i = 0; i < string.length; i++) {
        char character = [string characterAtIndex:i];
        
        if (character == '(' || character == '[' || character == '<') {
            NSInteger endIndex = [self getEndIndex:string openBracketType:character startIndex:i];
            if (endIndex > 0) {
                [resultArray addObject: [string substringWithRange:NSMakeRange(i + 1, endIndex - 1 - i)]];
            }
        }
    }
    return resultArray;
}

- (NSInteger)getEndIndex:(NSString *)string openBracketType:(char)openBracket startIndex:(NSInteger)index {
    NSMutableArray <NSNumber*> *stack= [NSMutableArray array];
    char closeBracket;
    
    if (openBracket == '(') {
        closeBracket = ')';
    }
    else if (openBracket == '[') {
        closeBracket = ']';
    }
    else if (openBracket == '<') {
        closeBracket = '>';
    }
    else return -1;
    
    for (NSInteger i = index; i < string.length; i++) {
        char character = [string characterAtIndex:i];
        
        if (character == openBracket) {
            [stack addObject:@(i)];
        }
        else if (character == closeBracket) {
            [stack removeLastObject];
            if (stack.count == 0) {
                return i;
            }
        }
    }
    return -1;
}

@end
