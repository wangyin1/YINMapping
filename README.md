# YINMapping
kvo响应式编程封装

  __weak typeof(self)weakSelf = self;
    
  
    //监听某一个属性
    [self.person y_addBind:[YINBindObj obj:self.textF keyPath:@"text"] Mapping:^(NSObject *bind, NSString *property) {
        weakSelf.person.name = weakSelf.textF.text;
    }];
    
    //监听某个对象所有属性变化
    [self.label y_addBind:[YINBindObj obj:self.person] Mapping:^(NSObject *bind, NSString *property) {
        weakSelf.label.text = weakSelf.person.name;
    }];
    
////
//    [self.label y_addBind:[YINBindObj obj:self.person keyPath:@"name"] Mapping:^(NSObject *bind, NSString *property) {
//        weakSelf.label.text = weakSelf.person.name;
//    }];

pod 'YINMapping'
