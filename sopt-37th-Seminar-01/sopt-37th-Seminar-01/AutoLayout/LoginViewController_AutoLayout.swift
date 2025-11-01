//
//  LoginViewController.swift
//  sopt-37th-Seminar-01
//
//  Created by 김나연 on 10/16/25.
//

import UIKit
import SnapKit

final class LoginViewController_AutoLayout: UIViewController {
    
    
    // MARK: - UI Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.font = .subhead1
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.backgroundColor = .grey200
        textField.textColor = .grey400
        textField.layer.cornerRadius = 3
        textField.font = .subhead4
        textField.addLeftPadding()
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.isSecureTextEntry = true
        textField.backgroundColor = .grey200
        textField.textColor = .grey400
        textField.layer.cornerRadius = 3
        textField.font = .subhead4
        textField.clearButtonMode = .whileEditing
        textField.addLeftPadding()
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .primaryOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = .subhead1
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        indicator.color = .primaryOrange
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
    }
    
    
    // MARK: - UI & Layout
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton, loadingIndicator].forEach{
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(163)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(57)
        }
    }
    
    
    // MARK: - Function
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
    }
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.name = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        loadingIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.loadingIndicator.stopAnimating()
            self.pushToWelcomeVC()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
