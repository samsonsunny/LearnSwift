//
//  TodayViewController.swift
//  LearnTodayExtension
//
//  Created by Sam on 09/08/18.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit
import NotificationCenter
import WidgetFramework

class TodayViewController: UIViewController, NCWidgetProviding {
        
	@IBOutlet weak var link: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
//		link.text = 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
