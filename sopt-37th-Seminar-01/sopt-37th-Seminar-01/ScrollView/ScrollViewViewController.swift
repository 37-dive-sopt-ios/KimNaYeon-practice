//
//  ScrollViewViewController.swift
//  sopt-37th-Seminar-01
//
//  Created by 김나연 on 10/18/25.
//

import UIKit
import SnapKit

class ScrollViewViewController: UIViewController {
    
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
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            // 이게모게
            $0.height.greaterThanOrEqualToSuperview().priority(.low) // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
            $0.width.equalTo(viewWidth)
            $0.height.equalTo(400)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalTo(contentView)
            $0.width.equalTo(viewWidth)
            $0.height.equalTo(400)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.width.equalTo(viewWidth)
            $0.height.equalTo(400)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalTo(contentView)
            $0.width.equalTo(viewWidth)
            $0.height.equalTo(400)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.width.equalTo(viewWidth)
            $0.height.equalTo(400)
            $0.bottom.equalTo(contentView) // contentView의 마지막 요소로, bottom을 설정합니다.
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.trailing.equalTo(contentView)
            $0.width.equalTo(viewWidth)
            $0.height.equalTo(400)
            $0.bottom.equalTo(contentView)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}
