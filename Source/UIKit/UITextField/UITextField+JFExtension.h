//
// UITextField+JFExtension.h
// Pods
//
// Created by sheldon on 2018/6/26.
//

#import <UIKit/UIKit.h>

// 准许输入字符类型
typedef NS_ENUM(NSInteger, MZDTextFieldCharsType) {
    MZDTextFieldCharsTypeNumeral = 1,      // 只许数字
    MZDTextFieldCharsTypeLetter,           // 只许大小写字母
    MZDTextFieldCharsTypeIdentityCard,     // 只许身份证（数字加上X和x）
    MZDTextFieldCharsTypeNumeralAndLetter, // 只许数字加上大小写字母
    MZDTextFieldCharsTypeAllChar,          // 允许输入所有字符
};

@interface UITextField (JFExtension)
- (void)jf_setPlaceholder:(NSString *)placeholder color:(UIColor *)color;
- (void)jf_setPlaceholderColor:(UIColor *)color;

+ (BOOL)jf_textField:(UITextField *)textField
            range:(NSRange)range
           string:(NSString *)string
         charsType:(MZDTextFieldCharsType)charsType
        maxLength:(NSInteger)maxLength
  separatorIndexs:(NSArray *)indexs
        separator:(NSString *)separator;

+ (NSString *)jf_parseString:(NSString *)string separatorIndexs:(NSArray *)indexs separator:(NSString *)separator;
@end
