//
//  AVGrupStudents.m
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVGrupStudents.h"


@implementation AVGrupStudents


-(id)initWithArrayStudents:(NSArray*)arrayStudents{

    self = [super init];
    if(self){
        self.arrayStudents = [NSArray arrayWithArray:arrayStudents];
    }
    return self;
}

-(id)initWithCountStudents:(NSInteger) countStudentsInGrup{
    self=[super init];
    if(self){
        NSMutableArray*tepmArray = [[NSMutableArray alloc]init];
        for(int i=0;i<countStudentsInGrup;i++){
            [tepmArray addObject:[[AVStudent alloc]init]];
        }
        self.arrayStudents = [NSArray arrayWithArray:tepmArray];
    }
    return self;
}

-(AVGrupStudents*)sortStudentInGrups{
    AVGrupStudents*tempGrup = [[AVGrupStudents alloc]init];
    tempGrup.arrayStudents = [self.arrayStudents sortedArrayUsingComparator:^NSComparisonResult(AVStudent*obj1, AVStudent*obj2) {

        if(![obj1.firstName isEqualToString:(obj2.firstName)]){
            return [obj1.firstName caseInsensitiveCompare:obj2.firstName];
        }else{
            return [obj1.lastName caseInsensitiveCompare:obj2.lastName];
        }
    }];
    return tempGrup;
}


@end
