//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    //criar o codigo para a proxima pergunta
    var questionNumber : Int = 0
    //Place your instance variables here
    //colocar a pontuacao
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //criar a questao, o array conta a partir do zero, por isso coloca o zero
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)" //tudo dentro sera uma string
        progressLabel.text = "\(questionNumber + 1) / 13"
        //O codigo a seguir se refere a atualizacao da barra que a cada questao avanca um retangulo, no caso, um retangulo representa 1/13 (13 questoes)
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
        
        questionLabel.text = allQuestions.list[questionNumber].questionText
        //aqui devera fazer a atualizacao da pontuacao
        updateUI()
    }
        else {
            //print("End of the quizz") essa mensagem nao vai aparecer, criar um alerta com pop-up
            //questionNumber = 0
            let alert = UIAlertController(title: "Parabens!", message: "Voce terminou o  Quizzler! Quer comecar de novo?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Recomecar", style: .default, handler: { (UIAlertAction) in
                self.startOver()
                // sempre que tiver a palavra in, deve haver um self
            })
            
            alert.addAction(restartAction)
            //nil nao vai acontecer nada de mais
            present (alert, animated: true, completion: nil)
        }
    }
        
    
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer{
         //usando a pop up dizendo o resultado da questao
            ProgressHUD.showSuccess("EXATO!")
            
            //print("ESTA CERTO!") // esse codigo a seguir indica para somente pontuar quando uma resposta estiver correta
            score = score + 1
        }
        else {
            //print("ESTA ERRADO!")
            ProgressHUD.showError("ERRADO!")
        }
        
    }
    
    
    func startOver() {
        score = 0 
        questionNumber = 0
        nextQuestion()
       
    }
    

    
}
