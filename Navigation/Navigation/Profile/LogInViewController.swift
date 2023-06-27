//
//  LogInViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 14.03.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "logo.png")
        return imageView
    }()
    
//    MARK: TextFields
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email of phone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(rgb: 0x4885CC)
        textField.autocapitalizationType = .none
        textField.setLeftPadding(10)
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(rgb: 0x4885CC)
        textField.autocapitalizationType = .none
        textField.setLeftPadding(10)
        textField.delegate = self
        return textField
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.25
        return view
    }()
    
    private lazy var authStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        return stackView
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
        button.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        
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
    
//    private let errorRedView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemRed
//        view.alpha = 0.0
//        return view
//    }()
    
//    private var errorViewTopAnchor = NSLayoutConstraint()
//    private var errorViewLeadingAnchor = NSLayoutConstraint()
//    private var errorViewTrailingAnchor = NSLayoutConstraint()
//    private var errorViewBottomAnchor = NSLayoutConstraint()
    
    private lazy var errorPasswordLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.0
        label.text = "Пароль должен содержать не менее 6-ти символов"
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

//    MARK: LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupLayout()
        view.addTapGestureToHideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        notification.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        notification.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: Notification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + errorPasswordLabel.bounds.height
        }
    }

    @objc private func keyboardHide(){
        scrollView.contentInset.bottom = .zero
    }
    
    @objc private func logInButtonAction() {
        for (i, tf) in [usernameTextField, passwordTextField].enumerated() {
            if checkIsEmptyTF(textField: tf) {
                if checkCharacterInTF(index: i, textField: tf) {
                    
                }
            }
        }
    }
    
    //                navigationController?.pushViewController(ProfileViewController(), animated: true)
    
    private func checkIsEmptyTF(textField: UITextField) -> Bool {
        if textField.text == "" {
            let errorView = UIView()
            authStackView.addSubview(errorView)
            errorView.frame = textField.frame
            errorView.center = textField.center
            errorView.backgroundColor = .systemRed
            
            UIView.animate(withDuration: 0.5) {
                errorView.alpha = 0.0
            } completion: { _ in
                errorView.removeFromSuperview()
            }
            
            return false
        } else {
            return true
        }
    }
    
    private func checkCharacterInTF(index: Int, textField: UITextField) -> Bool {
        guard index == 0 else {
            if textField.text!.count <= 6 {
                let errorLabel = UILabel()
                errorLabel.translatesAutoresizingMaskIntoConstraints = false
                
                return false
            } else {
                return true
            }
        }
        return true
    }
    
//    MARK: Layout
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoImage)
        contentView.addSubview(authStackView)
        contentView.addSubview(logInButton)
        contentView.addSubview(errorPasswordLabel)
        
        authStackView.addArrangedSubview(usernameTextField)
        authStackView.addArrangedSubview(separatorView)
        authStackView.addArrangedSubview(passwordTextField)
        
//        authStackView.addSubview(errorRedView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            
            authStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            authStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authStackView.heightAnchor.constraint(equalToConstant: 100),
            
            usernameTextField.heightAnchor.constraint(equalToConstant: 49.75),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            passwordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor),
            
            errorPasswordLabel.topAnchor.constraint(equalTo: authStackView.bottomAnchor, constant: 10),
            errorPasswordLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            logInButton.topAnchor.constraint(equalTo: errorPasswordLabel.bottomAnchor, constant: 10),
            logInButton.centerXAnchor.constraint(equalTo: authStackView.centerXAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.widthAnchor.constraint(equalTo: authStackView.widthAnchor),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
//            errorViewTopAnchor, errorViewLeadingAnchor, errorViewTrailingAnchor, errorViewBottomAnchor
        ])
    }
}



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
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

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
