//
//  ViewController.swift
//  PagerView
//
//  Created by MAC on 22/01/21.
//

import UIKit
import PagerTab
class ViewController: UIViewController, PagerTabDelegate {
    
    
    @IBOutlet weak var v: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearence = PagerTabAppearance(type: PagerTabType.fixedNumber(2), color: FlatColor.yellow, titleColors: [(FlatColor.blue, .selected), (FlatColor.blue, .highlighted), (FlatColor.lightYellow, .normal)] )
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let oneVC = storyboard.instantiateViewController(withIdentifier: "one") as! one
        let twoVC = storyboard.instantiateViewController(withIdentifier: "Two") as! Two
        
        let viewcontrollers:[PagerTabPage] = [(oneVC,"First"),(twoVC,"Second")]
        
        let pager = PagerTab(viewcontrollers,appearence: appearence)
        pager.delegate = self
        
        self.add(childController: pager, toView: self.v)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageDidAppear(_ index: Int, page: PagerTabPage) {
        print("Page Swipe At \(index) And Page  is \(page)")
    }
    
}

