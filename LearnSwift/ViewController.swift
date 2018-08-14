//
//  ViewController.swift
//  LearnSwift
//
//  Created by Sam on 20/07/18.
//  Copyright © 2018 Orange. All rights reserved.
//

import UIKit
import SafariServices 
import DBKit
import WidgetKit

let cellIdentifier: String = "tableViewCell"

//enum AppColor: UIColor {
//	case red = UIcolo
//	case green
//	case blue
//	case orange
//	case yellow
//	case pink
//	case brown
//
//	var lightColor: UIColor {
//		return
//	}
//}

let colorArray: [UIColor] = [UIColor.orange, UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.white, UIColor.green]

class LinkCell: UITableViewCell {
	@IBOutlet weak var outerView: UIView!
	@IBOutlet weak var linkTitle: UILabel!
}

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var linksArray: [String] = [
		"https://docs.swift.org/swift-book/LanguageGuide/MemorySafety.html",
		"https://www.cdac.in/index.aspx?id=mc_mat_MTS",
		"https://medium.com/capital-one-developers/smooth-scrolling-in-uitableview-and-uicollectionview-a012045d77f",
		"https://developer.apple.com/documentation/quicklook",
		"https://developer.apple.com/documentation/uikit/views_and_controls",
		"https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 44
		
		print("My Name is \(name)")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tableView.reloadData()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func addLink(_ sender: Any) {
		
		let alertController = UIAlertController(title: "AddLink", message: "Enter the link to read later", preferredStyle: .alert)
	
		alertController.addTextField { (textField) in
			textField.backgroundColor = UIColor.yellow
			textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
		}
		let saveAction = UIAlertAction(title: "Add", style: .default) { (action) in
			let addedLink = alertController.textFields?.first
			guard let newLink = addedLink?.text else {
				return
			}
			if var links: [String] = sharedDefaults?.stringArray(forKey: "linkList") {
				links.append(newLink)
				sharedDefaults?.set(links, forKey: "linkList")
			} else {
				sharedDefaults?.set([newLink], forKey: "linkList")
			}
		}
		alertController.addAction(saveAction)
		self.present(alertController, animated: true, completion: nil)
	}
}

extension ViewController: SFSafariViewControllerDelegate {
	
}

extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let siteURL: URL = URL(string: linksArray[indexPath.row]) else {
			return
		}
		let safariView = SFSafariViewController(url: siteURL)
		safariView.delegate = self
		self.present(safariView, animated: true, completion: nil)
	}
}

extension ViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return linksArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let linkCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? LinkCell else {
			return UITableViewCell()
		}
		linkCell.linkTitle.text = linksArray[indexPath.row]
		if colorArray.count > indexPath.row {
			linkCell.outerView.backgroundColor = colorArray[indexPath.row]
		}
		return linkCell
	}
	
//	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		guard let linkCell = cell as? LinkCell else {
//			return
//		}
//		linkCell.linkTitle.text = linksArray[indexPath.row]
//		if colorArray.count > indexPath.row {
//			linkCell.outerView.backgroundColor = colorArray[indexPath.row]
//		}
//	}
}

