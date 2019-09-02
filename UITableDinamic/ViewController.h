//
//  ViewController.h
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property AVUniversity* university;

@property UITableViewCell* cellForStudent;
@property UITableViewCell* cellForAddStudent;

@property AVHeader* header;

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

