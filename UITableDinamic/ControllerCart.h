//
//  ControllerCart.h
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface ControllerCart : UIViewController <UITextFieldDelegate>

@property UIView*viewCart;

@property (weak, nonatomic)  UITextField *nameField;
@property (weak, nonatomic)  UITextField *familyNameField;
@property (weak, nonatomic)  UITextField *averageScoreField;

@property NSString *name;
@property NSString *familyName;
@property NSString *averageScore;
@property UILabel*labelSave;

@property BOOL flagSave;

-(NSString*)stringOldName: (NSString*)textFieldString stringNewName: (NSString*)string rangeInput: (NSRange)range;

-(void)saveCartStudent:(UIButton*)sender;


@end

NS_ASSUME_NONNULL_END
