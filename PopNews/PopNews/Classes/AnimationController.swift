//
//  AnimationController.swift
//
//  Created by 曹亚民 on 15/7/30.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit
typealias xxClosure=(str : String)->Void

class AnimationController: UIViewController {
   
    var dimension:Int = 4
    var width:CGFloat = 50
    var padding:CGFloat = 6
    var bgView:UIView!
    var button:UIButton!
    var myClosure:xxClosure?
    var backgrounds:Array<UIView>!
    var receiverMsg:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgrounds = Array<UIView>()
        makeUI()
        performAnimation()
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "receviceNotifi:", name: "swiftNotification", object: nil)
        NSLog(receiverMsg!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear( true)
       //NSNotificationCenter.defaultCenter().removeObserver("swiftNotification")
         //print("removeObserver")
    }
    
    func makeUI(){
        var x:CGFloat = 0
        var y:CGFloat = 0
        button=UIButton(frame: CGRectMake( (UIScreen.mainScreen().bounds.width-200)/2, 20+49, 200, 40))
        button.setTitle("闭包反向传值", forState: UIControlState.Normal)
        button.addTarget(self, action: "btnClick" , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        bgView=UIView(frame: CGRectMake( (UIScreen.mainScreen().bounds.width-218)/2, 20+49+40, 218, 218))
        bgView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(bgView)
        for i in 0..<dimension
        {
            y = 0
            for j in 0..<dimension
            {
                //初始化视图
                var background = UIView(frame:CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.bgView.addSubview(background)
                //将视图保存起来，以备后用
                backgrounds.append(background)
                y += padding + width
             }
              x += padding+width
         }
      }
    func performAnimation(){
        for view in backgrounds {
            view.layer.setAffineTransform(CGAffineTransformMakeScale(0.2, 0.2))
            UIView.animateWithDuration(1, delay:0.01,
            options:UIViewAnimationOptions.TransitionNone, animations: {
                   () -> Void in
                    view.layer.setAffineTransform(CGAffineTransformMakeRotation(90))
                
                }, completion: {
                    (finished:Bool) -> Void in
                    UIView.animateWithDuration(1, animations:{
                        ()-> Void in
                        view.layer.setAffineTransform(CGAffineTransformIdentity)
                    })
            })
        }
    }
    func initClosure(otherClosure:xxClosure){
        myClosure=otherClosure
    }
    
    /*func receviceNotifi(notifi:NSNotification){
        
        var str=notifi.object as! String
        print(str)
    }*/
    
    func btnClick(){
 
        if (myClosure != nil){
               myClosure!( str: "AnimationController pass the value")
        }
        self.navigationController?.popViewControllerAnimated(true)
        //NSNotificationCenter.defaultCenter().postNotificationName("swiftNotification", object: "swift push notification")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
