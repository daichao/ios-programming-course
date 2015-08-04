//
//  ListViewController.swift
//
//  Created by 曹亚民 on 15/7/24.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView:UITableView!
    var leftBtn:UIButton?
    var showTextField:UITextField?
    var rightButtonItem:UIBarButtonItem?
    
    enum WeekDay:Int{
        case MON=1,TUE,WEDS,THUR,FRI,SAT,SUN
    }
    
    var cities=["上海","北京","广州","深圳","香港","台北","天津","苏州","无锡","大连","杭州","青岛","厦门"]
    var numbers=[1,4,10,6,8,12]
    
    var maps:[String:String]=Dictionary<String,String>()
    
    var str:String =
         { arg0,arg1->String in return arg0+arg1}("hello","world")
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        initParams()
        
        let type:WeekDay=WeekDay.MON
        
        switch type {
            
         case .MON :
                    print(WeekDay.MON.rawValue)
         case .TUE :
                    print(WeekDay.TUE.rawValue)
         case .WEDS :
                    print(WeekDay.WEDS.rawValue)
        }
        self.leftBtn!.userInteractionEnabled = true
    }
     override func  didReceiveMemoryWarning() {
    
    }
    func makeIncrementor(forIncrement amount: Int) -> ()->Int {
        var runningTotal = 0
        //incrementor函数并没有获取任何参数，但是在函数体内访问了runningTotal和amount变量。这是因为其通过捕获在包含它的函数体内已经存在的runningTotal和amount变量而实现
        func incrementor() -> Int {
            runningTotal += amount
            return runningTotal
        }
        
        return incrementor
    }
    
    func initParams(){
        maps=["key1":"1","key2":"2","key3":"3"]
        //      for (key,value) in maps{
        //           println(key+":"+value)
        //        }
        //        for i in 0...5{
        //            println(cities[i])
        //        }
        //        for temp in cities{
        //            println(temp)
        //      }
        let incrementByTen = makeIncrementor(forIncrement: 10)
         }
    func makeUI(){
        setupLeftBarButtonItem();
        setupRightBarButtonItem();
        self.navigationController?.navigationBarHidden=false
        showTextField=UITextField(frame: CGRectMake((UIScreen.mainScreen().bounds.width-100)/2, 49, 100, 50))
        showTextField!.placeholder = "选项:"
        showTextField!.textAlignment = .Center;
        showTextField!.contentVerticalAlignment = .Center
        showTextField!.borderStyle=UITextBorderStyle.RoundedRect
        self.view.addSubview(showTextField!)
        
        tableView=UITableView(frame: CGRectMake(0, 50+49, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
        self.tableView!.delegate=self
        self.tableView!.dataSource=self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
    }
 
    
    //加左边按钮
    func setupLeftBarButtonItem()
    {
        self.leftBtn = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        self.leftBtn!.frame = CGRectMake(0,0,50,40)
        self.leftBtn?.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.leftBtn?.setTitle("Edit", forState: UIControlState.Normal)
        self.leftBtn!.tag = 100
        self.leftBtn!.userInteractionEnabled = false
        self.leftBtn?.addTarget(self, action: "leftBarButtonItemClicked", forControlEvents: UIControlEvents.TouchUpInside)
        var barButtonItem = UIBarButtonItem(customView: self.leftBtn!)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    //按钮事件
    func leftBarButtonItemClicked()
    {
        println("leftBarButton")
        if (self.leftBtn!.tag == 100)
        {
            self.tableView?.setEditing(true, animated: true)
            self.leftBtn!.tag = 200
            self.leftBtn?.setTitle("Done", forState: UIControlState.Normal)
            //将增加按钮设置不能用
            self.rightButtonItem!.enabled=false
        }
        else
        {
            //恢复增加按钮
            self.rightButtonItem!.enabled=true
            self.tableView?.setEditing(false, animated: true)
            self.leftBtn!.tag = 100
            self.leftBtn?.setTitle("Edit", forState: UIControlState.Normal)
        }
        
    }
    //右边按钮
    func setupRightBarButtonItem()
    {
        self.rightButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: self,action: "rightBarButtonItemClicked")
        self.navigationItem.rightBarButtonItem = self.rightButtonItem
        
        
    }
   
    func rightBarButtonItemClicked()
    {
        
        var row = self.cities.count
        var indexPath = NSIndexPath(forRow:row,inSection:0)
        self.cities.append("杭州")
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        
        
    }
    // #pragma mark - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // UITableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        var row=indexPath.row as Int
        cell.textLabel?.text=self.cities[row]
        //cell.textLabel?.text = "Swift"
        //cell.detailTextLabel?.text = "Swift Detail"
        return cell
    }
    
    //删除一行
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        var index=indexPath.row as Int
        self.cities.removeAtIndex(index)
        self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        println("删除\(indexPath.row)")
        
    }
    
    //选择一行
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var animationCntroller=AnimationController()
        animationCntroller.initClosure { (str) -> Void in
            self.showTextField!.text=str
        }
        animationCntroller.receiverMsg="ListviewController"
       self.navigationController?.pushViewController(animationCntroller, animated: true)
        
       /* let alert = UIAlertView()
        alert.title = "提示"
        alert.message = "你选择的是\(self.cities[indexPath.row])"
        alert.addButtonWithTitle("Ok")
        alert.show()*/
        /*let alertController=UIAlertController(title: "提示", message: "你选择的是\(self.cities[indexPath.row])", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let option1 = UIAlertAction(title: "One", style: UIAlertActionStyle.Default, handler: {(alertController: UIAlertAction!) in (self.showTextField!.text = "1")})
        let option2 = UIAlertAction(title: "Two", style: UIAlertActionStyle.Default, handler: {(alertController: UIAlertAction!) in (self.showTextField!.text = "2")})
        let option3 = UIAlertAction(title: "Three", style: UIAlertActionStyle.Default, handler: {(alertController: UIAlertAction!) in (self.showTextField!.text = "3")})
        let option4 = UIAlertAction(title: "Four", style: UIAlertActionStyle.Default, handler: {(alertController: UIAlertAction!) in (self.showTextField!.text = "4")})
        let option5 = UIAlertAction(title: "Five", style: UIAlertActionStyle.Default, handler: {(alertController: UIAlertAction!) in (self.showTextField!.text = "5")})

        let actionCancel = UIAlertAction(title:"Cancel", style:UIAlertActionStyle.Cancel, handler:nil)
        
        alertController.addAction(option1)
        alertController.addAction(option2)
        alertController.addAction(option3)
        alertController.addAction(option4)
        alertController.addAction(option5)
        alertController.addAction(actionCancel)
        self.presentViewController(alertController, animated:true, completion:nil)*/
    }
    
    
    class customTableCell : UITableViewCell{
        
         var showImg: UIImageView!
         var smallTitle: UILabel!
         var detailSubTitle: UILabel!
        
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override  init(style: UITableViewCellStyle, reuseIdentifier: String!) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        }
    }
    
    
   }
