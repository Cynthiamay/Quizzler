//
//  Question.swift
//  Quizzler
//
//  Created by Treinamento on 8/20/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
// ESSA PARTE EH PARA DEFINIR AS VARIAVEIS DAS QUESTOES

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    //valores INICIAIS, nao faz sentido definir o valor das variaveis (determinar os valores iniciais do metodo)
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}

