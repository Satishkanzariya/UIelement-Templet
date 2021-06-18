//
//  ViewController.swift
//  mytemplet
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next ->", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(MoveToAddress), for: .touchUpInside)
        return button
    }()
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:40)
        //        label.font = UIFont(name: "Comic Sans MS", size : 110.00)
        return label
    }()
    private let myTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Enter Your Address"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 25
        textView.textColor = .black
        textView.font = .systemFont(ofSize:20)
        return textView
    }()
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 1
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.0, animated: true)
        return progressView
    }()
    private let myTextFieldFname:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter First Name"
        textField.textAlignment = .center
        //        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 25
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = .systemFont(ofSize:20)
        return textField
    }()
    private let myTextFieldLname:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Second Name"
        textField.textAlignment = .center
        //        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 25
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = .systemFont(ofSize:20)
        return textField
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        view.addSubview(myTextFieldFname)
        view.addSubview(myTextFieldLname)
        view.addSubview(myTextView)
        view.addSubview(myLabel)
        view.addSubview(myPageControl)
        view.addSubview(myProgressView)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bck1.jpg")!)
        // Do any additional setup after loading the view.
    }
    @objc private func MoveToAddress() {
        print("next page->address")
        let vc = AddressVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
        //        let vc = AddressVC()
        //        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTextFieldFname.frame = CGRect(x: 40, y: view.height/2-160, width: view.width-80, height: 60)
        myTextFieldLname.frame = CGRect(x: 40, y: view.height/2-80, width: view.width-80, height: 60)
        myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
        myTextView.frame = CGRect(x: 40, y: view.height/2, width: view.width-80, height: 80)
        myButton.frame = CGRect(x: 40, y: view.height/2+100, width: view.width-80, height: 60)
        myLabel.frame = CGRect(x: 40, y: 150, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
    }


}

