//
//  QuestionViewController.swift
//  HouseTest
//
//  Created by Nathaniel Cox on 2/1/19.
//  Copyright © 2019 Nathaniel Cox. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

  
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet var answerButtons: [UIButton]!
  @IBOutlet weak var stackView: UIStackView!
  
  @IBOutlet weak var progressBar: UIProgressView!
  
  var questionIndex = 0
  var chosenAnswers = [Answer]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // shuffle the questions and the answers each time the view controller is loaded
    questions.shuffle()
    for i in 0..<questions.count {
      questions[i].answers.shuffle()
    }
    updateUI()
  }
  
    
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    if let senderIndex = answerButtons.index(of: sender) {
      chosenAnswers.append(questions[questionIndex].answers[senderIndex])
    }
    nextQuestion()
  }
  
  /// Updates the UI to display the current question with its answers, and increment the progress bar.
  func updateUI() {
    title = "Question #\(questionIndex + 1)"
    let currentQuestion = questions[questionIndex]
    questionLabel.text = currentQuestion.text
    // hiding the stackView while the answers are being updated makes the transition look much smoother
    stackView.isHidden = true
    for buttonIndex in answerButtons.indices {
      let button = answerButtons[buttonIndex]
      button.setTitle(currentQuestion.answers[buttonIndex].text, for: .normal)
    }
    stackView.isHidden = false
    let currentProgress = Float(questionIndex) / Float(questions.count)
    progressBar.setProgress(currentProgress, animated: true)
  }
  
  /// Updates the question index as long as there are more questions. Once the last question has been reached,
  /// segues to results view controller.
  func nextQuestion() {
    questionIndex += 1
    if questionIndex < questions.count {
      updateUI()
    } else {
      performSegue(withIdentifier: "ResultsSegue", sender: nil)
    }
  }
  
  /// Sends the array of answers to the results view controller.
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "ResultsSegue", let controller = segue.destination as? ResultsViewController else { return }
    controller.answers = chosenAnswers
  }

}
