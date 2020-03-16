#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSMutableArray *resultArray = [NSMutableArray new];
    
    NSMutableCharacterSet *characterSet = [[NSMutableCharacterSet alloc] init];
    [characterSet addCharactersInString:@"[<("];
    
    NSRange searchRange = NSMakeRange(0, [string length]);
    
    while (YES) {
        NSRange range = [string rangeOfCharacterFromSet:characterSet options: 0 range: searchRange];
        if (range.location != NSNotFound) {
            NSInteger index = range.location + 1;
            searchRange.location = index;
            searchRange.length = [string length] - index;
            NSInteger index2 = 0;
            
            NSString *string2 = [string substringFromIndex:index];
            NSString *characterAtIndex = [string substringWithRange:NSMakeRange(index - 1, 1)];
            
            if ([characterAtIndex isEqual: @"<"]) {
                NSRange range2 = [string2 rangeOfString:@">"];
                index2 = range2.location;
                
                NSUInteger counter = 0;
                NSString *checkString = [string substringWithRange:NSMakeRange(index, index2)];
                NSRange checkSearchRange = NSMakeRange(0, [checkString length]);
                while (YES) {
                    NSRange checkRange = [checkString rangeOfString:@"<" options: 0 range: checkSearchRange];
                    if (checkRange.location != NSNotFound) {
                        NSInteger checkIndex = checkRange.location + 1;
                        checkSearchRange.location = checkIndex;
                        checkSearchRange.length = [checkString length] - checkIndex;
                        counter += 1;
                    } else {
                        NSString *string3 = [string substringFromIndex:index + 1];
                        NSRange search3 = NSMakeRange(0, [string3 length]);
                        while (counter != -1) {
                            counter -= 1;
                            NSRange range3 = [string3 rangeOfString:@">" options: 0 range: search3];
                            index2 = range3.location + 1;
                            search3.location = index2;
                            search3.length = [string3 length] - index2;
                        }
                        break;
                    }
                }
                
            }
            
            if ([characterAtIndex isEqual: @"["]) {
                NSRange range2 = [string2 rangeOfString:@"]"];
                index2 = range2.location;
                
            }
            
            if ([characterAtIndex isEqual: @"("]) {
                NSRange range2 = [string2 rangeOfString:@")"];
                index2 = range2.location;
            }
            
            NSString *stringToArray = [string substringWithRange:NSMakeRange(index, index2)];
            
            [resultArray addObject:stringToArray];
        } else {
            break;
        }
    }
    
    NSArray *final = [NSArray arrayWithArray:resultArray];
    
    return final;
}

@end
