//
//  LSChatDetailsViewController.swift
//  GenericProjectForSwift
//
//  Created by 社科塞斯 on 2020/10/30.
//  Copyright © 2020 漠然丶情到深处. All rights reserved.
//

import UIKit

class LSChatDetailsViewController: LSBaseViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigation()
        analysis()
        createSubViews()
    }
    
    func setNavigation() {
        navView.titleLabelText = "离散"
        navView.rightButton.isHidden = false
        navView.rightButtonImage = "more_black"
        navView.rightActionBlock = {() -> Void in
            let LSChatUserInformationVC = LSChatUserInformationViewController.init()
            self.navigationController?.pushViewController(LSChatUserInformationVC, animated: true)
        }
    }
    
    override func analysis() {

    }
    
    override func createSubViews() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainTableView.register(LSChatDetailsTableViewCell.self, forCellReuseIdentifier: "LSChatDetailsTableViewCell")
        self.view.addSubview(mainTableView)
        
        let bgImageView = UIImageView.init(frame: self.view.bounds)
        bgImageView.image = UIImage.init(named: "背景图")
        self.mainTableView.backgroundView = bgImageView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "LSChatDetailsTableViewCell")
        if cell != nil {
            cell = LSChatDetailsTableViewCell.init(style: LSChatDetailsTableViewCell.CellStyle.default, reuseIdentifier: "LSChatDetailsTableViewCell")
            cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        }
        
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SYRealValue(value: 80 / 2)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
