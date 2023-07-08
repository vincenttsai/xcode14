//
//  ViewController.swift
//  HelloApp
//
//  Created by Vincent on 2023/7/6.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var block: UIView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    var colors : [UIColor] = [.blue,.green,.red,.purple]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.block.backgroundColor = colors[0]
        
        
        
    }
    @IBAction func changeColor(_ sender: Any) {
        
        
        if let currentBg = self.block.backgroundColor,
           var index  = colors.firstIndex(of: currentBg){
            index = index + 1
            if index == self.colors.count {
                index = 0
            }
            self.block.backgroundColor = self.colors[index]
        }
        
        
    }
    
    @IBAction func changePosition(_ sender: Any) {
        
        if leftConstraint.constant == 0 && topConstraint.constant == 0 {
            UIView.animate(withDuration: 2) {
                self.leftConstraint.constant = self.view.bounds.width - self.block.frame.width
                self.changeColor(self)
                self.view.layoutIfNeeded()
            }
        }else if topConstraint.constant == 0 &&
                    self.leftConstraint.constant != 0{
            UIView.animate(withDuration: 2) {
                self.topConstraint.constant =
                self.view.safeAreaLayoutGuide.layoutFrame.height - self.block.frame.height
                self.changeColor(self)

                self.view.layoutIfNeeded()
            }
        }else if leftConstraint.constant != 0 &&
                    topConstraint.constant != 0 {
            UIView.animate(withDuration: 2) {
                self.leftConstraint.constant = 0
                self.changeColor(self)
                self.view.layoutIfNeeded()
            }
        }else{
            
            UIView.animate(withDuration: 1) {
                self.leftConstraint.constant = 0
                self.topConstraint.constant = 0
                self.changeColor(self)
                self.view.layoutIfNeeded()
            }
        }
        
        
    }
}

