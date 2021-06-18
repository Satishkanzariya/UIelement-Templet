//
//  AddressVC.swift
//  mytemplet
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AddressVC: UIViewController {
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

    private let myLabelG:UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    
    private let mySegmentedControl:UISegmentedControl = {
        let segControl = UISegmentedControl()
        segControl.insertSegment(withTitle: "Male", at: 0, animated: true)
        segControl.insertSegment(withTitle: "Female", at: 1, animated: true)
        segControl.selectedSegmentIndex = 0
        segControl.backgroundColor = .white
        segControl.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        return segControl
    }()
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        datePicker.layer.cornerRadius = 25
        return datePicker
    }()
    
    private let myPickerView = UIPickerView()
    private let pickerData = ["Select Country","india","USA","Austerliya"]
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next ->", for: .normal)
        button.addTarget(self, action: #selector(MoveTodetail), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 35
        return button
        
    }()
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 2
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.35, animated: true)
        return progressView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        view.addSubview(myPageControl)
        view.addSubview(mySegmentedControl)
        view.addSubview(myLabelG)
        view.addSubview(myLabel)
        view.addSubview(myDatePicker)
        view.addSubview(myProgressView)
        view.addSubview(myPickerView)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.backgroundColor = .white
        myPickerView.layer.cornerRadius = 25
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bck1.jpg")!)
        
    }
    @objc func handleDateChange() {
        print(myDatePicker.date)
    }
    @objc func handleSegmentedControl() {
        print(mySegmentedControl.selectedSegmentIndex)
    }
    @objc func MoveTodetail(){
        let vc = MoveToDetail()
        navigationController?.pushViewController(vc, animated: false)
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
    }
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        myTextView.frame = CGRect(x: 40, y: view.height/2, width: view.width-80, height: 60)
        myLabel.frame = CGRect(x: 40, y: 150, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+60, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 40, y: view.height/2+140, width: view.width-80, height: 60)
        mySegmentedControl.frame = CGRect(x: 130, y: view.height/2-160, width: view.width-185, height: 30)
        myLabelG.frame = CGRect(x: 40, y: view.height/2-175, width: view.width-80, height: 60)
        myDatePicker.frame = CGRect(x: 40, y: view.height/2-100, width: view.width-80, height: 60)
        myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
        myPickerView.frame = CGRect(x: 40, y: view.height/2-30, width: view.width-80, height: 60)
    }


}
extension AddressVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
    }
}
