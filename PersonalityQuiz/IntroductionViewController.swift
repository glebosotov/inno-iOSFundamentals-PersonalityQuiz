//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Gleb Osotov on 2/6/22.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var pic4: UILabel!
    @IBOutlet weak var pic3: UILabel!
    @IBOutlet weak var pic2: UILabel!
    @IBOutlet weak var pic1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotate(view: pic1, aCircleTime: 10)
        rotate(view: pic2, aCircleTime: 10)
        rotate(view: pic3, aCircleTime: 10)
        rotate(view: pic4, aCircleTime: 10)
    }
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) { }
    
    func rotate(view: UIView, aCircleTime: Double) { //UIView
            
            UIView.animate(withDuration: aCircleTime/2, delay: 0.0, options: .curveLinear, animations: {
                view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            }, completion: { finished in
                UIView.animate(withDuration: aCircleTime/2, delay: 0.0, options: .curveLinear, animations: {
                    view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2))
                }, completion: { finished in
                    self.rotate(view: view, aCircleTime: aCircleTime)
                })
            })
    }

}

