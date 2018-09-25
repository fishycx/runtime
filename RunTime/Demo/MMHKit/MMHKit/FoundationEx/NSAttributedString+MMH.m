//
//  NSAttributedString+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/21.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "NSAttributedString+MMH.h"
#import "NSObject+MMH.h"
#import "NSArray+MMH.h"

@implementation NSAttributedString (MMH)

- (CGSize)sizeForSize:(CGSize)size {
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return  rect.size;
}

@end


@implementation NSMutableAttributedString (MMH)

+ (NSMutableAttributedString *)rangeLabelWithContent:(NSString *)content
                                       hltContentArr:(NSArray *)hltContentArr
                                            hltColor:(UIColor *)hltColor
                                         normolColor:(UIColor *)normolColor{
    
    NSMutableArray *hltRangeArr = [NSMutableArray array];
    for (int i = 0;i < hltContentArr.count;i++){
        NSRange range = [content rangeOfString:[hltContentArr objectAtIndex:i]];
        if (range.location != NSNotFound){
            NSValue *rectValue = [NSValue valueWithBytes:&range  objCType:@encode(NSRange)];
            if (rectValue !=nil){
                [hltRangeArr addObject:rectValue];
            }
        }
    }
    NSMutableAttributedString *mutableAttributedString;
    if (content.length){
        mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:content];
    }
    NSMutableArray *rangeTempMutableArr = [NSMutableArray array];
    NSRange zeroRange;
    zeroRange.length = 0;
    zeroRange.location = 0;
    NSValue *zeroRangeValue = [NSValue valueWithBytes:&zeroRange  objCType:@encode(NSRange)];
    [rangeTempMutableArr addObject:zeroRangeValue];
    
    for (int i = 0 ; i < hltRangeArr.count;i++){
        NSRange hltRange = [[hltRangeArr objectAtIndex:i] rangeValue];
        NSRange lastHltRange = [[rangeTempMutableArr lastObject] rangeValue];
        
        // normolRange
        NSRange normolRange;
        normolRange.location = lastHltRange.length + lastHltRange.location;
        normolRange.length = hltRange.location - normolRange.location;
        
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:hltColor range:hltRange];
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:normolColor range:normolRange];
        
        NSValue *rectValue = [NSValue valueWithBytes:&hltRange  objCType:@encode(NSRange)];
        [rangeTempMutableArr addObject:rectValue];
    }
    NSRange lastHltRange = [[rangeTempMutableArr lastObject] rangeValue];
    NSRange lastNormolRange;
    lastNormolRange.location = lastHltRange.length + lastHltRange.location;
    lastNormolRange.length = content.length - lastNormolRange.location;
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:normolColor range:lastNormolRange];
    return  mutableAttributedString;
}

+ (NSMutableAttributedString *)rangeLabelWithContent:(NSString *)content
                                       hltContentArr:(NSArray *)hltContentArr
                                            hltColor:(UIColor *)hltColor
                                         normolColor:(UIColor *)normolColor
                                      setLineSpacing:(CGFloat)lindSpaceing {
    
    NSMutableAttributedString *attributeString = [NSMutableAttributedString rangeLabelWithContent:content
                                                                                    hltContentArr:hltContentArr
                                                                                         hltColor:hltColor
                                                                                      normolColor:normolColor];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lindSpaceing];//调整行间距
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [content length])];
    return attributeString;
}

#pragma mrak - 将中括号中的文字改成高亮状态

+ (NSMutableAttributedString *)hightlightBracketsPackageString:(NSString *)content
                                            hltColor:(UIColor *)hltColor
                                         normolColor:(UIColor *)normolColor {
    
    NSMutableArray *lightStringArray = [NSMutableAttributedString fetchBracketsPackageStringArrayWithString:content];
    NSString *contentString = [[self class] deleteBracketsForString:content];
    for (NSString *lightString in lightStringArray) {
        [lightStringArray replaceObject:lightString withObject:[[self class] deleteBracketsForString:lightString]];
    }
    return [NSMutableAttributedString rangeLabelWithContent:contentString
                                              hltContentArr:lightStringArray
                                                   hltColor:hltColor
                                                normolColor:normolColor];
}


#pragma mark - 删除中括号
+ (NSString *)deleteBracketsForString:(NSString *)string {
    NSString *textContent = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
    return [textContent stringByReplacingOccurrencesOfString:@"]" withString:@""];
}

#pragma mark - 取含中括号之间的字符串，含中括号
+ (NSMutableArray *)fetchBracketsPackageStringArrayWithString:(NSString *)str {
    NSMutableString * muStr = [NSMutableString stringWithString:str];
    NSMutableArray *array = [NSMutableArray array];
    while (1) {
        NSRange range = [muStr rangeOfString:@"["];
        NSRange range1 = [muStr rangeOfString:@"]"];
        if (range.location != NSNotFound) {
            NSInteger loc = range.location;
            NSInteger len = range1.location - range.location;
            NSRange range = NSMakeRange(loc, len + 1);
            NSString *bracketPackageString = [muStr substringWithRange:range];
            if ([bracketPackageString notNilOrEmpty]) {
                [array addObject:bracketPackageString];
            }
            [muStr deleteCharactersInRange:range];
        } else {
            return array;
        }
    }
}

@end
