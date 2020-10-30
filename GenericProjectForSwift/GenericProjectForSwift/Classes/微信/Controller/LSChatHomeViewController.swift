//
//  LSChatHomeViewController.swift
//  GenericProjectForSwift
//
//  Created by 社科塞斯 on 2020/10/29.
//  Copyright © 2020 漠然丶情到深处. All rights reserved.
//

import UIKit

class LSChatHomeViewController: LSBaseViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigation()
        analysis()
        createSubViews()
    }
    
    func setNavigation() {
        navView.titleLabelText = "微信"
        navView.isShowLeftButton = true
    }
    
    override func analysis() {

    }
    
    override func createSubViews() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: SYRealValue(value: 150 / 2), bottom: 0, right: 0)
        mainTableView.register(LSChatHomeTableViewCell.self, forCellReuseIdentifier: "LSChatHomeTableViewCell")
        self.view.addSubview(mainTableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "LSChatHomeTableViewCell")
        if cell != nil {
            cell = LSChatHomeTableViewCell.init(style: LSChatHomeTableViewCell.CellStyle.default, reuseIdentifier: "LSChatHomeTableViewCell")
            cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        }
        
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let LSChatDetailsVC = LSChatDetailsViewController.init()
        self.navigationController?.pushViewController(LSChatDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SYRealValue(value: 140 / 2)
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
