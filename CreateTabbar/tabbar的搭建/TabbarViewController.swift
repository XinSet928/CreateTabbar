//
//  TabbarViewController.swift
//  tabbar的搭建
//
//  Created by mac on 16/9/29.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addChildViewControllers()
        
        self.tabBar.tintColor = UIColor.red
    }

    
    /**
     # 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childControllerName: "OneViewController", title: "首页", imageName: "TabBar_home_23x23_")
        addChildViewController(childControllerName: "TwoViewController", title: "商品", imageName: "TabBar_gift_23x23_")
        addChildViewController(childControllerName: "ThreeViewController", title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController(childControllerName: "FourViewController", title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        // 动态获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }


}
