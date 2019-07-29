//
//  ViewController.swift
//  RebelTestPragati
//
//  Created by Pragati Samant on 20/07/19.
//  Copyright © 2019 Pragati. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CategoryCellDelegate {
    
    @IBOutlet weak var categoryTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        cell.delegate = self
        cell.fetchData(url: categories[indexPath.row].url)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return  (self.view.frame.height - 64)/4.0
    }
  
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         (cell as! CategoryCell).configureFlowLayout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action:#selector(refresh))
       
    }
    @objc func refresh() {
        categoryTableView.reloadData()
    }
    func handleItemSelection() {
        let vc = BookViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension UIViewController {
    func showAlert(message:String){
        let alert = UIAlertController(title: "",message:message,preferredStyle: .alert)
        self.present(alert, animated: false, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1000) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}

