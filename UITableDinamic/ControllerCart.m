//
//  ControllerCart.m
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "ControllerCart.h"

@interface ControllerCart ()

@end

@implementation ControllerCart

-(void)dealloc{
    NSLog(@"ControllerCart release");
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"didloadCartStudent");

    UIView*viewBase = [[UIView alloc]initWithFrame:self.view.bounds];
    viewBase.backgroundColor = [UIColor grayColor];
    [self.view addSubview:viewBase];

    viewBase.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;



    UIView*viewCart = [[UIView alloc]initWithFrame:CGRectMake(  100,
                                                              100,
                                                              CGRectGetWidth(viewBase.bounds)-200,
                                                              CGRectGetHeight(viewBase.bounds)-200)];

    viewCart.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0.5];
    [viewBase addSubview:viewCart];

    [viewCart setTranslatesAutoresizingMaskIntoConstraints:NO];

    NSLayoutConstraint*constraintCenterX = [NSLayoutConstraint constraintWithItem:viewCart attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:viewBase attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint*constraintCenterY = [NSLayoutConstraint constraintWithItem:viewCart attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:viewBase attribute:NSLayoutAttributeCenterY multiplier:1 constant:35];

    NSLayoutConstraint*constraintHeight = [NSLayoutConstraint constraintWithItem:viewCart attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:680];
    NSLayoutConstraint*constraintWidth = [NSLayoutConstraint constraintWithItem:viewCart attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:0 multiplier:1 constant:600];

    [viewBase addConstraint:constraintCenterX];
    [viewBase addConstraint:constraintCenterY];
    [viewCart addConstraint:constraintHeight];
    [viewCart addConstraint:constraintWidth];


    UILabel*labelCartStudent = [[UILabel alloc]initWithFrame:CGRectMake((viewCart.bounds.size.width-400)/2, 20, 400, 100)];

    labelCartStudent.textAlignment = NSTextAlignmentCenter;
    labelCartStudent.textColor = [UIColor whiteColor];
    labelCartStudent.font = [UIFont systemFontOfSize:22 weight:0.8];
    labelCartStudent.text = [NSString stringWithFormat:@"CART STUDENT"];

    [viewCart addSubview:labelCartStudent];

    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake((viewCart.bounds.size.width-400)/2, 200, 400, 80)];
    UITextField *familyNameField = [[UITextField alloc]initWithFrame:CGRectMake((viewCart.bounds.size.width-400)/2, 300, 400, 80)];
    UITextField *averageScoreField = [[UITextField alloc]initWithFrame:CGRectMake((viewCart.bounds.size.width-80)/2, 400, 80, 80)];

    [viewCart addSubview:nameField];
    [viewCart addSubview:familyNameField];
    [viewCart addSubview:averageScoreField];

    UIButton*buttonSave = [[UIButton alloc]initWithFrame:CGRectMake((viewCart.bounds.size.width-100)/2, 550, 100, 50)];
    [buttonSave addTarget:self action:@selector(saveCartStudent:) forControlEvents:UIControlEventTouchUpInside];
    [buttonSave setTitle:@"SAVE" forState:UIControlStateNormal];
    [buttonSave setTitle:[NSString stringWithFormat:@"COMPLE"] forState:UIControlStateHighlighted];
    [buttonSave setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    buttonSave.titleLabel.font = [UIFont fontWithName:@"Arial" size:20];
    buttonSave.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.4];

    [viewCart addSubview:buttonSave];

    UILabel*labelSave = [[UILabel alloc]initWithFrame:CGRectMake((viewCart.bounds.size.width-400)/2, 20, 400, 250)];
    labelSave.textAlignment = NSTextAlignmentCenter;
    labelSave.textColor = [UIColor redColor];
    labelSave.font = [UIFont systemFontOfSize:22 weight:0.8];
    labelSave.text = [NSString stringWithFormat:@"SAVED"];
    self.labelSave = labelSave;


    self.nameField = nameField;
    self.familyNameField = familyNameField;
    self.averageScoreField = averageScoreField;

    self.nameField.textAlignment = NSTextAlignmentCenter;
    self.nameField.textColor = [UIColor whiteColor];
    self.nameField.font = [UIFont systemFontOfSize:20 weight:0.4];
    self.nameField.text = self.name;
    self.nameField.clearButtonMode=UITextFieldViewModeWhileEditing;

    self.familyNameField.textAlignment = NSTextAlignmentCenter;
    self.familyNameField.textColor = [UIColor whiteColor];
    self.familyNameField.font = [UIFont systemFontOfSize:20 weight:0.4];
    self.familyNameField.text = self.familyName;
    self.familyNameField.clearButtonMode=UITextFieldViewModeWhileEditing;


    self.averageScoreField.textAlignment = NSTextAlignmentCenter;
    self.averageScoreField.textColor = [UIColor whiteColor];
    self.averageScoreField.font = [UIFont systemFontOfSize:20 weight:0.4];
    self.averageScoreField.text = self.averageScore;
    self.averageScoreField.clearButtonMode=UITextFieldViewModeWhileEditing;


    self.nameField.tag = 1;
    self.familyNameField.tag = 2;
    self.averageScoreField.tag =3;

    self.nameField.backgroundColor = self.familyNameField.backgroundColor = self.averageScoreField.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.5];

    self.nameField.delegate = self.familyNameField.delegate = self.averageScoreField.delegate = self;

    self.viewCart = viewCart;

}

-(void)saveCartStudent:(UIButton*)sender{
    NSLog(@"count = %@",self.navigationController.viewControllers );
    self.flagSave = YES;

    [self.viewCart addSubview:self.labelSave];

    [self.navigationController popViewControllerAnimated:YES];

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    switch (textField.tag) {
        case 1:
            if(textField.text.length+string.length<20 && ![string isEqualToString:@""]){
                textField.text = [self stringOldName:textField.text stringNewName:string rangeInput:range];
                return NO;
            }else if([string isEqualToString:@""]){
                return YES;
            }
            break;
        case 2:
            if(textField.text.length+string.length<20 && ![string isEqualToString:@""]){
                textField.text = [self stringOldName:textField.text stringNewName:string rangeInput:range];
                return NO;
            }else if([string isEqualToString:@""]){
                return YES;
            }

            break;
        case 3:
            if(textField.text.length+string.length<5 && ![string isEqualToString:@""]){
                textField.text = [self stringOldAge:textField.text stringNewAge:string rangeInput:range];
                return NO;
            }else if([string isEqualToString:@""]){
                return YES;
            }
            break;

        default:
            return NO;
            break;
    }
    return NO;
}

-(NSString*)stringOldName: (NSString*)textFieldString stringNewName: (NSString*)string rangeInput: (NSRange)range{

    NSMutableString*stringTemp=[[NSMutableString alloc]initWithString:textFieldString];

    NSMutableCharacterSet *setControl = [NSMutableCharacterSet letterCharacterSet];
    [setControl invert];

    NSArray*arrayCheckAtNumber=[string componentsSeparatedByCharactersInSet:setControl];

    if(arrayCheckAtNumber.count==1){
        [stringTemp replaceCharactersInRange:range withString:string];
        return stringTemp;
    }else{
        return textFieldString;
    }
}

-(NSString*)stringOldAge: (NSString*)textFieldString stringNewAge: (NSString*)string rangeInput: (NSRange)range{

    NSMutableString*stringTemp=[[NSMutableString alloc]initWithString:textFieldString];
    [stringTemp appendString:string];
    CGFloat fl = [stringTemp floatValue];
    if(fl>=2 && fl<=5){
        if(stringTemp.length==1)
            [stringTemp appendString:@"."];
        return stringTemp;
    }else
        return textFieldString;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSArray*array=[NSArray arrayWithObjects:self.nameField, self.familyNameField, self.averageScoreField, nil];
    if(textField.tag==3){
        [textField resignFirstResponder];
    }else{
        [[array objectAtIndex:textField.tag] becomeFirstResponder];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.name = self.nameField.text;
    self.familyName = self.familyNameField.text;
    self.averageScore = self.averageScoreField.text;
}



@end

