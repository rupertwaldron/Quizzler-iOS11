import Foundation // lighter than UIKit

class Question {
    let questionText : String
    let answer : Bool
    // use initialiser to set values. init is ctor
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}

