//
//  SampleViewController.swift
//  YKStretchTabViewController
//
//  Created by Yuta Kawabe on 2016/12/14.
//  Copyright © 2016年 Yuta Kawabe. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showDefault(_ sender: UIButton) {
        
        let vc = YKStretchTabViewController()
        vc.setTabs(
            contentViewControllerList: [
                {
                    let vc = UIViewController()
                    vc.view.backgroundColor = .red
                    vc.view.frame = self.view.frame
                    let label = UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 20))
                    label.text = "1"
                    vc.view.addSubview(label)
                    return vc
                }(),
                {
                    let vc = UIViewController()
                    vc.view.backgroundColor = .green
                    vc.view.frame = self.view.frame
                    let label = UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 20))
                    label.text = "2"
                    vc.view.addSubview(label)
                    return vc
                }(),
                {
                    let vc = UIViewController()
                    vc.view.backgroundColor = .blue
                    vc.view.frame = self.view.frame
                    let label = UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 20))
                    label.text = "3"
                    vc.view.addSubview(label)
                    return vc
                }(),
            ],
            tabSelectedImageList: [
                UIImage(named: "tab1:3_on")!,
                UIImage(named: "tab2:3_on")!,
                UIImage(named: "tab3:3_on")!,
            ],
            tabNormalImageList: [
                UIImage(named: "tab1:3_off")!,
                UIImage(named: "tab2:3_off")!,
                UIImage(named: "tab3:3_off")!,
            ]
        )
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showCustom(_ sender: UIButton) {
        
        let vc = YKStretchTabViewController()
        vc.selectedTabIndex = 2
        vc.tabHeight = 100
        vc.setTabs(
            contentViewControllerList: [
                {
                    let vc = UIViewController()
                    vc.view.backgroundColor = .red
                    vc.view.frame = self.view.frame
                    let label = UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 20))
                    label.text = "1"
                    vc.view.addSubview(label)
                    return vc
                }(),
                {
                    let vc = UIViewController()
                    vc.view.backgroundColor = .green
                    vc.view.frame = self.view.frame
                    let label = UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 20))
                    label.text = "2"
                    vc.view.addSubview(label)
                    return vc
                }(),
                {
                    let vc = UIViewController()
                    vc.view.backgroundColor = .blue
                    vc.view.frame = self.view.frame
                    let label = UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 20))
                    label.text = "3"
                    vc.view.addSubview(label)
                    return vc
                }(),
                {
                    let vc = UIViewController()
                    vc.view.backgroundColor = .yellow
                    vc.view.frame = self.view.frame
                    let label = UILabel(frame: CGRect(x: 200, y: 200, width: 50, height: 20))
                    label.text = "4"
                    vc.view.addSubview(label)
                    return vc
                }(),
                ],
            tabSelectedImageList: [
                UIImage(named: "tab1:4_on")!,
                UIImage(named: "tab2:4_on")!,
                UIImage(named: "tab3:4_on")!,
                UIImage(named: "tab4:4_on")!,
                ],
            tabNormalImageList: [
                UIImage(named: "tab1:4_off")!,
                UIImage(named: "tab2:4_off")!,
                UIImage(named: "tab3:4_off")!,
                UIImage(named: "tab4:4_off")!,
                ]
        )
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
