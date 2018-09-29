//
//  ViewController.m
//  YINMappingTest
//
//  Created by apple on 2018/9/29.
//  Copyright © 2018年 王印. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+YINMapping.h"
#import "Person.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textF;
@property (strong,nonatomic) Person     *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [Person new];
    
    __weak typeof(self)weakSelf = self;
    
    [self.person y_addBind:[YINBindObj obj:self.textF keyPath:@"text"] Mapping:^(NSObject *bind, NSString *property) {
        weakSelf.person.name = weakSelf.textF.text;
    }];
    
    [self.label y_addBind:[YINBindObj obj:self.person] Mapping:^(NSObject *bind, NSString *property) {
        weakSelf.label.text = weakSelf.person.name;
    }];
    
////
//    [self.label y_addBind:[YINBindObj obj:self.person keyPath:@"name"] Mapping:^(NSObject *bind, NSString *property) {
//        weakSelf.label.text = weakSelf.person.name;
//    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)click:(UIButton *)sender {
    self.textF.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
