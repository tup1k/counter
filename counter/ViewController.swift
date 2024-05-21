//
//  ViewController.swift
//  counter
//
//  Created by Олег Кор on 21.05.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    private var myCounter: Int = 0 // Переменная определяющая показания счетчика
    
    @IBOutlet private weak var buttonPlus: UIButton! // Графический интерфейс кнопки + 1
    @IBOutlet private weak var buttonMinus: UIButton! // Графический интерфейс кнопки - 1
    @IBOutlet private weak var buttonZeroCount: UIButton! // Графический интерфейс кнопки обнуления
    @IBOutlet private weak var counterLabel: UILabel! // Графический интерфейс счетчика
    @IBOutlet private weak var protocolTextField: UITextView! // Графический интерфейс протокола событий

    // Метод вычисления актуальных даты и времени
    func actualData(_ myDate: Date) -> String {
        let maDateFormat = DateFormatter()
        maDateFormat.dateFormat = "dd.MM.YYYY HH:mm:ss"
        let myCurrentFormatedDate = maDateFormat.string(from: myDate)
        return myCurrentFormatedDate
        }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        counterLabel.text = "Значение счетчика: \(String(myCounter))" //Ставим начальный текст счетчика по ТЗ
        
        protocolTextField.text = "История изменений:\n" // Ставим стартовый текст счетчика
        protocolTextField.isEditable = false // Запрещаем пользователю редактировать поле протокола
        
        buttonPlus.setTitle("", for: .normal) // Убираем текст у кнопки чтобы оставить только иконку
        buttonPlus.setImage(UIImage(systemName: "plus"), for: .normal) // Добавляем системную иконку +
        buttonPlus.tintColor = UIColor.white // Делаем цвет иконки белым для контраста
        buttonPlus.backgroundColor = .red //Делаем цвет кнопки красным по ТЗ
        buttonPlus.layer.cornerRadius = 10 //Скругляем углу кнопки для красоты
        
        buttonMinus.setTitle("", for: .normal) // Убираем текст у кнопки чтобы оставить только иконку
        buttonMinus.setImage(UIImage(systemName: "minus"), for: .normal) // Добавляем системную иконку -
        buttonMinus.tintColor = UIColor.white // Делаем цвет иконки белым для контраста
        buttonMinus.backgroundColor = .blue //Делаем цвет кнопки зеленым по ТЗ
        buttonMinus.layer.cornerRadius = 10 //Скругляем углу кнопки для красоты
        
        buttonZeroCount.setImage(UIImage(systemName: "eraser"), for: .normal) // Добавляем перед текстом кнопки иконку стирания
        buttonZeroCount.setTitle(" Обнуление счетчика", for: .normal) // Добавляем текст кнопки
        buttonZeroCount.tintColor = UIColor.white //Делаем цвет иконки и текста белым для контраста
        buttonZeroCount.backgroundColor = .gray // Делаем цвет кнопки серым
        buttonZeroCount.layer.cornerRadius = 10 //Скругляем углы кнопки для красоты
    }
    
    //Метод, увеличивающий счетчик на 1
    @IBAction func buttonPlusAction(_ sender: Any) {
        myCounter += 1 // Увеличиваем переменную показаний счетика на 1
        let curentDate = Date() // Определяем актуальны дату и времени
        let myFormatedData = actualData(curentDate) // Параметр формата даты
        counterLabel.text = "Значение счетчика: \(String(myCounter))" // Перезаписываем изменившееся значение счетчика после нажатия кнопки
        protocolTextField.text.append("[\(myFormatedData)] Значение изменено на +1\n") // Дополняем протокол действий
    }
    
    //Метод, уменьшающий счетчик на 1
    @IBAction func buttonMinusAction(_ sender: Any) {
        myCounter -= 1 //Уменьшаем переменную показаний счетчика на 1
        let curentDate = Date() // Параметр актуальной даты и времени
        let myFormatedData = actualData(curentDate) //Параметр формата даты
        if myCounter < 0 {
            myCounter = 0 // Обнуляем счетчик при заходе в отрицательные числа
            protocolTextField.text.append("[\(myFormatedData)] Попытка уменьшить значение счётчика ниже 0\n") // Дополняем протокол действий
        } else {
            protocolTextField.text.append("[\(myFormatedData)] Значение изменено на -1\n") // Дополняем протокол действий
        }
        counterLabel.text = "Значение счетчика: \(String(myCounter))" // Перезаписываем изменившееся значение счетчика после нажатия кнопки
    }
    
    //Метод, обнуляющий счетчик
    @IBAction func buttonZeroCountAction(_ sender: Any) {
        myCounter = 0 // Обнуляем переменную показаний счетчика
        let curentDate = Date() // Параметр актуальной даты и времени
        let myFormatedData = actualData(curentDate) //Параметр формата даты
        counterLabel.text = "Значение счетчика: \(String(myCounter))"
        protocolTextField.text.append("[\(myFormatedData)] Значение сброшено\n")
    }
}

