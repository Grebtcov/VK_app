//
//  ViewController.swift
//  VK_app
//
//  Created by Alex x on 3/3/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: UI Elemnts
    let loginSubView = UIView()
    let imageLogo = UIImageView()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let buttonLogin = UIButton(type: .system)
    
        
    // MARK: Constant constraints
    // TODO: Как сделать красивее?
    lazy var widthLogoImageForLandscape = imageLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3)
    lazy var heightLogoImageForLandscape = imageLogo.heightAnchor.constraint(equalTo:view.widthAnchor, multiplier: 1/3)
    lazy var widthLogoImageForPortrait = imageLogo.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5)
    lazy var heightLogoImageForPortrait = imageLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5)
    
    var calculatedHeightLift: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        setupUIElements()
        
        setupNotificationCenter()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeObserverNotificationCenter()
    }
    
    override func viewWillLayoutSubviews() {
        setupWidthImageLogo()
    }
}

// MARK: Setup
extension LoginViewController {
    
    func setupMainView() {
        
        view.addSubview(imageLogo)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(buttonLogin)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    func setupUIElements() {
        
        setupImageLogo()
        setupLoginTextField()
        setupPasswordTextField()
        setupButtonLogin()
    }
    
    func setupImageLogo() {
        
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
        imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setupWidthImageLogo()
        
        imageLogo.image = UIImage(named: "VK_Compact_Logo")
    }
    
    func setupWidthImageLogo() {
        
        if view.bounds.width < view.bounds.height {
            
            widthLogoImageForPortrait.isActive = false
            heightLogoImageForPortrait.isActive = false
            widthLogoImageForLandscape.isActive = true
            heightLogoImageForLandscape.isActive = true
        } else {
            
            widthLogoImageForLandscape.isActive = false
            heightLogoImageForLandscape.isActive = false
            widthLogoImageForPortrait.isActive = true
            heightLogoImageForPortrait.isActive = true
        }
    }
    
    func setupLoginTextField() {
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 31).isActive = true
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 25).isActive = true
        
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "Введите логин"
        loginTextField.textAlignment = .center
        loginTextField.clearButtonMode = .whileEditing
        
        loginTextField.delegate = self
    }
    
    func setupPasswordTextField() {
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 31).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 25).isActive = true
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.textAlignment = .center
        passwordTextField.clearButtonMode = .whileEditing
        
        passwordTextField.delegate = self
    }
    
    func setupButtonLogin() {
        
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.widthAnchor.constraint(equalToConstant: 250).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 31).isActive = true
        buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        
        buttonLogin.backgroundColor = .systemBlue
        buttonLogin.setTitle("Войти", for: .normal)
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.setTitleColor(.systemBlue, for: .highlighted)
        
        
        buttonLogin.addTarget(self, action: #selector(onClickLoginButton), for: .touchUpInside)
    }
    
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            
        //Решил реализовать другим способом
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { notification in
                self.view.frame.origin.y = 0
            }
    }
    
    func removeObserverNotificationCenter() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}


// MARK: Delegate TextField
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        calculatedHeightLift = textField.frame.maxY
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTextField {
            loginTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}

// MARK: Action
extension LoginViewController {
    
    @objc func onClickLoginButton() {
        
        var title = String()
        var message = String()
        
        if loginTextField.text == "", passwordTextField.text == "" {
            
            // TODO: убрать в Root Navigation и через него контролировать жизненный цикл классов
            let newsTableViewController = NewsTableViewController()
            let friendsTableViewController = FriendsTableViewController(style: .plain)
            let groupsTableViewController = GroupsTableViewController()
            
            
            let friendsNavigationController = UINavigationController(rootViewController: friendsTableViewController)
            let groupsNavigationController = UINavigationController(rootViewController: groupsTableViewController)
            
            let mainTabBarController = UITabBarController()
            mainTabBarController.setViewControllers([friendsNavigationController, newsTableViewController, groupsNavigationController ], animated: true)
            
            mainTabBarController.modalPresentationStyle = .overCurrentContext
            mainTabBarController.selectedIndex = 1
            friendsTableViewController.loadViewIfNeeded()
            groupsTableViewController.loadViewIfNeeded()
            
            present(mainTabBarController, animated: true, completion: nil)
            
        } else {
            title = "Ошибка!"
            message = "Вы ввели не правильный логин и/или пароль"
            let successAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            successAlertController.addAction(okAlertAction)
            
            present(successAlertController, animated: true, completion: nil)
        }
        
        
       
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
       
        if let valueHeight = (notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? NSValue)?.cgRectValue.size {
            //Для альбомной ориентации
            if view.frame.width > view.frame.height {
                //если клавиатура закроет элемент
                if calculatedHeightLift + 30 > valueHeight.height {
                    view.frame.origin.y = valueHeight.height - (self.calculatedHeightLift + 35)
                }
            } else {
                if calculatedHeightLift < valueHeight.height + 30 {
                    view.frame.origin.y = self.calculatedHeightLift - (valueHeight.height + 35)
                }
            }
            print(valueHeight.height)
            print(self.calculatedHeightLift)
        }
    }
    
    @objc func hideKeyboard() {
            self.view.endEditing(true)
        }
}

