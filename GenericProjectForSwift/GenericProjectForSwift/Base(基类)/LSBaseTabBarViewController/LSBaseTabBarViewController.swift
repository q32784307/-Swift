//
//  LSBaseTabBarViewController.swift
//  GenericProjectForSwift
//
//  Created by 社科赛斯 on 2019/11/30.
//  Copyright © 2019 漠然丶情到深处. All rights reserved.
//

import UIKit
import AudioToolbox

class LSBaseTabBarViewController: UITabBarController,UITabBarControllerDelegate {
    
    var lsIndex: Int!
    var lastItem: UITabBarItem!
    var dataArray: Array<Any>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lastItem = self.tabBar.selectedItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers()
        removeTabarTopLine()
    }
    
    func setViewControllers()  {
        let path:String = Bundle.main.path(forResource: "TabBarConfigure", ofType: "plist")!
        let dataArray:[[String:String]] = NSArray.init(contentsOfFile: path) as! [[String : String]]
        for dataDic in dataArray {
            let vcView = dataDic["class"]
            let title = dataDic["title"]
            let image = dataDic["image"]
            let selectedImage = dataDic["selectedImage"]
            
            addChild(setChildViewController(viewController: vcView!, title: title!, image: image!, selectedImage: selectedImage!))
        }
    }
    
    func setChildViewController(viewController: String,title: String,image: String,selectedImage: String) -> LSBaseNavigationViewController {
        let cls:AnyClass? = NSClassFromString(Bundle.main.infoDictionary!["CFBundleExecutable"] as! String + "." + viewController)
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        vc.tabBarItem.title = title
        
        if #available(iOS 13.0, *) {
            UITabBar.appearance().tintColor = RedColor
        }
            
        //未选中状态
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : BlackColor,NSAttributedString.Key.font: SystemFont(FONTSIZE: 10)], for: .normal)
        vc.tabBarItem.image = ImageNamed(name: image).withRenderingMode(.alwaysOriginal)
        //选中状态
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(hexString: "57BD6A"),NSAttributedString.Key.font: SystemFont(FONTSIZE: 10)], for: .selected)
        vc.tabBarItem.selectedImage = ImageNamed(name: selectedImage).withRenderingMode(.alwaysOriginal)
        
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isTranslucent = false

        let nav = LSBaseNavigationViewController(rootViewController: vc)
        addChild(nav)
        
        
        return nav
    }
    
    //改变tabbar线条颜色
    func removeTabarTopLine() {
        let rect = CGRect(x: 0, y: 0, width: ScreenWidth, height: SYRealValue(value: 2 / 2))
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(RGBAColor(r: 0.99, 085, 0.92, 1).cgColor)
        context!.addRect(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tabBar.shadowImage = img
        tabBar.backgroundImage = UIImage.init()
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
