//
//  YKStretchTabViewController.swift
//  YKStretchTabViewController
//
//  Created by Yuta Kawabe on 2016/12/14.
//  Copyright © 2016年 Yuta Kawabe. All rights reserved.
//

import Foundation
import UIKit

struct TabInfo {
    
    var vc: UIViewController
    var tab: UIButton
    var onImage: UIImage
    var offImage: UIImage
    
    func setOnImage() {
        self.tab.setBackgroundImage(self.onImage, for: .normal)
    }
    
    func setOffImage() {
        self.tab.setBackgroundImage(self.offImage, for: .normal)
    }
}

class YKStretchTabViewController: UIViewController {
    
    lazy public var tabView = UIView(frame: CGRect.zero)
    public var selectedTabIndex = 0
    public var tabHeight: CGFloat = 50
    
    lazy private var containerView = UIView(frame: CGRect.zero)
    private var tabInfoList: [TabInfo] = []
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // サブビューに追加
        self.view.addSubview(self.containerView)
        self.view.addSubview(self.tabView)
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // サブビューのレイアウト調整
        self.containerView.frame = self.view.frame
        self.tabView.frame = CGRect(x: 0, y: self.view.frame.height - self.tabHeight, width: self.view.frame.width, height: self.tabHeight)
        // タブ
        let tabWidth = self.tabView.frame.width / CGFloat(self.tabInfoList.count)
        var tabX: CGFloat = 0
        for (index, tabInfo) in self.tabInfoList.enumerated() {
            let tab = tabInfo.tab
            tab.frame = CGRect(x: tabX, y: 0, width: ceil(CGFloat(index + 1) * tabWidth) - tabX, height: self.tabView.frame.height)
            tabX = ceil(CGFloat(index + 1) * tabWidth)
        }
    }
    
    // タブ情報を渡してタブを作る
    public func setTabs(contentViewControllerList: [UIViewController], tabSelectedImageList: [UIImage], tabNormalImageList: [UIImage]) {
        
        // エラーチェック
        if !( contentViewControllerList.count == tabSelectedImageList.count && tabSelectedImageList.count == tabNormalImageList.count ) {
            print("error in StretchTabViewController.setTabs(): lists size are not equal => \(contentViewControllerList.count), \(tabSelectedImageList.count), \(tabNormalImageList.count)")
            return
        }
        
        if contentViewControllerList.count <= 0 {
            print("error in StretchTabViewController.setTabs(): lists size should be at least 1 => \(contentViewControllerList.count)")
            return
        }
        
        // 一旦初期化
        for subview in self.tabView.subviews {
            subview.removeFromSuperview()
        }
        self.tabInfoList = []
        
        // タブ準備
        for index in 0..<contentViewControllerList.count {
            
            let tab: UIButton = {
                let button = UIButton(frame: CGRect.zero)
                button.tag = index
                button.addTarget(self, action: #selector(YKStretchTabViewController.tabTapped(sender:)), for: .touchUpInside)
                self.tabView.addSubview(button)
                return button
            }()
            
            let tabInfo = TabInfo(vc: contentViewControllerList[index], tab: tab, onImage: tabSelectedImageList[index], offImage: tabNormalImageList[index])
            tabInfo.setOffImage()
            
            tab.setBackgroundImage(tabSelectedImageList[index], for: .highlighted)
            
            self.tabInfoList.append(tabInfo)
        }
        
        // 最初の画面をセット
        if self.selectedTabIndex < self.tabInfoList.count {
            let newVC = self.tabInfoList[self.selectedTabIndex].vc
            self.addChildViewController(newVC)
            self.containerView.addSubview(newVC.view)
            newVC.didMove(toParentViewController: self)
            self.tabInfoList[self.selectedTabIndex].setOnImage()
        }
        else {
            print("error in StretchTabViewController.switchContentViewController(): index should be between 0 to tabs count - 1 => \(self.selectedTabIndex)")
            return
        }
    }
    
    // タブが押された
    func tabTapped(sender: UIButton) {
        self.switchContentViewController(index: sender.tag)
    }
    
    // 画面入れ替え
    public func switchContentViewController(index: Int) {
        
        // エラーチェック
        if !( index >= 0 && index < self.tabInfoList.count ) {
            print("error in StretchTabViewController.switchContentViewController(): index should be between 0 to tabs count - 1 => \(index)")
            return
        }
        
        // 前の画面を取り除く
        self.childViewControllers.first!.willMove(toParentViewController: nil)
        self.childViewControllers.first!.view.removeFromSuperview()
        self.childViewControllers.first!.removeFromParentViewController()
        
        // 新しい画面をセット
        let newVC = self.tabInfoList[index].vc
        self.addChildViewController(newVC)
        self.containerView.addSubview(newVC.view)
        newVC.didMove(toParentViewController: self)
        
        // タブを切り替え
        self.tabInfoList[self.selectedTabIndex].setOffImage()
        self.selectedTabIndex = index
        self.tabInfoList[self.selectedTabIndex].setOnImage()
    }
}
