//
//  paperDollViewController.swift
//  paperDoll
//
//  Created by Serena 2020/12/8.
//

import UIKit

class paperDollViewController: UIViewController {

  
    
    @IBOutlet weak var headView: UIImageView!
    @IBOutlet weak var faceView: UIImageView!
    @IBOutlet weak var glassesView: UIImageView!
    @IBOutlet weak var poseView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    
    @IBOutlet weak var headBtnView: UIView!
    @IBOutlet weak var faceBtnView: UIView!
    @IBOutlet weak var glassesBtnView: UIView!
    @IBOutlet weak var poseBtnView: UIView!
    @IBOutlet weak var bgcolorBtnView: UIView!
    
    //Buttons on bgcolorBtnView
    @IBOutlet weak var color1Preview: UIImageView!
    @IBOutlet weak var color1RSlider: UISlider!
    @IBOutlet weak var color1GSlider: UISlider!
    @IBOutlet weak var color1BSlider: UISlider!
    @IBOutlet weak var color2Preview: UIImageView!
    @IBOutlet weak var color2RSlider: UISlider!
    @IBOutlet weak var color2GSlider: UISlider!
    @IBOutlet weak var color2BSlider: UISlider!
    
    var color1 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var color2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var randomColor1 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var randomColor2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headBtnView.isHidden = false
        faceBtnView.isHidden = true
        glassesBtnView.isHidden = true
        poseBtnView.isHidden = true
        bgcolorBtnView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func headBtns(_ sender: UIButton) {
        let image = sender.currentImage
        headView.image = image
    }
    
    @IBAction func faceBtns(_ sender: UIButton) {
        let image = sender.currentImage
        faceView.image = image
    }
    
    @IBAction func glassesBtns(_ sender: UIButton) {
        if sender.tag == 0 {
            glassesView.image = nil
        } else {
            let image = sender.currentImage
            glassesView.image = image
        }
    }
    
    @IBAction func poseBtns(_ sender: UIButton) {
        let image = sender.currentImage
        poseView.image = image
    }
    
    //Buttons on scrollView
    @IBAction func changeViewsBtn(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            headBtnView.isHidden = false
            faceBtnView.isHidden = true
            glassesBtnView.isHidden = true
            poseBtnView.isHidden = true
            bgcolorBtnView.isHidden = true
        case 1:
            headBtnView.isHidden = true
            faceBtnView.isHidden = false
            glassesBtnView.isHidden = true
            poseBtnView.isHidden = true
            bgcolorBtnView.isHidden = true
        case 2:
            headBtnView.isHidden = true
            faceBtnView.isHidden = true
            glassesBtnView.isHidden = false
            poseBtnView.isHidden = true
            bgcolorBtnView.isHidden = true
        case 3:
            headBtnView.isHidden = true
            faceBtnView.isHidden = true
            glassesBtnView.isHidden = true
            poseBtnView.isHidden = false
            bgcolorBtnView.isHidden = true
        case 4:
            headBtnView.isHidden = true
            faceBtnView.isHidden = true
            glassesBtnView.isHidden = true
            poseBtnView.isHidden = true
            bgcolorBtnView.isHidden = false
        default:
            break
        }
    }
    

    
    @IBAction func changeColor(_ sender: Any) {
        color1 = UIColor(red: CGFloat(color1RSlider.value), green: CGFloat(color1GSlider.value), blue: CGFloat(color1BSlider.value), alpha: 1)
        color2 = UIColor(red: CGFloat(color2RSlider.value), green: CGFloat(color2GSlider.value), blue: CGFloat(color2BSlider.value), alpha: 1)
        color1Preview.backgroundColor = color1
        color2Preview.backgroundColor = color2
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.backgroundColorView.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
                
        //斜角漸層
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            
        self.backgroundColorView.layer.addSublayer(gradientLayer)
    }
            
    @IBAction func randomColorBtn(_ sender: Any) {
        let red1 = Double.random(in: 1...255) / 255
        let green1 = Double.random(in: 1...255) / 255
        let blue1 = Double.random(in: 1...255) / 255
        let red2 = Double.random(in: 1...255) / 255
        let green2 = Double.random(in: 1...255) / 255
        let blue2 = Double.random(in: 1...255) / 255
        
        randomColor1 = UIColor(red: CGFloat(red1), green: CGFloat(green1), blue: CGFloat(blue1), alpha: 1)
        randomColor2 = UIColor(red: CGFloat(red2), green: CGFloat(green2), blue: CGFloat(blue2), alpha: 1)
        
        color1Preview.backgroundColor = randomColor1
        color2Preview.backgroundColor = randomColor2
        
        color1RSlider.setValue(Float(red1), animated: true)
        color1GSlider.setValue(Float(green1), animated: true)
        color1BSlider.setValue(Float(blue1), animated: true)
        color2RSlider.setValue(Float(red2), animated: true)
        color2GSlider.setValue(Float(green2), animated: true)
        color2BSlider.setValue(Float(blue2), animated: true)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.backgroundColorView.bounds
        gradientLayer.colors = [randomColor1.cgColor, randomColor2.cgColor]
                
        //斜角漸層
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            
        self.backgroundColorView.layer.addSublayer(gradientLayer)
    }
    
    
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
