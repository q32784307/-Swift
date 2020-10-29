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
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(mainTableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")
        if cell != nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "TableViewCell")
            cell?.textLabel?.font = SystemFont(FONTSIZE: SYRealValue(value: 30 / 2))
            cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        }
        
        if indexPath.row == 0 {
            cell?.textLabel?.text = "闲杂"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SYRealValue(value: 100 / 2)
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
