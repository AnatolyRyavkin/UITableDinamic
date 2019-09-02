//
//  AVUniversity.h
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVGrupStudents.h"
#import "AVStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVUniversity : NSObject


@property NSString*name;

@property NSArray*grupsBasic;
@property NSArray*grupsBasicCopy;
@property NSArray*grupsSortByStudentName;
@property NSArray*grupsSeparatedByAverageAndSortbyName;


-(id)initWithBasicGrup:(NSArray*)arrayBasicGrup;
-(NSArray*)sortGrupsByNameStudent:(NSArray*) arrayGrups;
-(NSArray*)sortGrupsByAverageScoreAndNameStudent:(NSArray*) arrayGrups;
-(void)setGrupBasic:(NSArray*)array;


@end

NS_ASSUME_NONNULL_END
