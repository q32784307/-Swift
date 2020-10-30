//
//  LSChatHomeTableViewCell.swift
//  GenericProjectForSwift
//
//  Created by 社科塞斯 on 2020/10/30.
//  Copyright © 2020 漠然丶情到深处. All rights reserved.
//

import UIKit

class LSChatHomeTableViewCell: UITableViewCell {
    var pictureImageView: UIImageView!
    var nameLabel: UILabel!
    var contentLabel: UILabel!
    var timeLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubviews() {
        pictureImageView = UIImageView.init()
        pictureImageView.backgroundColor = RedColor
        pictureImageView.contentMode = UIView.ContentMode.scaleAspectFill
        pictureImageView.layer.masksToBounds = true
        pictureImageView.layer.cornerRadius = SYRealValue(value: 10 / 2)
        self.contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(self.contentView).offset(SYRealValue(value: 30 / 2))
            make.size.equalTo(CGSize(width: SYRealValue(value: 100 / 2), height: SYRealValue(value: 100 / 2)))
        }
        
        nameLabel = UILabel.init()
        nameLabel.text = "离散"
        nameLabel.font = SystemFont(FONTSIZE: SYRealValue(value: 34 / 2))
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pictureImageView).offset(0)
            make.left.equalTo(pictureImageView.snp.right).offset(SYRealValue(value: 20 / 2))
        }
        
        contentLabel = UILabel.init()
        contentLabel.text = "哈哈哈"
        contentLabel.font = SystemFont(FONTSIZE: SYRealValue(value: 26 / 2))
        contentLabel.textColor = UIColor.init(hexString: "9B9B9B")
        self.contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(pictureImageView.snp.bottom).offset(0)
            make.left.equalTo(pictureImageView.snp.right).offset(SYRealValue(value: 20 / 2))
            make.right.equalTo(self.contentView.snp.right).offset(SYRealValue(value: -30 / 2))
        }
        
        timeLabel = UILabel.init()
        timeLabel.text = "15:29"
        timeLabel.font = SystemFont(FONTSIZE: SYRealValue(value: 22 / 2))
        timeLabel.textColor = UIColor.init(hexString: "9B9B9B")
        self.contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pictureImageView).offset(0)
            make.right.equalTo(self.contentView.snp.right).offset(SYRealValue(value: -30 / 2))
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
