//
//  AVUniversity.m
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVUniversity.h"

@implementation AVUniversity


-(id)init{
    self = [super init];
    if(self){
        NSMutableArray*tempArray = [[NSMutableArray alloc]init];
        for(int i=0;i<arc4random()%4+3;i++){
            [tempArray addObject:[[AVGrupStudents alloc]initWithCountStudents:arc4random()%10+15]];
        }
        self.grupsBasic = [NSArray arrayWithArray:tempArray];
        self.grupsSortByStudentName = [NSArray arrayWithArray:[self sortGrupsByNameStudent:self.grupsBasic]];
        self.grupsSeparatedByAverageAndSortbyName = [NSArray arrayWithArray:[self sortGrupsByAverageScoreAndNameStudent:self.grupsBasic]];
        self.grupsBasicCopy = [NSArray arrayWithArray:self.grupsBasic];
    }

    return self;
}

-(id)initWithBasicGrup:(NSArray*)arrayBasicGrup{
    self = [super init];
    if(self){
        self.grupsBasic = [NSArray arrayWithArray:arrayBasicGrup];
        self.grupsSortByStudentName = [NSArray arrayWithArray:[self sortGrupsByNameStudent:self.grupsBasic]];
        self.grupsSeparatedByAverageAndSortbyName = [NSArray arrayWithArray:[self sortGrupsByAverageScoreAndNameStudent:self.grupsBasic]];
        self.grupsBasicCopy = [NSArray arrayWithArray:self.grupsBasic];
    }
    return self;
}

-(void)setGrupBasic:(NSArray*)array{
    self.grupsBasic = [NSArray arrayWithArray:array];
}

-(NSArray*)sortGrupsByNameStudent:(NSArray*) arrayGrups{
    NSMutableArray*tempArray = [[NSMutableArray alloc]init];
    for(AVGrupStudents*grup in arrayGrups){
        [tempArray addObject:[grup sortStudentInGrups]];
    }
    return tempArray;
}

-(NSArray*)sortGrupsByAverageScoreAndNameStudent:(NSArray*) arrayGrups{

    NSMutableArray*tempArrayGrup0 = [[NSMutableArray alloc]init];
    NSMutableArray*tempArrayGrup1 = [[NSMutableArray alloc]init];
    NSMutableArray*tempArrayGrup2 = [[NSMutableArray alloc]init];

    for(AVGrupStudents*grup in arrayGrups){
        for(AVStudent*student in grup.arrayStudents){
            if(student.averageScore<3){
                [tempArrayGrup0 addObject:student];
            }else if(student.averageScore<4.5){
                [tempArrayGrup1 addObject:student];
            }
            else{
                [tempArrayGrup2 addObject:student];
            }
        }
    }
    NSArray*arrayOutput = [NSArray arrayWithObjects:   [[[AVGrupStudents alloc] initWithArrayStudents:tempArrayGrup0] sortStudentInGrups],
                           [[[AVGrupStudents alloc] initWithArrayStudents:tempArrayGrup1] sortStudentInGrups],
                           [[[AVGrupStudents alloc] initWithArrayStudents:tempArrayGrup2] sortStudentInGrups],
                           nil];

    return arrayOutput;
}



@end

