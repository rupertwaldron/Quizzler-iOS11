import UIKit

class ViewController: UIViewController {
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        else if sender.tag == 3 {
            startOver()
            return
        }
            checkAnswer()
            nextQuestion()

    }
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score = \(score)"
        progressLabel.text = "\(questionNumber + 1)/\(allQuestions.listCount)"
        // sets width to the width of the screen / number of questions
        progressBar.frame.size.width = CGFloat((Int(view.frame.size.width) / allQuestions.listCount) * (questionNumber + 1))
    }

    func nextQuestion() {
        questionNumber += 1
        if questionNumber < allQuestions.listCount {
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Finished!", message: "Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (restartAction) in
                self.startOver() // if have "in" need "self"
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print("You got it!")
            score += 1
        }
        else {
            print("Wrong")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()

    }
    

    
}
