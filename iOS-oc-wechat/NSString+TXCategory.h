//
//  NSString+TXCategory.h
//  appDoctor
//
//  Created by TX-009 on 14-10-23.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NSNull (TXCategory)
- (BOOL) isPresent;
- (CGSize)i_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
- (NSUInteger)length;
- (BOOL)isEqualToString:(NSString *)aString;
- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;
- (id)jsonObject;
- (int)intValue;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet;
- (NSString *)stringByAppendingString:(NSString *)aString;
-(NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
@end
/***
 *  ///////////////添加ContainsString分类 该方法在ios8才被系统提供 该方法为了向下兼容
 */
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 80000
@interface NSString (TXContainsString)
// Added in iOS 8, retrofitted for iOS 7
- (BOOL)containsString:(NSString *)aString;
@end
#endif
/***
 *  /////////////// 
 */
@interface NSString (TXCategory)
///容错
- (NSString *)jsonString;
#pragma mark - 判断字符串是否不为空(' ',nil,null)
-(BOOL) isPresent;

- (NSURL *)i_URL;
- (NSString *)i_URLEncodedString;

#pragma mark - MD5加密
- (NSString *) i_md5_encrypt;

#pragma mark - 字符串转换成JSON数据
- (id)jsonObject;

#pragma mark - 获取字符串尺寸
- (CGSize)i_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
- (CGSize)i_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize addSize:(CGSize)addSize;

- (NSString *)i_starDecoratePhone;
//判断是否为手机号
- (NSString *)i_phoneFix;
-(BOOL) i_isValidate_Mobile;
@end
