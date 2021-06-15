//
//  BaseViewController.swift
//  Swift5IntroApp
//
//  Created by 田川　裕隆 on 2021/06/12.
//

import UIKit
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        defaultSelectedIndex = 0
    }
    
    override func segementSlideHeaderView() -> UIView? {
        let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let headerHeight: CGFloat
        if #available(iOS 11.0, *){
            headerHeight = view.bounds.height/4 + view.safeAreaInsets.top
        } else {
            headerHeight = view.bounds.height/4 + topLayoutGuide.length
        }
        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        return headerView
    }
    
    override var titlesInSwitcher: [String]{
        return ["TOP", "Abema", "Yahoo", "IT", "Buzz", "CNN"]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index{
        case 0:
            return Page1ViewController()
        case 1:
            return Page2ViewController()
        case 2:
            return Page3ViewController()
        case 3:
            return Page4ViewController()
        case 4:
            return Page5ViewController()
        case 5:
            return Page6ViewController()
        default: return Page1ViewController()
        }
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
