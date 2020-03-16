#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray *operationArray = [NSMutableArray arrayWithArray:array];
    
    NSNumber *maxNumber = [operationArray valueForKeyPath:@"@max.self"];
    NSNumber *minNumber = [operationArray valueForKeyPath:@"@min.self"];
    
    NSMutableArray *arrayWithoutMin = [NSMutableArray arrayWithArray:operationArray];
    [arrayWithoutMin removeObject:minNumber];
    
    NSMutableArray *arrayWithoutMax = [NSMutableArray arrayWithArray:operationArray];
    [arrayWithoutMax removeObject:maxNumber];
    
    NSNumber *sumWithoutMin = [arrayWithoutMin valueForKeyPath:@"@sum.self"];
    NSNumber *sumWithoutMax = [arrayWithoutMax valueForKeyPath:@"@sum.self"];
    
    NSArray *resultArray = [NSArray arrayWithObjects:sumWithoutMax, sumWithoutMin, nil];
    
    return resultArray;
}

@end
