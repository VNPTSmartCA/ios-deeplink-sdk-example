//
//  SecondViewController.swift
//  TestLib01
//
//  Created by Gin on 14/12/2021.
//

import UIKit
import VNPTSmartCAiOSSDK

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.NoficationCenterTokenReceived), name:NSNotification.Name(rawValue: "<VNPTSmartCA>NoficationCenterTokenReceived"), object: nil)
        
        let tranInfo: NSMutableDictionary = NSMutableDictionary()
        tranInfo["clientId"] = "partnerId03"
        tranInfo["tranId"] = "bd8bd260-5302-4863-8fc2-013ab1583642"
        VNPTSmartCATransaction.setEnvironment(_environment: VNPTSmartCATransaction.ENVIRONMENT.DEMO)
        VNPTSmartCATransaction.createTransactionInformation(info: tranInfo)
        
        let buttonOpen = UIButton()
        buttonOpen.frame = CGRect(x: 20, y: 200, width: 260, height: 40)
        buttonOpen.setTitle("Open VNPT SmartCA", for: .normal)
        buttonOpen.setTitleColor(UIColor.white, for: .normal)
        buttonOpen.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        buttonOpen.backgroundColor = UIColor.blue
        
        buttonOpen.addTarget(self, action: #selector(self.openApp), for: .touchUpInside)
        self.view.addSubview(buttonOpen)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func openApp() {
        VNPTSmartCATransaction.handleOpen()
    }
    
    @objc func NoficationCenterTokenReceived(notif: NSNotification) {
        print("VNPT SmartCA:\(notif.object!)")
    }
}
