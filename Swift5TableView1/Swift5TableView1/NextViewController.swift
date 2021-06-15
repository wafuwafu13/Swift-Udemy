//
//  NextViewController.swift
//  Swift5TableView1
//
//  Created by 田川　裕隆 on 2021/06/10.
//

import UIKit

class NextViewController: UIViewController {

    var toDoStrig = String()
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoLabel.text = toDoStrig
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
