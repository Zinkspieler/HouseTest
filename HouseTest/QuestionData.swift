//
//  Questions.swift
//  HouseTest
//
//  Created by Nathaniel Cox on 2/1/19.
//  Copyright © 2019 Nathaniel Cox. All rights reserved.
//

import Foundation

/// A question to ask as part of the test. Each question has a text prompt and four possible answers associated with it.
struct Question {
  let text: String
  var answers: [Answer]
}

/// An answer to a question. Each answer is associated with a specific House.
struct Answer {
  let text: String
  let house: House
}


enum House: String {
  case stark = "Stark", lannister = "Lannister", targaryen = "Targaryen", martell = "Martell"
  
  var description: String {
    switch self {
    case .stark:
      return "You are an idealistic rebel who is commited to justice. You will most likely get your head chopped off for no good reason."
    case .lannister:
      return "You are a rich snob who can buy anything and loves to show it. The only thing making up for your lack of a soul is your fabulous hair."
    case .targaryen:
      return "You are the rightful heir to the Seven Kingdoms. Even though you seem to spend most of your time trouncing around in Essos."
    case .martell:
      return "You are a passionate lover. The only thing you love more than indulging your pleasure is taking revenge on those who have wronged you."
    }
  }
}

/// A hard-coded array of questions.
///
/// It would be possible to extend the app by allowing the user to add additional questions,
/// or swap out this list for another at runtime.
///
/// Although the app currently doesn't offer any way of changing the questions, the array is marked `var` instead of `let`
/// in order to allow it to be shuffled each time the test is begun.
var questions = [
  Question(text: "What is your favorite food?", answers: [
      Answer(text: "Snakes roasted with chilis", house: .martell),
      Answer(text: "Meat pie", house: .stark),
      Answer(text: "Capon with sweet meats", house: .lannister),
      Answer(text: "Raw horse heart", house: .targaryen)
    ]),
  Question(text: "How do you like to spend your free time?", answers: [
      Answer(text: "Counting my gold", house: .lannister),
      Answer(text: "Scowling earnestly", house: .stark),
      Answer(text: "Freeing enslaved people", house: .targaryen),
      Answer(text: "Sunbathing", house: .martell)
    ]),
  Question(text: "What is your ideal steed?", answers: [
      Answer(text: "A dragon. Or three", house: .targaryen),
      Answer(text: "A black stallion", house: .martell),
      Answer(text: "The finest warhorse in Westeros", house: .lannister),
      Answer(text: "My father's horse", house: .stark)
    ]),
  Question(text: "Are you attracted to your siblings?", answers: [
      Answer(text: "Yes, secretly", house: .lannister),
      Answer(text: "I'm attracted to everyone", house: .martell),
      Answer(text: "Yes, we will rule as King and Queen", house: .targaryen),
      Answer(text: "No", house: .stark)
    ]),
  Question(text: "What would you most likely die for?", answers: [
      Answer(text: "Honor", house: .stark),
      Answer(text: "Money", house: .lannister),
      Answer(text: "The realm", house: .targaryen),
      Answer(text: "Revenge", house: .martell)
    ]),
  Question(text: "What is your ideal pet?", answers: [
      Answer(text: "A baby dragon", house: .targaryen),
      Answer(text: "A wolf", house: .stark),
      Answer(text: "A scorpion", house: .martell),
      Answer(text: "A hound", house: .lannister)
    ]),
  Question(text: "What is your perfect birthday present?", answers: [
      Answer(text: "Gold", house: .lannister),
      Answer(text: "Dragon eggs", house: .targaryen),
      Answer(text: "The head of my sister's murderer", house: .martell),
      Answer(text: "A horn of good ale", house: .stark)
    ])
]
