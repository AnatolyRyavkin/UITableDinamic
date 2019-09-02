//
//  ViewController.m
//  UITableDinamic
//
//  Created by Anatoly Ryavkin on 06/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "ViewController.h"

@interface AVViewController ()

-(AVStudent*) getStudentConsiderAddForGrups:(NSArray*) grups atIndexPath:(NSIndexPath*)indexPath;

@end

static  NSString * _Nonnull identifierAdd = @"identifierADD";
static  NSString * _Nonnull identifierStudent= @"identifierStudent";
static NSString * identifierHeader = @"header";

@implementation AVViewController

-(AVStudent*) getStudentConsiderAddForGrups:(NSArray*)arrayGrups atIndexPath:(NSIndexPath*)indexPath{
    return  [[[arrayGrups objectAtIndex:indexPath.section] arrayStudents] objectAtIndex:indexPath.row-1];
}
-(NSIndexPath*) getIndexPathAtStudent:(AVStudent*)student forGrup:(AVGrupStudents*)grup{
    NSUInteger numberGrup = [self.university.grupsBasic indexOfObject:grup];
    NSUInteger numberRow = [grup.arrayStudents indexOfObject:student] + 1;
    NSIndexPath*indexPathForTableAtStudent = [NSIndexPath indexPathForRow:numberRow inSection:numberGrup];

    return indexPathForTableAtStudent;
}

#pragma mark - Load Table

-(void)loadView{
    [super loadView];
    UITableView*table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:table];
    self.table = table;
    self.table.delegate = self;
    self.table.dataSource = self;
    self.university = [[AVUniversity alloc]init];
    self.university.name = @"Tulskiy Statement University";
        //self.view.backgroundColor = [[UIColor yellowColor]colorWithAlphaComponent:0.3];
    self.table.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.4];
    self.table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UIEdgeInsets inset = UIEdgeInsetsMake(1,0,0,0);
    self.table.contentInset = inset;
    self.table.scrollIndicatorInsets = inset;
    self.table.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        //[self.table registerClass:[AVHeader class] forHeaderFooterViewReuseIdentifier:identifierHeader];

    self.table.sectionHeaderHeight = 50;

}

-(void)needLoad{
    if(self.controllerStudent != nil){
        AVStudent*student = [self getStudentConsiderAddForGrups:self.university.grupsBasic atIndexPath:self.indexPath];
        student.firstName = self.controllerStudent.name;
        student.lastName = self.controllerStudent.familyName;
        student.averageScore = [self.controllerStudent.averageScore floatValue];
    }
}

- (void)viewDidLoad {
    NSLog(@"didload - Basa Controller");
    [super viewDidLoad];
    self.navigationItem.title = self.university.name;

    UIBarButtonItem*addGrupButton = [[UIBarButtonItem alloc]initWithTitle:@"AddGrup" style:UIBarButtonItemStylePlain target:self action:@selector(addgrup:)];
    UIBarButtonItem*editButton = [[UIBarButtonItem alloc]initWithTitle:@"EDIT" style:UIBarButtonItemStylePlain target:self action:@selector(editActionBegin:)];

    NSArray*arrrayButtonsRightShow = [NSArray arrayWithObjects:editButton,addGrupButton,nil];

    [self.navigationItem setRightBarButtonItems:arrrayButtonsRightShow];

    UIBarButtonItem*showGrupsBasicButton = [[UIBarButtonItem alloc]initWithTitle:@"Basic" style:UIBarButtonItemStylePlain target:self action:@selector(enableGrupsBasic:)];
    UIBarButtonItem*showgrupsSortByStudentNameButton = [[UIBarButtonItem alloc]initWithTitle:@"SortName" style:UIBarButtonItemStylePlain target:self action:@selector(enablegrupsSortByStudentName:)];
    UIBarButtonItem*grupsSeparatedByAverageAndSortbyNameButton = [[UIBarButtonItem alloc]initWithTitle:@"SeparAverage" style:UIBarButtonItemStylePlain target:self action:@selector(enablegrupsSeparatedByAverageAndSortbyName:)];


    NSArray*arrrayButtonsLeftShow = [NSArray arrayWithObjects:showGrupsBasicButton,showgrupsSortByStudentNameButton,grupsSeparatedByAverageAndSortbyNameButton, nil];

    [self.navigationItem setLeftBarButtonItems:arrrayButtonsLeftShow animated:YES];

    self.table.allowsSelectionDuringEditing = YES;

    self.editButton = editButton;

    self.buttonRemoveGpup.enabled = YES;

    if(self.controllerStudent != nil){
        AVStudent*student = [self getStudentConsiderAddForGrups:self.university.grupsBasic atIndexPath:self.indexPath];
        student.firstName = self.controllerStudent.name;
        student.lastName = self.controllerStudent.familyName;
        student.averageScore = [self.controllerStudent.averageScore floatValue];
    }

}

#pragma mark - Buttons for navigationBar

-(void)deleteGrup:(AVButtonDeleteGrup*)sender{

    if(sender.oneTap){

        [self.table beginUpdates];

        NSMutableArray*tempGrupBasic = [[NSMutableArray alloc]initWithArray:self.university.grupsBasic];

        [tempGrupBasic removeObjectAtIndex:sender.section];

        self.university =[[AVUniversity alloc]initWithBasicGrup:tempGrupBasic];

        [self.table deleteSections:[NSIndexSet indexSetWithIndex:sender.section] withRowAnimation:UITableViewRowAnimationLeft];

        [self.table endUpdates];

        [self.table reloadData];

    }
        //NSLog(@"sender = %ld",(long)sender.section);
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [sender setTitle:@"DontRecover!!!" forState:UIControlStateNormal];
    sender.oneTap = YES;
}

/* add grup with random students

 -(void)addgrup:(UIBarButtonItem*)sender{

 if(self.table.editing == YES){

 [self.table beginUpdates];

 NSMutableArray*tempGrupBasic = [[NSMutableArray alloc]initWithArray:self.university.grupsBasic];

 AVGrupStudents*grupTemp = [[AVGrupStudents alloc]initWithCountStudents:arc4random()%10+15];

 [tempGrupBasic insertObject:grupTemp atIndex:0];

 self.university =[[AVUniversity alloc]initWithBasicGrup:tempGrupBasic];

 [self.table insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];

 [self.table endUpdates];

 }

 }
 */


-(void)addgrup:(UIBarButtonItem*)sender{

    if(self.table.editing == YES){

        [self.table beginUpdates];

        NSMutableArray*tempGrupBasic = [[NSMutableArray alloc]initWithArray:self.university.grupsBasic];

        AVGrupStudents*grupTemp = [[AVGrupStudents alloc]init];

        [tempGrupBasic insertObject:grupTemp atIndex:0];

        self.university =[[AVUniversity alloc]initWithBasicGrup:tempGrupBasic];

        [self.table insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];

        [self.table endUpdates];

        [self.table reloadData];

    }

}

-(void)enableGrupsBasic:(UIBarButtonItem*)sender{
    if(self.table.isEditing == YES)
        self.table.editing = NO;
    [self.university setGrupBasic:self.university.grupsBasicCopy];
    [self.table reloadData];
}

-(void)enablegrupsSortByStudentName:(UIBarButtonItem*)sender{
    if(self.table.isEditing == YES)
        self.table.editing = NO;
    [self.university setGrupBasic:self.university.grupsSortByStudentName];
    self.editButton.title = @"EDIT";
    [self.table reloadData];

}

-(void)enablegrupsSeparatedByAverageAndSortbyName:(UIBarButtonItem*)sender{
    if(self.table.isEditing == YES)
        self.table.editing = NO;
    [self.university setGrupBasic:self.university.grupsSeparatedByAverageAndSortbyName];
    self.editButton.title = @"EDIT";
    [self.table reloadData];
}

-(void) editActionBegin:(UIBarButtonItem*)sender{
    BOOL typeTableShow = [self.university.grupsBasic isEqual:self.university.grupsBasicCopy];
    if(typeTableShow){
        if(self.table.isEditing == YES){
            sender.title = @"EDIT";
            self.table.editing = NO;
            [self.table reloadData];
        }else{
            sender.title = @"DOWN";
            self.table.editing = YES;
            [self.table reloadData];
        }
    }
}

#pragma mark - Delegat

    // ???
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

    // string for button remove

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"student leave as!";
}

    //select row, after cancel select

#pragma mark - Change Cart Student

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ControllerCart * vcStudentCart = [[ControllerCart alloc]init];
    [self.navigationController pushViewController:vcStudentCart animated:YES];
    self.controllerStudent = vcStudentCart;

}

    // check to move row dont go to first row

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    return (proposedDestinationIndexPath.row==0) ? sourceIndexPath : proposedDestinationIndexPath;
}

    //when select row, show adding button : leding - insert, tralling - delete

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (indexPath.row==0) ? UITableViewCellEditingStyleInsert :  UITableViewCellEditingStyleDelete;
}

    //can to highlight row, row=0 or table styte editing - NO?

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return (self.table.editing==YES && indexPath.row!=0) ? YES : NO;
}


#pragma mark - UITableDataSource

#pragma mark - ADD and Remove Student

    //called when tap button delete or insert

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){

        [tableView beginUpdates];

        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];

        NSMutableArray*tempGrupBasic = [[NSMutableArray alloc]initWithArray:self.university.grupsBasic];
        AVGrupStudents*grupTemp = [[AVGrupStudents alloc]init];
        grupTemp = [self.university.grupsBasic objectAtIndex:indexPath.section];
        NSMutableArray*tempArrayStudents =  [NSMutableArray arrayWithArray:grupTemp.arrayStudents];
        [tempArrayStudents removeObjectAtIndex:indexPath.row-1];
        grupTemp = [grupTemp initWithArrayStudents:tempArrayStudents];
        [tempGrupBasic replaceObjectAtIndex:indexPath.section withObject:grupTemp];

        self.university =[[AVUniversity alloc]initWithBasicGrup:tempGrupBasic];

        [tableView endUpdates];

    }
    else{

        [tableView beginUpdates];

        NSMutableArray*tempGrupBasic = [[NSMutableArray alloc]initWithArray:self.university.grupsBasic];
        AVGrupStudents*grupTemp = [[AVGrupStudents alloc]init];
        grupTemp = [self.university.grupsBasic objectAtIndex:indexPath.section];
        NSMutableArray*tempArrayStudents =  [NSMutableArray arrayWithArray:grupTemp.arrayStudents];
        AVStudent*newStudent = [[AVStudent alloc]init];
        [tempArrayStudents insertObject: newStudent atIndex:0];
        grupTemp = [grupTemp initWithArrayStudents:tempArrayStudents];
        [tempGrupBasic replaceObjectAtIndex:indexPath.section withObject:grupTemp];
        self.university =[[AVUniversity alloc]initWithBasicGrup:tempGrupBasic];

        NSIndexPath*indexPathForAddStudent = [self getIndexPathAtStudent:newStudent forGrup:grupTemp];

        UITableViewCell*cell;
        cell = [tableView dequeueReusableCellWithIdentifier:identifierStudent];
        cell.contentView.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0.4];
        UIFont*font = [UIFont fontWithName:@"Arial" size:25];
        cell.textLabel.font = font;
        cell.textLabel.textColor = [UIColor blueColor];

        cell.textLabel.text = [NSString stringWithFormat:@"%@  %@",newStudent.firstName,newStudent.lastName];

        font = [UIFont fontWithName:@"Arial" size:30];
        cell.detailTextLabel.font = font;
        cell.detailTextLabel.textColor = (newStudent.averageScore<3) ? [UIColor redColor] : [UIColor blackColor];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f",newStudent.averageScore];

        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPathForAddStudent] withRowAnimation:UITableViewRowAnimationFade];

        [tableView endUpdates];

    }
}

    //called when move row

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSLog(@"d-%ld  s-%ld",(long)destinationIndexPath.row,(long)sourceIndexPath.row );
    if(destinationIndexPath.row == 0)
        destinationIndexPath = sourceIndexPath;
}

    //can move row?

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0)
        return NO;
    else
        return  YES;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.university.grupsBasic.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[self.university.grupsBasic objectAtIndex:section] arrayStudents] count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (indexPath.row==0) ? 30 :50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell*cell;

    if(indexPath.row == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:identifierAdd];
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierAdd];
        }
        cell.contentView.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.5];
        UIFont*font = [UIFont fontWithName:@"Arial" size:20];
        cell.textLabel.font = font;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = @"ADD Student";

    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:identifierStudent];
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifierStudent];
        }
        cell.contentView.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0.4];
        UIFont*font = [UIFont fontWithName:@"Arial" size:25];
        cell.textLabel.font = font;
        cell.textLabel.textColor = [UIColor blueColor];

        AVStudent*student = [self getStudentConsiderAddForGrups:self.university.grupsBasic atIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"%@  %@",student.firstName,student.lastName];

        font = [UIFont fontWithName:@"Arial" size:30];
        cell.detailTextLabel.font = font;
        cell.detailTextLabel.textColor = (student.averageScore<3) ? [UIColor redColor] : [UIColor blackColor];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f",student.averageScore];
    }
    return cell;

}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    AVHeader *headerView = (AVHeader*) [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifierHeader];
    AVButtonDeleteGrup*buttonRemoveSection;
    UILabel*labelNumberGrup;;

    if(headerView==nil){

        headerView = [[AVHeader alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 50)];

        headerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

        buttonRemoveSection =[AVButtonDeleteGrup buttonWithType:UIButtonTypeSystem];
        buttonRemoveSection.frame = CGRectMake(CGRectGetWidth(headerView.bounds)-100, 0, 100, 50);
        [headerView addSubview:buttonRemoveSection];
        buttonRemoveSection.oneTap = NO;

        labelNumberGrup=[[UILabel alloc]initWithFrame: CGRectMake(CGRectGetWidth(headerView.bounds)/2-100, 0, 200, 50)];
        [headerView addSubview:labelNumberGrup];

    }

    [buttonRemoveSection setTranslatesAutoresizingMaskIntoConstraints:NO];

    NSLayoutConstraint*constraintHeight = [NSLayoutConstraint constraintWithItem:buttonRemoveSection attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:50];
    NSLayoutConstraint*constraintWidth = [NSLayoutConstraint constraintWithItem:buttonRemoveSection attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:0 multiplier:1 constant:100];
    NSLayoutConstraint*constraintTrailing = [NSLayoutConstraint constraintWithItem:buttonRemoveSection attribute:NSLayoutAttributeTrailing
                                                                         relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint*constraintTop = [NSLayoutConstraint constraintWithItem:buttonRemoveSection attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeTop multiplier:1 constant:0];

    NSArray*arrayConstraintsSize = [[NSArray alloc] initWithObjects:constraintWidth,constraintHeight,nil];
    NSArray*arrayConsrtraintsPlase = [[NSArray alloc]initWithObjects:constraintTop,constraintTrailing,nil];

    [buttonRemoveSection addConstraints:arrayConstraintsSize];
    [headerView addConstraints:arrayConsrtraintsPlase];

    [buttonRemoveSection addTarget:self action:@selector(deleteGrup:) forControlEvents:UIControlEventTouchUpInside];
    [buttonRemoveSection setTitle:[NSString stringWithFormat:@"DelGrup-%ld",(long)section] forState:UIControlStateNormal];
    [buttonRemoveSection setTitle:[NSString stringWithFormat:@"Warning"] forState:UIControlStateHighlighted];
    buttonRemoveSection.titleLabel.font = [UIFont fontWithName:@"Arial" size:16];
    buttonRemoveSection.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0.5];
    buttonRemoveSection.section = section;
    buttonRemoveSection.oneTap = NO;



    [labelNumberGrup setTranslatesAutoresizingMaskIntoConstraints:NO];

    NSLayoutConstraint*constraintCenterX = [NSLayoutConstraint constraintWithItem:labelNumberGrup attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];

    NSLayoutConstraint*constraintCenterY = [NSLayoutConstraint constraintWithItem:labelNumberGrup attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];

    NSArray*arrayConsrtraintsCenterLabel = [[NSArray alloc]initWithObjects:constraintCenterX,constraintCenterY,nil];

    [headerView addConstraints:arrayConsrtraintsCenterLabel];

    labelNumberGrup.textColor = [UIColor whiteColor];
    labelNumberGrup.font = [UIFont systemFontOfSize:22 weight:1];
    labelNumberGrup.text = [NSString stringWithFormat:@"GRUP №%ld",(long)section];

    headerView.section = section;

    if(tableView.editing==NO){
        [[headerView.subviews objectAtIndex:0] removeFromSuperview];

    }

    return headerView;
}

@end

