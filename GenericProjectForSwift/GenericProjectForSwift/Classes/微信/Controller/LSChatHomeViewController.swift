//
//  LSChatHomeViewController.swift
//  GenericProjectForSwift
//
//  Created by 社科塞斯 on 2020/10/29.
//  Copyright © 2020 漠然丶情到深处. All rights reserved.
//

import UIKit

class LSChatHomeViewController: LSBaseViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    

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

        
        // 创建searchResultVC
        let searchVC = UIViewController()
        
        
        
        let searchController = UISearchController(searchResultsController: nil)
        // 设置背景颜色
        searchController.view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
         //默认为YES,设置开始搜索时背景显示与否
         searchController.dimsBackgroundDuringPresentation = false
         //默认为YES,控制搜索时，是否隐藏导航栏
         searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchResultsUpdater = self
        // 设置开始搜索时导航条是否隐藏
        searchController.hidesNavigationBarDuringPresentation = false
        // 设置开始搜索时背景是否显示
        
        searchController.searchBar.searchBarStyle = .minimal
        
        // 将搜索框视图设置为tableView的tableHeaderView
        mainTableView.tableHeaderView = searchController.searchBar

//        // 搜索框
//        let bar = searchController.searchBar
//        // 样式
//        bar.barStyle = .default
//        // 设置光标及取消按钮的颜色
//        bar.tintColor = UIColor(red: 0.12, green: 0.74, blue: 0.13, alpha: 1.00)
//        // 设置代理
//        bar.delegate = self
//        // 去除背景及上下两条横线
//        bar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
//        // 右侧语音
//        bar.showsBookmarkButton = true
//        bar.setImage(UIImage(), for: .bookmark, state: .normal)
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
