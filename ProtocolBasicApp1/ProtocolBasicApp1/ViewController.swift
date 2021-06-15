//
//  ViewController.swift
//  ProtocolBasicApp1
//
//  Created by 田川　裕隆 on 2021/06/11.
//

import UIKit

class ViewController: UIViewController, CatchProtocol {

    @IBOutlet weak var label: UILabel!
    
    var count = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Bクラスで発動した値が入っている
    func catchData(count: Int) {
        label.text = String(count)
    }
    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    // performSegueの前に呼び出される
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        // Nextの var delegate: CatchProtocol?
        nextVC.delegate = self
    }
}
