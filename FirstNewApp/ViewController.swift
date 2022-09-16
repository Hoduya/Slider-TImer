//
//  ViewController.swift
//  FirstNewApp
//
//  Created by HoJun on 2022/09/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        number = 30
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(sender.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        mainLabel.text = "\(number) 초"
        
        timer?.invalidate() // 기존 타이머 제거

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
    }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number) 초"
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        slider.setValue(0.5, animated: true)
        number = 30
        mainLabel.text = "초를 선택하세요"
        timer?.invalidate()
    }
}

