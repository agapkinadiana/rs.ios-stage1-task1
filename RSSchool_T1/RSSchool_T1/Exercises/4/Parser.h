#import <Foundation/Foundation.h>

@interface Parser : NSObject

- (NSArray <NSString*>*)parseString: (NSString*)string;
- (NSInteger)getEndIndex:(NSString *)string openBracketType:(char)openBracket startIndex:(NSInteger)index;

@end

