//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Gleb Osotov on 2/6/22.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]
    
    @IBOutlet weak var resultDescription: UILabel!
    @IBOutlet weak var resultTitle: UILabel!
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
       
    }
    
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first!.key
        resultTitle.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDescription.text = mostCommonAnswer.definition
    }
    
}
