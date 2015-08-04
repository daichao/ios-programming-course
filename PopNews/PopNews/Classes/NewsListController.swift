//
//  ViewController.swift
//  PopNews
//
//  Created by 曹亚民 on 15/8/4.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsListController: BaseViewController,UITableViewDataSource,UITableViewDelegate  {
    
    var newsObj = Dictionary<String, String>()
    var newsArr = Array<NewsModel>()
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeUI()
        Alamofire.request(.GET, NEW_API).responseJSON() {
            (_, _, data, _) in
            
            let json=JSON(data!)
            var countOfItems:String = json["status"].stringValue
            if(countOfItems == "000000"){
                var content = json["detail"]
                var contentSize:Int = json["detail"].arrayValue.count
               for index in 0..<contentSize{
                 var news=NewsModel(title:content[index]["title"].stringValue,source:content[index]["source"].stringValue,article_url:content[index]["article_url"].stringValue)
                 self.newsArr.append(news)
              }
                self.tableView.reloadData()
           }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeUI(){
        self.navigationController?.navigationBarHidden=false
        self.title=" 今日最新新闻"
        tableView=UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
        self.tableView!.delegate=self
        self.tableView!.dataSource=self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)

    }
    // #pragma mark - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // UITableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIndentifier :String = "cellIdentifier";
        var cell:CustomTableCell? = tableView.dequeueReusableCellWithIdentifier(cellIndentifier) as? CustomTableCell
        if cell == nil
        {
            cell = CustomTableCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIndentifier)
            cell?.selectionStyle = .Gray;
            //设置选中cell样式
            cell!.selectionStyle = .Gray;
            //设置cell后面箭头样式
            cell!.accessoryType = .DisclosureIndicator;
        }
        var cellModel:NewsModel = self.newsArr[indexPath.row]
        
        cell?.refreshCellWithModel(cellModel)

        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var cellModel:NewsModel = self.newsArr[indexPath.row]
        var webviewController=WebViewController()
        webviewController.shouldLoadUrl=cellModel.article_url
        self.navigationController?.pushViewController(webviewController, animated: true)
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

