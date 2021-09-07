//
//  ViewController.swift
//  rgb to hex convert
//
//  Created by 楊昕蕾 on 2021/9/5.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rSlider: UISlider!
    
    @IBOutlet weak var gSlider: UISlider!
    
    @IBOutlet weak var bSlider: UISlider!
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet weak var rValue: UILabel!
    
    @IBOutlet weak var gValue: UILabel!
    
    @IBOutlet weak var bValue: UILabel!
    
    @IBOutlet weak var hex: UILabel!
    
    @IBOutlet weak var rLbl: UILabel!

    @IBOutlet weak var gLbl: UILabel!
    
    @IBOutlet weak var bLbl: UILabel!
    
    @IBOutlet weak var random: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorString()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToCopy(_gesture: )))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        hex.addGestureRecognizer(tapGesture)
        hex.isUserInteractionEnabled = true
        
        

    }
    
    
    @objc func tapToCopy(_gesture: UITapGestureRecognizer){
        
        UIPasteboard.general.string = hex.text
        
    }
    
    
    
    func textColor(){
        
        let r = Int(rSlider.value * 255)
        let g = Int(gSlider.value * 255)
        let b = Int(bSlider.value * 255)
        
        if r + g + b >= 340{
            rValue.textColor = UIColor.black
            gValue.textColor = UIColor.black
            bValue.textColor = UIColor.black
            hex.textColor = UIColor.black
            rLbl.textColor = UIColor.black
            gLbl.textColor = UIColor.black
            bLbl.textColor = UIColor.black
            random.setTitleColor(UIColor.black, for: .normal)

        }
        
        else {
            rValue.textColor = UIColor.white
            gValue.textColor = UIColor.white
            bValue.textColor = UIColor.white
            hex.textColor = UIColor.white
            rLbl.textColor = UIColor.white
            gLbl.textColor = UIColor.white
            bLbl.textColor = UIColor.white
            random.setTitleColor(UIColor.white, for: .normal)
            
        }
    }
    
    func colorString(){
        rValue.text = String(Int(rSlider.value * 255))
        gValue.text = String(Int(gSlider.value * 255))
        bValue.text = String(Int(bSlider.value * 255))
                
        hex.text = String(format:"%02X%02X%02X", Int(rSlider.value * 255), Int(gSlider.value * 255), Int(bSlider.value * 255))
        
    }
    
    @IBAction func sliderDidChange(_ sender: Any) {
               
        colorView.backgroundColor = UIColor(red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
        
        colorString()
        textColor()
        
    }
        
        
    
    @IBAction func randomColor(_ sender: Any) {
        rSlider.value = Float.random(in: 0...1)
        gSlider.value = Float.random(in: 0...1)
        bSlider.value = Float.random(in: 0...1)
              
        colorView.backgroundColor = UIColor(red: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
        
        colorString()
        textColor()

        
        
    }
 
    


    
}

