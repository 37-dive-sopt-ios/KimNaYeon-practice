//
//  WelcomeViewController.swift
//  sopt-37th-Seminar-01
//
//  Created by 김나연 on 10/16/25.
//

import UIKit

protocol WelcomeReloginDelegate: AnyObject {
    func retryLogin(_ viewController: UIViewController, didTapReloginWith message: String)
}

final class WelcomeViewController_Delegate: UIViewController {
        
    
    // MARK: - UI Components
    
    weak var delegate: WelcomeReloginDelegate?

    var name : String? = ""
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = .rabbitFace
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = .head1
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = .subhead1
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = .grey200
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = .subhead1
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        bindName()
    }
    
    
    // MARK: - UI & Layout
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    
    // MARK: - Function
    
    private func bindName() {
        guard let nameText = name else {return}
        self.welcomeLabel.text = "\(nameText)님 \n반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        delegate?.retryLogin(self, didTapReloginWith: "다시 로그인 버튼을 눌렀어요!")
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
