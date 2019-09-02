//
//  AVGrupStudents.h
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVGrupStudents : NSObject

@property NSArray*arrayStudents;
@property NSString*name;

-(id)initWithArrayStudents:(NSArray*)arrayStudents;
-(id)initWithCountStudents:(NSInteger) countStudentsInGrup;
-(AVGrupStudents*)sortStudentInGrups;

@end

NS_ASSUME_NONNULL_END
