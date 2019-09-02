//
//  AVStudent.m
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVStudent.h"

@implementation AVStudent

@synthesize averageScoreString = _averageScoreString;

-(void)setAverageScoreString:(NSString *)averageScoreString{
    _averageScoreString = averageScoreString;
    self.averageScore = [_averageScoreString floatValue];
}

-(id)init{
    self = [super init];
    if(self){

        self.averageScore = ((CGFloat)((arc4random()*1000)%300))/100+2;

        NSArray*arrayGlasChar = [[NSArray alloc]initWithObjects:@"y",@"u",@"a",@"o",@"i",@"a",@"u",@"o",@"i",@"j",nil];

        NSArray*arraySoglasChar = [[NSArray alloc]initWithObjects:     @"q",@"w",@"r",@"t",@"p",@"s",@"d",@"f",@"g",@"h",@"k",@"l",@"z",@"x",@"c",@"v",@"b",@"n",@"m",@"q",@"w",
                                   @"r",@"t",@"p",@"s",@"d",@"f",@"g",@"h",@"k",@"l",@"x",@"c",@"v",@"b",@"n",@"m",@"q",@"r",@"t",@"p",@"s",@"d",@"f",@"g",@"h",@"k",@"l",
                                   @"z",@"x",@"c",@"v",@"b",@"n",@"m",@"r",@"t",@"p",@"s",@"d",@"f",@"g",@"h",@"k",@"l",@"z",@"x",@"c",@"v",@"b",@"n",@"m",@"r",@"t",
                                   @"p",@"s",@"d",@"f",@"g",@"h",@"k",@"l",@"c",@"v",@"b",@"n",@"m",nil];

        NSMutableString*firstName = [[NSMutableString alloc]init];
        for(int i=0;i<(arc4random()%6+4);i++){
            NSString*strChar = (i%2==0) ? [arrayGlasChar objectAtIndex:arc4random()% (arrayGlasChar.count-1)] :  [arraySoglasChar objectAtIndex:(arc4random()%(arraySoglasChar.count-1))];
            if(i==0)
                [firstName appendString:[strChar uppercaseString]];
            else
                [firstName appendString:strChar];
        }

        NSMutableString*lastName = [[NSMutableString alloc]init];
        for(int i=0;i<(arc4random()%6+4);i++){
            NSString*strChar = (i%2==0) ? [arrayGlasChar objectAtIndex:(arc4random()%(arrayGlasChar.count-1))] :  [arraySoglasChar objectAtIndex:(arc4random()%(arraySoglasChar.count-1))];
            if(i==0)
                [lastName appendString:[strChar uppercaseString]];
            else
                [lastName appendString:strChar];
        }
        if(arc4random()%2==0)
            [lastName appendString:@"in"];
        else
            [lastName appendString:@"of"];
        self.lastName = lastName;
        self.firstName = firstName;
        self.averageScoreString = [NSString stringWithFormat:@"%.2f",self.averageScore];
    }
    return self;
}

@end
