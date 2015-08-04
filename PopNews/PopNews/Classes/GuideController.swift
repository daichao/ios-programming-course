//
//  ViewController.swift
//  IOSSwift
//  Created by 曹亚民 on 15/7/22.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit

protocol ParamsProto{
    func returnParams(tmpStr: String)
}

class GuideController: UIViewController,UIScrollViewDelegate{
    
    let SCREEN_WIDTH=UIScreen.mainScreen().bounds.width
    let SCREEN_HEIGHT=UIScreen.mainScreen().bounds.height
    var scrollView:UIScrollView!
    var pageControl:UIPageControl!
    var startBtn:UIButton!
    
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
        self.navigationController?.navigationBarHidden=true
    
        scrollView=UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        scrollView.pagingEnabled=true
        scrollView.showsHorizontalScrollIndicator=false
        scrollView.showsVerticalScrollIndicator=false
        scrollView.contentSize=CGSizeMake(3*SCREEN_WIDTH, SCREEN_HEIGHT)
        for i in 1...4{
            var image=UIImage(named: "study\(i)")
            var imageView=UIImageView(image: image)
            imageView.frame=CGRectMake(CGFloat((i-1))*SCREEN_WIDTH, 0, SCREEN_WIDTH,SCREEN_HEIGHT)
            imageView.contentMode = UIViewContentMode.ScaleToFill
            scrollView.addSubview(imageView)
            
        }
        pageControl=UIPageControl(frame: CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-100, 200, 100))
        
        startBtn=UIButton(frame: CGRectMake(SCREEN_WIDTH/2-60, SCREEN_HEIGHT/2+50, 120, 35))
        
        pageControl.numberOfPages=3;
        pageControl.currentPage=0
        
        startBtn.setTitle("马上体验", forState: UIControlState.Normal)
        startBtn.setBackgroundImage(UIImage(named: "StartButton"), forState: UIControlState.Normal)
        startBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        startBtn.addTarget(self, action: "guideOver", forControlEvents: UIControlEvents.TouchUpInside)
        startBtn.hidden=true
        scrollView.bounces=false
        scrollView.delegate=self
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        self.view.addSubview(startBtn)
    }
    
    //开始使用app
    func guideOver(){
       self.navigationController?.pushViewController(ListViewController(), animated: true)
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //scrollview委托
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset=scrollView.contentOffset
        pageControl.currentPage=Int(offset.x/SCREEN_WIDTH)
        if(pageControl.currentPage==2){
            startBtn.hidden=false
        }else{
            startBtn.hidden=true
        }
    }
}


