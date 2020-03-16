#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSNumber *priceForExcessItem = [bill objectAtIndex:index];
    
    NSNumber *priceAllItem = [bill valueForKeyPath:@"@sum.self"];
    
    int annaMustPay = ([priceAllItem intValue] - [priceForExcessItem intValue])/2;
    
    if (annaMustPay == [sum intValue]) {
        return @"Bon Appetit";
    } else {
        int brianMustReturn = [sum intValue] - annaMustPay;
        NSString *finalString = @(brianMustReturn).stringValue;
        return finalString;
    }
}

@end
