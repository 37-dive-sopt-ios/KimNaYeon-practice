//
//  REDViewController.swift
//  sopt-37th-Seminar-01
//
//  Created by 김나연 on 10/18/25.
//

import UIKit
import SnapKit

class REDViewController: UIViewController {
    
    let viewWidth = UIScreen.main.bounds.width/2
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    private func setLayout() {
        self.view.addSubview(redView)
        
        redView.snp.makeConstraints {
                    $0.top.equalToSuperview().offset(80)
                    $0.leading.equalToSuperview().offset(16)
                    $0.trailing.equalToSuperview().offset(-16)
                    $0.bottom.equalToSuperview().offset(-80)
                }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}
