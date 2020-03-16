#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[s length]];
    for (int i=0; i < [s length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [s characterAtIndex:i]];
        [characters addObject:ichar];
    }
    
    [characters valueForKeyPath:@"self.integerValue"];
    
    int indexFromStart = 0;
    
    if ([n intValue] % 2 == 0) {
        indexFromStart = [n intValue]/2;
    } else {
        indexFromStart = ([n intValue] - 1)/2;
    }
    
    int totalMatch = 0;
    
    for (int i=0; i < indexFromStart; i++) {
        if (characters[i] == characters[characters.count - 1 - i]) {
            totalMatch += 1;
        }
    }
    
    int needToBeAPalindrome = indexFromStart - totalMatch;
    
    if (needToBeAPalindrome > [k intValue]) {
        return @"-1";
    }
    
    if (needToBeAPalindrome == 0) {
        return s;
    }
    
    int firstPartOfPalindrome = 0;
    int maxCount = [n intValue] - 1;
    int secondPartOfPalindrome = maxCount - firstPartOfPalindrome;
    int countOfTry = [k intValue];
    int middle = indexFromStart - 1;
    int elemntOfFirstPartOfPalindrome = [characters[firstPartOfPalindrome] intValue];
    int elementOfSecondPartOfPalindrome = [characters[secondPartOfPalindrome] intValue];
    int countOfIncrease = [k intValue] - needToBeAPalindrome;
    
    while (firstPartOfPalindrome != indexFromStart && secondPartOfPalindrome != middle && countOfTry != 0) {
        
        if (countOfIncrease > 0) {
            [characters replaceObjectAtIndex:firstPartOfPalindrome withObject: [NSNumber numberWithInteger:9]];
            [characters replaceObjectAtIndex:secondPartOfPalindrome withObject: [NSNumber numberWithInteger:9]];
            firstPartOfPalindrome += 1;
            secondPartOfPalindrome -= 1;
            countOfIncrease -= 2;
            elemntOfFirstPartOfPalindrome = [characters[firstPartOfPalindrome] intValue];
            elementOfSecondPartOfPalindrome = [characters[secondPartOfPalindrome] intValue];
        } else if (elemntOfFirstPartOfPalindrome == elementOfSecondPartOfPalindrome) {
                firstPartOfPalindrome += 1;
                secondPartOfPalindrome -= 1;
                elemntOfFirstPartOfPalindrome = [characters[firstPartOfPalindrome] intValue];
                elementOfSecondPartOfPalindrome = [characters[secondPartOfPalindrome] intValue];
        } else if (elemntOfFirstPartOfPalindrome < elementOfSecondPartOfPalindrome) {
                [characters replaceObjectAtIndex:firstPartOfPalindrome withObject:characters[secondPartOfPalindrome]];
                firstPartOfPalindrome += 1;
                secondPartOfPalindrome -= 1;
                countOfTry -= 1;
                elemntOfFirstPartOfPalindrome = [characters[firstPartOfPalindrome] intValue];
                elementOfSecondPartOfPalindrome = [characters[secondPartOfPalindrome] intValue];
            } else {
                [characters replaceObjectAtIndex:secondPartOfPalindrome withObject:characters[firstPartOfPalindrome]];
                firstPartOfPalindrome += 1;
                secondPartOfPalindrome -= 1;
                countOfTry -= 1;
                elemntOfFirstPartOfPalindrome = [characters[firstPartOfPalindrome] intValue];
                elementOfSecondPartOfPalindrome = [characters[secondPartOfPalindrome] intValue];
        }
    }
    
    NSString *result = [characters componentsJoinedByString: @""];
    
    return result;
}

@end
