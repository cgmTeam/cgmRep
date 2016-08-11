//
//  NSString+CGM_NSString.h
//  CGM_NSString
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CGM_NSString)

/**
 *
 *   BOOL 判断0-9的纯数字字符串
 *
 *  @return Yes为0-9数字，no 不是
 */

-(BOOL)isNumber;

/**
 *判断由数字和26个英文字母或下划线组成的字符串
 *
 */
-(BOOL)isNumAndword;

/**
 *  判断是否为正确的邮箱
 *
 *  @return 返回YES为正确的邮箱，NO为不是邮箱
 */
- (BOOL)isValidateEmail;

/**
 *  判断是否为正确的手机号
 *
 *  @return 返回YES为手机号，NO为不是手机号
 */
- (BOOL)checkTel;

/** 手机号正则匹配*/
+(BOOL)verifyMobilePhone:(NSString*)phone;

/**
 *  清空字符串中的空白字符
 *
 *  @return 清空空白字符串之后的字符串
 */
- (NSString *)trimString;

/**
 *  是否空字符串
 *
 *  @return 如果字符串为nil或者长度为0返回YES
 */
- (BOOL)isEmptyString;

/**
 *  返回沙盒中的文件路径
 *
 *  @return 返回当前字符串对应在沙盒中的完整文件路径
 */
+ (NSString *)stringWithDocumentsPath:(NSString *)path;

/**
 *  写入系统偏好
 *
 *  @param key 写入键值
 */
- (void)saveToNSDefaultsWithKey:(NSString *)key;

/**
 *  一串字符在固定宽度下，正常显示所需要的高度
 *
 *  @param string：文本内容
 *  @param width：每一行的宽度
 *  @param 字体大小
 */
+ (CGFloat)autoHeightWithString:(NSString *)string
                          Width:(CGFloat)width
                           Font:(NSInteger)font;

/**
 *  一串字符在一行中正常显示所需要的宽度
 *
 *  @param string：文本内容
 *  @param 字体大小
 */
+ (CGFloat)autoWidthWithString:(NSString *)string
                          Font:(NSInteger)font;
//下划线文字
+ (NSAttributedString *)makeDeleteLine:(NSString *)string;

//返回带换行符的字符串
+ (NSString *)StringHaveNextLine:(NSArray *)array;


// 判断是是否为手机号
- (BOOL)telephone;
// 邮箱判断
- (BOOL)email;
// 字符串是否为空
- (BOOL)emptyOrWhitespace;
// 去除空格
- (NSString *)trimmedString;
// 取出回车
- (NSString *)trimmedWhitespaceAndNewlineString;
// 弱密码判断
- (BOOL)weakPswd;

/** 是否为纯字母*/
+ (Boolean)isCharaterString:(NSString *)str;

/**验证邮箱*/
+(BOOL)isValidateEmail:(NSString *)email;
/**验证密码*/
+(BOOL)isValidatePassword:(NSString *)pw;
/**验证昵称*/
+(BOOL)isValidateNickname:(NSString *)nickName;
/**验证手机号码*/
+(BOOL)isValidatePhoneNum:(NSString *)phone;
/**验证银行卡*/
+ (BOOL)isValidateBankCardNumber: (NSString *)bankCardNumber;
/**验证电话号码*/
+(BOOL)isValidateTelephoneNum:(NSString *)phone;
/**验证传真号码*/
+(BOOL)isValidateTelephone:(NSString *)phone;
/**验证字符串是否是数字*/
+(BOOL)isValidateNumber:(NSString *)number;
/**验证字符串是否全部是中文*/
+(BOOL)isValidateChinese:(NSString *)chineseName;

/** 是否为数字字母组合*/
+ (Boolean)isNumberCharaterString:(NSString *)str;

/** 有非法字符？*/
+ (Boolean)hasillegalString:(NSString *)str;

/**获取AppVersion*/
+(NSString*)getAppVersion;
/**获取AppName*/
+(NSString*)getAppName;
/**获取App所支持的所有国际语言*/
+(NSString *)getAllSupportLanguage;
/**获取App当前的国际语言*/
+(NSString *)getCurrentLanguage;

/**判断字符串是否是纯净的Float*/
+(BOOL)isPureFloat:(NSString*)string;
/**判断字符串是否是纯净的Int*/
+(BOOL)isPureInt:(NSString*)string;

/**获取当前时间*/
+ (NSString *)currentDate;

/**是否有网*/
+ (Boolean)haveNet;

/** 是否是第一次使用这个版本*/
+ (BOOL)isNewFeature;

/** 富文本*/
+(NSAttributedString*)getAttributeFromFirstString:(NSString*)str1 secondString:(NSString*)str2;
/** 富文本 字体1，字体2*/
+(NSAttributedString*)getAttributeFromFirstString:(NSString*)str1 secondString:(NSString*)str2 fontFront:(CGFloat)font1 fontNext:(CGFloat)font2;
+ (NSAttributedString*)attributeFromFirstString:(NSString*)str1 secondString:(NSString*)str2 color1:(UIColor *)color1 color2:(UIColor *)color2;
/** 富文本 字体1，字体2,颜色1，颜色2*/
+ (NSAttributedString*)setAttrbute:(NSString *)string andAttribute:(NSString *)string2 Color1:(UIColor *)color1 Color2:(UIColor *)color2 Font1:(CGFloat)font1 Font2:(CGFloat)font2;

/**去除前后空格*/
+ (NSString *)removeSpaceBeforeAndAfterWithString:(NSString *)str;

/**根据左右取中间字符串,返回为数组*/
+ (NSArray *)getMidStringBetweenLeftString:(NSString *)leftString RightString:(NSString *)rightString withText:(NSString *)text getOne:(BOOL)one withIndexStart:(NSInteger)startIndex stopString:(NSString *)stopString;

/**从路径中获取指定字符串*/
+ (NSString *)getStringFromPathArr:(NSArray *)pathArr stopPathString:(NSString *)stopPathstring withText:(NSString *)text BetweenLeftString:(NSString *)leftString RightString:(NSString *)rightString;

/**返回指定目标字符串在总字符串中的个数*/
+ (NSInteger)getCountTargetString:(NSString *)targetStr inText:(NSString *)text;

@end
