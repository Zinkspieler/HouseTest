//
//  ResultsViewController.swift
//  HouseTest
//
//  Created by Nathaniel Cox on 2/1/19.
//  Copyright © 2019 Nathaniel Cox. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

  @IBOutlet var shieldImageViews: [UIImageView]!
  
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var characterImageView: UIImageView!
  
  var answers: [Answer] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.hidesBackButton = true
    
    if let house = calculateResult() {
      displayResults(for: house)
    }
  }
  
  /// Calculates the `House` with the most answers
  func calculateResult() -> House? {
    var frequencyOfResults = [House : Int]()
    for answer in answers {
      frequencyOfResults[answer.house] = (frequencyOfResults[answer.house] ?? 0) + 1
    }
    let sortedResults = frequencyOfResults.sorted { $0.1 > $1.1 }
    return sortedResults.first?.key
  }
  
  /// Updates the UI with images and description of the `House`.
  func displayResults(for house: House) {
    resultLabel.text = "You are a \(house.rawValue)!"
    descriptionLabel.text = house.description
    characterImageView.image = UIImage(named: house.rawValue.lowercased())
    for imageView in shieldImageViews {
      imageView.image = UIImage(named: "House_\(house.rawValue)")
    }
  }

    
}
