//
//  NSString+CGM_NSString.m
//  CGM_NSString
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "NSString+CGM_NSString.h"

@implementation NSString (CGM_NSString)

#pragma mark 是否空字符串 不为空返回no,为空返回yes
- (BOOL)isEmptyString {
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }else if (self==nil) {
        return YES;
    }else if(!self) {
        // null object
        return TRUE;
    } else if(self==NULL) {
        // null object
        return TRUE;
    } else if([self isEqualToString:@"NULL"]) {
        // null object
        return TRUE;
    }else if([self isEqualToString:@"(null)"]){
        
        return TRUE;
    }else{
        //  使用whitespaceAndNewlineCharacterSet删除周围的空白字符串
        //  然后在判断首位字符串是否为空
        NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            // empty string
            return TRUE;
        } else {
            // is neither empty nor null
            return FALSE;
        }
    }
}

#pragma mark 判断不包含特殊符号
-(BOOL)isNumAndword{
    NSString *reges = @"^[A-Za-z0-9-.]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reges];
    return [pred evaluateWithObject:self];
}

#pragma mark 判断是否是手机号
- (BOOL)checkTel {
    NSString *regex = @"^((13[0-9])|(14[0-9])|(17[0-9])|(15[0-9])|(18[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

#pragma mark 判断是否是邮箱
- (BOOL)isValidateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


#pragma mark 判断是否是纯数字
- (BOOL)isNumber {
    NSString *emailRegex = @"^[0-9]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

#pragma mark 清空字符串中的空白字符
- (NSString *)trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark 返回沙盒中的文件路径
+ (NSString *)stringWithDocumentsPath:(NSString *)path {
    NSString *file = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [file stringByAppendingPathComponent:path];
}

#pragma mark 写入系统偏好
- (void)saveToNSDefaultsWithKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:self forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark 一串字符在固定宽度下，正常显示所需要的高度 method
+ (CGFloat)autoHeightWithString:(NSString *)string Width:(CGFloat)width Font:(NSInteger)font {
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 10;//行间距
    paragraph.paragraphSpacing = 50;//段落间隔
    paragraph.firstLineHeadIndent = 50;//首行缩近
    //绘制属性（字典）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont systemFontOfSize:font],
                             NSForegroundColorAttributeName:[UIColor greenColor],
                             NSBackgroundColorAttributeName:[UIColor grayColor],
                             NSParagraphStyleAttributeName:paragraph,
                             };
    
    //大小
    CGSize boundRectSize = CGSizeMake(width, MAXFLOAT);
    
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:dictA context:nil].size.height;
    return newFloat;
}

#pragma mark 一串字符在一行中正常显示所需要的宽度 method
+ (CGFloat)autoWidthWithString:(NSString *)string Font:(NSInteger)font {
    
    //大小
    CGSize boundRectSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    //绘制属性（字典）
    NSDictionary *fontDict = @{ NSFontAttributeName: [UIFont systemFontOfSize:font]};
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:fontDict context:nil].size.width;
    return newFloat;
}

+ (NSAttributedString *)makeDeleteLine:(NSString *)string{
    string = [NSString stringWithFormat:@"<html><body style =\"font-size:12px;\"><s><font color=\"#B6B6B6\">%@</font></s></body></html>",string];
    NSAttributedString * attributeString = [[NSAttributedString alloc]initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    return attributeString;
}

+ (NSString *)StringHaveNextLine:(NSArray *)array{
    NSString *lineString;
    //    for (NSInteger index = 0; index < array.count; index ++) {
    //        ZJPFriendInfoBrandList *infoBrand = array[index];
    //        if (index == 0) {
    //            lineString = [NSString stringWithFormat:@"%@",infoBrand.brandCNName];
    //        }else{
    //            lineString = [NSString stringWithFormat:@"%@\n%@",lineString,infoBrand.brandCNName];
    //        }
    //
    //    }
    return lineString;
}


- (BOOL)email
{
    NSString *emailEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailEx];
    return [regExPredicate evaluateWithObject:[self lowercaseString]];
}

- (BOOL)weakPswd
{
    NSString *pswdEx =
    @"^(?=.*\\d.*)(?=.*[a-zA-Z].*).{6,20}$";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pswdEx];
    return [regExPredicate evaluateWithObject:self];
}
- (BOOL)emptyOrWhitespace
{
    return self == nil || !([self length] > 0) || [[self trimmedString] length] == 0;
}

- (NSString *)trimmedString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)trimmedWhitespaceAndNewlineString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)telephone
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * cm = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * cu = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * ct = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * phs = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regexmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regexcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cm];
    NSPredicate *regexcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cu];
    NSPredicate *regexct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ct];
    NSPredicate *regexphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phs];
    
    return  [regexmobile evaluateWithObject:self]   ||
    [regexphs evaluateWithObject:self]      ||
    [regexct evaluateWithObject:self]       ||
    [regexcu evaluateWithObject:self]       ||
    [regexcm evaluateWithObject:self];
}

+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+(BOOL)isValidatePassword:(NSString *)pw {
    NSString *emailRegex = @"[A-Z0-9a-z_]{6,15}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:pw];
}
+(BOOL)isValidateNickname:(NSString *)nickName {
    NSString *emailRegex = @"[A-Z 0-9a-z\u4e00-\u9fa5]{1,15}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:nickName];
}
+(BOOL)isValidatePhoneNum:(NSString *)phone{
    NSString *phoneRegex = @"^((147)|((17|13|15|18)[0-9]))\\d{8}$";//@"\\d{3}-\\d{8}|\\d{4}-\\d{7}|\\d{11}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}
+(BOOL)isValidateTelephoneNum:(NSString *)phone{
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    return [phoneTest evaluateWithObject:phone];
}
+(BOOL)isValidateTelephone:(NSString *)phone{
    NSString * PHS = @"(”^(\\d{3,4}-)\\d{7,8}$”)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    return [phoneTest evaluateWithObject:phone];
}
+ (BOOL)isValidateBankCardNumber: (NSString *)bankCardNumber{
    BOOL flag;
    if (bankCardNumber.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}
+(BOOL)isValidateNumber:(NSString *)number{
    NSString * num = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",num];
    return [numberTest evaluateWithObject:number];
}
+(BOOL)isValidateChinese:(NSString *)chineseName{
    NSString *chineseStr = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate *chineseTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",chineseStr];
    return [chineseTest evaluateWithObject:chineseName];
}

+(NSString*)getAppVersion
{
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString* appVersion=[infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}

+(NSString*)getAppName
{
    NSDictionary* infoDictionary=[[NSBundle mainBundle]infoDictionary];
    NSString* appName=[infoDictionary objectForKey:@"CFBundleDisplayName"];
    return appName;
}

+(NSString *)getAllSupportLanguage{
    NSUserDefaults *defaults = [ NSUserDefaults standardUserDefaults ];
    // 取得 iPhone 支持的所有语言设置
    NSArray *languages = [defaults objectForKey : @"AppleLanguages" ];
    return [NSString stringWithFormat:@"%@" , languages];
}

+(NSString *)getCurrentLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return [NSString stringWithFormat:@"%@" , currentLanguage];
}

+(BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan=[NSScanner scannerWithString:string];
    float val;
    BOOL isFloat = [scan scanFloat:&val]&&[scan isAtEnd];
    if ([self isPureInt:string]) {
        return NO;
    }
    return isFloat;
}

+(BOOL)isPureInt:(NSString*)string
{
    NSScanner* scan=[NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val]&&[scan isAtEnd];
}


+ (NSString *)currentDate{
    NSDateFormatter * formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:[NSDate date]];
}

//去除前后空格
+ (NSString *)removeSpaceBeforeAndAfterWithString:(NSString *)str
{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

+ (NSArray *)getMidStringBetweenLeftString:(NSString *)leftString RightString:(NSString *)rightString withText:(NSString *)text getOne:(BOOL)one withIndexStart:(NSInteger)startIndex stopString:(NSString *)stopString{
    
    if (startIndex>=text.length-1) {
        return nil;
    }
    
    NSMutableArray *arrM=[NSMutableArray array];
    
    NSInteger indexStart=[text rangeOfString:leftString options:NSCaseInsensitiveSearch range:NSMakeRange(startIndex, text.length-startIndex)].location;
    NSInteger indexEnd;
    NSInteger stopIndex=0;
    if (indexStart!=NSNotFound&&indexStart<text.length-1) {
        indexEnd=[text rangeOfString:rightString options:NSCaseInsensitiveSearch range:NSMakeRange(indexStart+1, text.length-indexStart-1)].location;
        
        if (stopString.length==0) {
            stopIndex=text.length+1;
        }else{
            stopIndex=[text rangeOfString:rightString options:NSCaseInsensitiveSearch range:NSMakeRange(indexStart+1, text.length-indexStart-1)].location;
        }
    }else{
        indexEnd=NSNotFound;
    }
    
    while (indexStart!=NSNotFound&&indexEnd!=NSNotFound&&indexStart<indexEnd&&indexEnd<stopIndex) {
        [arrM addObject:[text substringWithRange:NSMakeRange(indexStart+leftString.length, indexEnd-indexStart-leftString.length)]];
        
        if (one) {
            break;
        }
        
        indexStart=indexEnd+1;
        
        indexStart=[text rangeOfString:leftString options:NSCaseInsensitiveSearch range:NSMakeRange(indexStart, text.length-indexStart)].location;
        if (indexStart!=NSNotFound&&indexStart<text.length-1) {
            indexEnd=[text rangeOfString:rightString options:NSCaseInsensitiveSearch range:NSMakeRange(indexStart+1, text.length-indexStart-1)].location;
        }else break;
    }
    return arrM;
}

/**从路径中获取指定字符串*/
+ (NSString *)getStringFromPathArr:(NSArray *)pathArr stopPathString:(NSString *)stopPathstring withText:(NSString *)text BetweenLeftString:(NSString *)leftString RightString:(NSString *)rightString{
    NSInteger index=0;
    BOOL success=YES;
    if(pathArr.count>0){
        for (NSString *path in pathArr) {
            index=[text rangeOfString:path options:NSCaseInsensitiveSearch range:NSMakeRange(index, text.length-index)].location;
            if (index!=NSNotFound) {
                continue;
            }else{
                success=NO;
                break;
            }
        }
        if (success==NO) {
            return @"";
        }
        
        NSArray *myStrings=[self getMidStringBetweenLeftString:leftString RightString:rightString withText:text getOne:YES withIndexStart:index stopString:stopPathstring];
        
        if (myStrings.count>0) {
            return myStrings[0];
        }
        
    }
    return @"";
}

/**返回指定目标字符串在总字符串中的个数*/
+ (NSInteger)getCountTargetString:(NSString *)targetStr inText:(NSString *)text{
    
    NSInteger count=0;
    NSInteger indexStart=[text rangeOfString:targetStr].location;
    while (indexStart!=NSNotFound) {
        count++;
        
        indexStart+=targetStr.length;
        
        if (indexStart<text.length-1) {
            indexStart=[text rangeOfString:targetStr options:NSCaseInsensitiveSearch range:NSMakeRange(indexStart, text.length-indexStart)].location;
        }else break;
    }
    return count;
}


@end
