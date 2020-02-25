//
//  Setting.swift
//  HWUISlider
//
//  Created by Nikita Moskalenko on 2/5/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
/*
 2 экран - настройки.

 1 label с надписью "Выбрать пол". Напротив него - picker. в пикере 3 варианта: М,Ж, unknown.
 2 textfiled - имя и ник.
 1 slider - нажимая на который, можно менять цвет экрана.
 1 кнопка "Сохранить".
 */

import UIKit

final class Setting: UIViewController {
//  MARK: - Private constant
    private let genderLabel = UILabel()
    private let genderPicker = UIPickerView()
    private let nameTextField = UITextField()
    private let redSlider = UISlider()
    private let greenSlider = UISlider()

//  MARK: - Life cycle
    override func viewDidLoad() {
          super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addGenderLabel()
        addGendegPicker()
        addNameTextField()
      }
    
//  MARK: - Private methods
    private func addGenderLabel() {
        genderLabel.text = "Choice gender:"
        genderLabel.textColor = .black
        genderLabel.frame = CGRect(x: 50, y: 355, width: 150, height: 30)
        view.addSubview(genderLabel)
    }
    
    private func addGendegPicker() {
        view.addSubview(genderPicker)
        genderPicker.frame = CGRect(x: 200, y: 320, width: 100, height: 100)
        genderPicker.delegate = self
    }
    
    private func addNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.frame = CGRect(x: 100, y: 200, width: 200, height: 40)
        nameTextField.placeholder = "Name"
        nameTextField.backgroundColor = .lightGray
        nameTextField.textColor = .gray
        nameTextField.layer.cornerRadius = 6
    }
}

//MARK: - Extensions
extension Setting: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
        }
}

extension Setting: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 1:
            return "M"
        case 2:
            return "F"
        default:
            return "Unknow"
        }
    }
}
