//  Copyright © VNPTSmartCA 2021. All rights reversed.
//  SecondViewController.swift
//  TestLib01
//
//  Created by Gin on 14/12/2021.
//

import UIKit
import VNPTSmartCAiOSSDK

class SecondViewController: UIViewController {

    
    @IBOutlet weak var clientIdLbl: UILabel!
    @IBOutlet weak var tranIdLbl: UILabel!
    @IBOutlet weak var statusCode: UILabel!
    @IBOutlet weak var msg: UILabel!
    
    @IBAction func connect_vnpt_smartca(_ sender: UIButton) {
        VNPTSmartCATransaction.handleOpen();
    }
    
    var clientID = "VNPTSmartCAPartner-add1fb94-9629-4947-b7d8-f2671b04c747";
    var tranID = "37985040-caf0-4c39-8c87-ff870653fdf2";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "<VNPTSmartCA>NotificationCenterReceived"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.NotificationCenterReceived), name:NSNotification.Name(rawValue: "<VNPTSmartCA>NotificationCenterReceived"), object: nil)
        
        let tranInfo: NSMutableDictionary = NSMutableDictionary()
        
        
        tranInfo["clientId"] = clientID;
        tranInfo["tranId"] = tranID;
        
        tranIdLbl.text = "Transaction ID: \(tranID)";
        tranIdLbl.numberOfLines = 2;
        clientIdLbl.text = "Client ID: \(clientID)";
        clientIdLbl.numberOfLines = 2;
        
        VNPTSmartCATransaction.setEnvironment(_environment: VNPTSmartCATransaction.ENVIRONMENT.PRODUCTION)
        VNPTSmartCATransaction.createTransactionInformation(info: tranInfo)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func NotificationCenterReceived(notify: NSNotification) {
        let response: NSMutableDictionary = notify.object! as! NSMutableDictionary
        
        let _statusStr = "\(response["status"] as! String)";
        let _message = "\(response["message"] as! String)";
        
        statusCode.text = "Status Code: \(_statusStr)";
        msg.text = "Message: \(_message )";
        
        
    }
}
