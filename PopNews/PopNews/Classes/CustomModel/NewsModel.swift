//
//  NewsModel.swift
//  PopNews
//
//  Created by 曹亚民 on 15/8/4.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit

class NewsModel: NSObject {
    var title: String
    var source: String
    var article_url: String
    
    init(title: String,source: String,article_url: String) {
        self.title = title
        self.source = source
        self.article_url = article_url
    }
}
