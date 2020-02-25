//
//  ViewController.swift
//  HWUISlider
//
//  Created by Nikita Moskalenko on 2/5/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.

// MARK: - Home Work tasks
/* Homw work:
 Техническое задание.
 Приложение "Мой профиль".
 3 экрана.

 1 экран -логин.
 2 textfield для ввода емейл и пароля.
 1 кнопка "Войти".

 3 экран - просто label с надписью "Игрок создан".

 Дополнительно:
 Добавьте какие-то свои фишки. Например: почитать в google как сохранять данные так, чтобы при следующем входе они опять
 отображались в профиле.

 Попробуйте сделать плеер, о котором говорились в видео.
 Включаемся, настраиваем фантазию, делаем свои крутые фишки - улетаем к трудоустройству и высокой зарплате!
 Придумайте свои фишки в дополнение. Креатив и ios-разработка - ходят за руку!

 Как всегда:
 1) Делаем,
 2) Выкладываем в комментариях к обсуждению,
 3) Обсуждаем.
 */

import UIKit

class ViewController: UIViewController {
    
//  MARK: - Private constant
    private let loginTextField = UITextField()
    private let loginLabel = UILabel()
    private let passwordTextFiald = UITextField()
    private let passwordLabel = UILabel()
    private let entryButton = UIButton()

//  MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLoginLabel()
        addLoginTextField()
        addPasswordLabel()
        addPasswordTextField()
        addEntryButton()
    }
    
//  MARK: - Private methods
    private func addLoginLabel() {
        loginLabel.text = "Login:"
        loginLabel.textColor = .black
        loginLabel.frame = CGRect(x: 100, y: 360, width: 50, height: 40)
        view.addSubview(loginLabel)
    }
    
    private func addLoginTextField() {
        loginTextField.frame = CGRect(x: 100, y: 400, width: 100, height: 30)
        loginTextField.placeholder = "Enter login"
        view.addSubview(loginTextField)
    }
    
    private func addPasswordLabel() {
        passwordLabel.text = "Pasword:"
        passwordLabel.textColor = .black
        passwordLabel.frame = CGRect(x: 100, y: 440, width: 70, height: 40)
        view.addSubview(passwordLabel)
    }
    
    private func addPasswordTextField() {
        passwordTextFiald.frame = CGRect(x: 100, y: 480, width: 100, height: 30)
        passwordTextFiald.placeholder = "Enter password"
        passwordTextFiald.isSecureTextEntry = true
        view.addSubview(passwordTextFiald)
    }
    
    private func addEntryButton() {
        view.addSubview(entryButton)
        entryButton.frame = CGRect(x: 130, y: 550, width: 150, height: 50)
        entryButton.setTitle("Entry", for: .normal)
        entryButton.tintColor = .blue
        entryButton.backgroundColor = .black
        entryButton.addTarget(self, action: #selector(toNextViewController), for: .touchUpInside)
    }
    
//  crated alert controllers
    private func createdAlertControllers(titleAction: String, titleAC: String, message: String, styleAction: UIAlertAction.Style ,styleAC: UIAlertController.Style) {
        let newAlerController = UIAlertController(title: titleAC, message: message, preferredStyle: styleAC)
        let newAlertAction = UIAlertAction(title: titleAction, style: styleAction, handler: nil)
        
        newAlerController.addAction(newAlertAction)
        present(newAlerController, animated: true)
    }
    
//  add transition to Setting View Controller
    @objc private func toNextViewController() {
        let settingVC = Setting()
        
        if let loginTextCount = loginTextField.text?.count, let passwordTextFieldCount = passwordTextFiald.text?.count {
            if loginTextCount == 0 || passwordTextFieldCount == 0 {
                createdAlertControllers(titleAction: "Ok", titleAC: "Wraning", message: "Your password or login isn't correctly", styleAction: .cancel, styleAC: .actionSheet)
            } else {
                present(settingVC, animated: true)
            }
        }
        
    }


}
