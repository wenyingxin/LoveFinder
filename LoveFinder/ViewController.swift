//
//  ViewController.swift
//  LoveFinder
//
//  Created by roshan on 15/5/6.
//  Copyright (c) 2015年 LHLL LJU55+66+66666666+66669989999966+666696969666996. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthDay: UIDatePicker!
    
    
    @IBOutlet weak var heightNo: UISlider!
    
    
    @IBOutlet weak var heightShow: UILabel!
    
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    
    @IBOutlet weak var resultShow: UITextView!
    
    
    @IBAction func heightChanged(sender: AnyObject) {
        
         var slider = sender as! UISlider
         var i = Int(slider.value)
         heightShow.text = "\(i)厘米"
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅":"白富美";
        
        let gregorian = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
        let now = NSDate()
        
        let conponments = gregorian!.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthDay.date, toDate: now, options: NSCalendarOptions(0))
        let age=conponments.year
        
        let hasPropertyText = hasProperty.on ? "有房":"无房"
        
        let height = heightShow.text!
        
        resultShow.text="\(userName.text),\(height),\(genderText),\(age)岁,\(hasPropertyText),求交往"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        return true
        
    }


}

