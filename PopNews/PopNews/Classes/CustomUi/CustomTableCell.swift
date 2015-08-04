//
//  TableViewCell.swift
//  PopNews
//
//  Created by 曹亚民 on 15/8/4.
//  Copyright (c) 2015年 曹亚民. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    var titlLabel:UILabel!
    var sourceLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func refreshCellWithModel(model:NewsModel)
    {
        self.textLabel?.text=model.title
        self.sourceLabel.text=model.source
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        //创建titlLabel
        self.titlLabel = UILabel(frame: CGRectMake(20, 0, 220, 70));
        titlLabel.font = UIFont.systemFontOfSize(14);
        titlLabel.lineBreakMode=NSLineBreakMode.ByWordWrapping
        titlLabel.numberOfLines = 0
        self.addSubview(self.titlLabel);
        
        //创建sourceLabel
        self.sourceLabel = UILabel(frame: CGRectMake(WIDTH-100, 70, 100, 20));
        self.sourceLabel.font = UIFont.systemFontOfSize(12);
        self.addSubview(self.sourceLabel);

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(code:)has not brrn implomented");
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
