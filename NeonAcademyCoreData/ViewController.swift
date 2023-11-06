//
//  ViewController.swift
//  NeonAcademyCoreData
//
//  Created by Kerem Caan on 18.08.2023.
//

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController {
    
    let nameTF: UITextField = UITextField()
    let surnameTF: UITextField = UITextField()
    let ageTF: UITextField = UITextField()
    let emailTF: UITextField = UITextField()
    let saveButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameTF)
        nameTF.placeholder = "Name"
        nameTF.borderStyle = .line
        nameTF.textAlignment = .center
        nameTF.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        view.addSubview(surnameTF)
        surnameTF.placeholder = "Surname"
        surnameTF.borderStyle = .line
        surnameTF.textAlignment = .center
        surnameTF.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }

        view.addSubview(ageTF)
        ageTF.placeholder = "Age"
        ageTF.borderStyle = .line
        ageTF.textAlignment = .center
        ageTF.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }

        view.addSubview(emailTF)
        emailTF.placeholder = "Email"
        emailTF.borderStyle = .line
        emailTF.textAlignment = .center
        emailTF.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(450)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        view.addSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .blue
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        saveButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(550)
            make.centerX.equalToSuperview()
            make.width.equalTo(75)
        }
        
    }
    
    @objc func buttonTapped() {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Infos", into: context)
        
        saveData.setValue(nameTF.text!, forKey: "name")
        saveData.setValue(surnameTF.text!, forKey: "surname")
        saveData.setValue(emailTF.text!, forKey: "email")
        saveData.setValue(ageTF.text!, forKey: "age")
        
        do {
            try context.save()
            print("succes")
        } catch {
            print("error")
        }
        
        
        
    }


}

