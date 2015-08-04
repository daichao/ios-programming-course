//
//  ViewController.swift
//
//  Created by 曹亚民 on 15/7/22.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit

class LauncherController: UIViewController,UITabBarDelegate {
    var button:UIButton!
    var tabBar:UITabBar!
    var alert:UIAlertView?
    var tabs = ["我要抢单","已抢订单","我的设置"]
    //Tab Bar上方的容器
    var contentView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func makeUI(){
        self.title = "Swift学习"
        button=UIButton.buttonWithType(.System) as! UIButton
        button.frame=CGRectMake((UIScreen.mainScreen().bounds.width-200)/2, 50, 200, 100)
        button.setTitle("Swift", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonDid:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tag=2015
        self.view.addSubview(button)
        ////////////////////////////
        tabBar=UITabBar()
        tabBar.frame=CGRectMake(0, UIScreen.mainScreen().bounds.height-49, UIScreen.mainScreen().bounds.width, 49)
        var items:[UITabBarItem] = []
        for tab in self.tabs {
            var tabItem = UITabBarItem()
            tabItem.title = tab
            //tabItem.image= UIImage(named: "")
            items.append(tabItem)
        }
        //设置Tab Bar的标签页
        tabBar.setItems(items, animated: true)
        //本类实现UITabBarDelegate代理，切换标签页时能响应事件
        tabBar.delegate = self
        //代码添加到界面上来
        self.view.addSubview(tabBar);
    }
    func buttonDid(sender: UIButton!){
       // println(sender.tag)
        alert = UIAlertView()
        alert!.title = "Hi"
        alert!.message = "Hello"
        alert?.addButtonWithTitle("点击我")
        NSTimer.scheduledTimerWithTimeInterval(5, target:self, selector:"dismiss:", userInfo:alert!, repeats:false)
        alert!.show()
    }
    func dismiss(timer:NSTimer){
        alert!.dismissWithClickedButtonIndex(0, animated:true)
    }
   
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        println(item.title)
    }
    
    func getString(aa: String)->(String,String){
        
        return (aa,aa)
    }
    
    
}

