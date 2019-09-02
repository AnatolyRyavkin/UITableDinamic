//
//  AVViewController.h
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVStudent.h"
#import "ControllerCart.h"
#import "AVGrupStudents.h"
#import "AVButtonDeleteGrup.h"
#import "AVUniversity.h"
#import "AVHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property UITableViewCell* cellForStudent;
@property UITableViewCell* cellForAddStudent;

@property (weak) UITableView*table;

@property (weak) UIBarButtonItem*editButton;

@property UIButton*buttonRemoveGpup;

@property NSIndexPath*indexPath;

@property ControllerCart*controllerStudent;



-(void)editActionBegin:(UIBarButtonItem*)sender;
-(void)enableGrupsBasic:(UIBarButtonItem*)sender;
-(void)enablegrupsSortByStudentName:(UIBarButtonItem*)sender;
-(void)enablegrupsSeparatedByAverageAndSortbyName:(UIBarButtonItem*)sender;

    //-(AVStudent*) getStudentConsiderAddForGrups:(NSArray*) grups atIndexPath:(NSIndexPath*)indexPath;


@end
NS_ASSUME_NONNULL_END
