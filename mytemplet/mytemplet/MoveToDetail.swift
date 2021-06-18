//
//  MoveToDetail.swift
//  mytemplet
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class MoveToDetail: UIViewController {
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
   
    private let myStepper:UIStepper = {
        let stepper = UIStepper()
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.backgroundColor = .white
        
        stepper.addTarget(self, action: #selector(handleStepper), for: .valueChanged)
        return stepper
    }()
    private let myLabelStepper:UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let myLabelSlider:UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let myLabelExp:UILabel = {
        let label = UILabel()
        label.text = "Experince"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let myLabelLvl:UILabel = {
        let label = UILabel()
        label.text = "English Level"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let mySlider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        return slider
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next ->", for: .normal)
        button.addTarget(self, action: #selector(MoveToPro), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 35
        return button
        
    }()
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 3
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.65, animated: true)
        return progressView
    }()
    @objc func MoveToPro(){
        let vc = MoveToProfile()
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
    }
    @objc func handleStepper(){
        print(myStepper.value)
        myLabelStepper.text = myStepper.value.description
    }
    @objc func handleSlider() {
        print(mySlider.value)
        if(mySlider.value == 0.0 || mySlider.value >= 1.0)
        {
            myLabelSlider.text = "R"
        }
        if(mySlider.value == 1.0 || mySlider.value >= 2.0)
        {
            myLabelSlider.text = "R-W"
        }
        if(mySlider.value == 2.0 || mySlider.value >= 3.0)
        {
            myLabelSlider.text = "R-W-S"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
        view.addSubview(myStepper)
        view.addSubview(myButton)
        view.addSubview(myLabelStepper)
        view.addSubview(myProgressView)
        view.addSubview(mySlider)
        view.addSubview(myLabelExp)
        view.addSubview(myLabelSlider)
        view.addSubview(myLabelLvl)
        view.addSubview(myPageControl)
     self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bck1.jpg")!)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabel.frame = CGRect(x: 40, y: 150, width: view.width-80, height: 60)
        myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+60, width: view.width-80, height: 60)
        myLabelExp.frame = CGRect(x: 40, y: view.height/2-175, width: view.width-80, height: 60)
        myStepper.frame = CGRect(x: 150, y: view.height/2-160, width: view.width-80, height: 60)
        myLabelStepper.frame = CGRect(x: 300, y: view.height/2-175, width: view.width-80, height: 60)
        mySlider.frame = CGRect(x: 100, y: view.height/2-70, width: view.width-150, height: 40)
        myLabelSlider.frame = CGRect(x: 40, y: view.height/2-80, width: view.width-80, height: 60)
        myLabelLvl.frame = CGRect(x: 40, y: view.height/2-120, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 40, y: view.height/2+140, width: view.width-80, height: 60)
    }

}
