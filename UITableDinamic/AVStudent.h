//
//  AVStudent.h
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVStudent : NSObject
@property NSString*firstName;
@property NSString*lastName;
@property CGFloat averageScore;
@property (nonatomic) NSString* averageScoreString;

@end

NS_ASSUME_NONNULL_END
