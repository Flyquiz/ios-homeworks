//
//  LogInViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 14.03.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "logo.png")
        return imageView
    }()
    
//TODO: Клавиатууры
//    Спрятать при нажатии return
    private lazy var authTextView: UIView = {
        let textView = UIView()
        let usernameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
        let passwordTextField = UITextField(frame: CGRect(x: 0, y: 50, width: 500, height: 50))
        textView.addSubview(usernameTextField)
        textView.addSubview(passwordTextField)
        textView.clipsToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false

        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 10
        usernameTextField.layer.borderColor = UIColor.lightGray.cgColor
        usernameTextField.layer.borderWidth = 0.25
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.25

        usernameTextField.keyboardType = .emailAddress
        usernameTextField.placeholder = "Email of phone"
        usernameTextField.backgroundColor = .systemGray6
        usernameTextField.textColor = .black
        usernameTextField.font = .systemFont(ofSize: 16)
        usernameTextField.tintColor = UIColor(rgb: 0x4885CC)
        usernameTextField.autocapitalizationType = .none
        usernameTextField.setLeftPadding(10)

        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.textColor = .black
        passwordTextField.font = .systemFont(ofSize: 16)
        passwordTextField.tintColor = UIColor(rgb: 0x4885CC)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.setLeftPadding(10)

        return textView
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.clipsToBounds = true
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        checkLoginButtonStates()
        button.layer.cornerRadius = 10
//Васянство
        func checkLoginButtonStates() {
            switch button.state {
            case .normal: button.alpha = 1
            case .selected: button.alpha = 0.8
            case .highlighted: button.alpha = 0.8
            case .disabled: button.alpha = 0.8
            default:
                break
            }
        }
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupLayout()
        view.addTapGestureToHideKeyboard()
    }

    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(logoImage)
        view.addSubview(authTextView)
        view.addSubview(logInButton)

        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),

            authTextView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            authTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authTextView.heightAnchor.constraint(equalToConstant: 100),

            logInButton.topAnchor.constraint(equalTo: authTextView.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.widthAnchor.constraint(equalTo: authTextView.widthAnchor)
        ])
    }
}



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIView {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        addGestureRecognizer(tapGesture)
    }
}

extension UITextField {
    func setLeftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
