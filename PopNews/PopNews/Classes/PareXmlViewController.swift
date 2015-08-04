//
//  PareXmlViewController.swift
//
//  Created by 曹亚民 on 15/8/3.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit

typealias returnedFunctionType = (String) -> String

#if DBUG
    let totalSeconds = 100
#else
    let totalSeconds = 500
#endif

class PareXmlViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(totalSeconds)
       // parseXML()
        /*let sayToWorld = greetingGenerator("world")
        print(sayToWorld(greeting: "Hello"))
        print(sayToWorld(greeting: " 你好 "))*/
        // Do any additional setup after loading the view.
        //let funcbackAction=myFuncThatReturnsAFunc("world")
        //print(funcbackAction("Hello"))
      
        /*customFunction("Action", timer_interval: 10, animation: {
                () -> (Void) in
                 print("animation")
              }, completions: {
                (finished) -> (Void) in
                
        })*/
        /*let option1=NSBlockOperation{
            ()->Void in
            NSLog("下载图片 - %@", NSThread.currentThread())
            NSThread.sleepForTimeInterval(1.0)
        }
        let option2=NSBlockOperation{
            ()->Void in
            NSLog("添加水印 - %@", NSThread.currentThread())
            NSThread.sleepForTimeInterval(1.0)
        }
        let option3=NSBlockOperation{
            ()->Void in
            NSLog("上传图片 - %@", NSThread.currentThread())
            NSThread.sleepForTimeInterval(1.0)
        }
        
        option2.addDependency(option1)
        option3.addDependency(option2)
        let quene=NSOperationQueue()
        
        quene.addOperations([option1,option2,option3], waitUntilFinished: false)*/
        
    }
    
    func myFuncThatReturnsAFunc(object:String) -> returnedFunctionType{
        return {
            number in
               return number+","+object
        }
       
    }
    
    func customFunction(object:String,timer_interval:Int,animation :()->(Void),completions:((finished:Bool) -> Void)?){
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
             animation()
            
             NSThread.sleepForTimeInterval(3)
            
             dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completions!(finished:true)
            })
        })
   
    }
    
    func greetingGenerator(object:String) -> (greeting:String) -> String {
        func sayGreeting(greeting:String) -> String {
            return greeting + ", " + object
        }
        return sayGreeting
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func parseXML(){
        var path=NSBundle.mainBundle().pathForResource("users", ofType: "xml")
        var xmlData=NSData(contentsOfFile: path!)
        var doc:GDataXMLDocument = GDataXMLDocument(data:xmlData, options : 0, error : nil)
        //通过XPath方式获取Users节点下的所有User节点，在路径复杂时特别方便
        var users = doc.nodesForXPath("//User", error:nil) as! [GDataXMLElement]
        for user in users {
            //User节点的id属性
            let uid = user.attributeForName("id").stringValue()
            //获取name节点元素
            let nameElement = user.elementsForName("name")[0] as! GDataXMLElement
            //获取元素的值
            let uname =  nameElement.stringValue()
            //获取tel子节点
            let telElement = user.elementsForName("tel")[0]as! GDataXMLElement
            //获取tel节点下mobile和home节点
            let mobile = (telElement.elementsForName("mobile")[0] as! GDataXMLElement).stringValue()
            let home = (telElement.elementsForName("home")[0] as! GDataXMLElement).stringValue()
            //输出调试信息
            println("User: uid:\(uid),uname:\(uname),mobile:\(mobile),home:\(home)")
        }
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
