//
//  ViewController.swift
//  forDrawApple
//
//  Created by 羅承志 on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shapeSegmented: UISegmentedControl!
    @IBOutlet weak var fruitSegmented: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
        
    var content = ""
    var number = 2
    let images = ["🍎", "🍊", "🍒"]
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...number {
            for _ in 1...number {
                content += images[imageIndex]
            }
            content += "\n"
        }
        resultLabel.text = "\(number)"
        sliderValueLabel.text = "\(number)"
    }
    //正方形
    func square() {
        for _ in 1...number {
            for _ in 1...number {
                content += images[imageIndex]
            }
            content += "\n"
        }
        resultLabel.text = content
    }
    //三角形
    func triangle() {
        for i in 1...number {
            for _ in 1...i {
                content += images[imageIndex]
            }
            content += "\n"
        }
        resultLabel.text = content
    }
    //金字塔
    func pyramid() {
        for i in (1...number).reversed() {
            for _ in stride(from: i, to: 1, by: -1) {
                content += "🥑"
            }
            for _ in 1...2 * number + 1 - 2 * i  {
                content += images[imageIndex]
            }
            content += "\n"
        }
        resultLabel.text = content
    }
    //菱形
    func diamond() {
        for i in (1...number).reversed() {
            for _ in stride(from: i, to: 1, by: -1) {
                content += "🥑"
            }
            for _ in 1...2 * number + 1 - 2 * i  {
                content += images[imageIndex]
            }
            content += "\n"
        }
        for i in 1...number - 1 {
            for _ in 1...i {
                content += "🥑"
            }
            for _ in 1...2 * number - 1 - 2 * i {
                content += images[imageIndex]
            }
            content += "\n"
        }
        resultLabel.text = content
    }
    
    @IBAction func changeFruit(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            imageIndex = 0
        case 1:
            imageIndex = 1
        case 2:
            imageIndex = 2
        default:
            break
        }
        
        switch shapeSegmented.selectedSegmentIndex {
        case 0:
            content = ""
            square()
        case 1:
            content = ""
            triangle()
        case 2:
            content = ""
            pyramid()
        case 3:
            content = ""
            diamond()
        default:
            break
        }
    }
    
    @IBAction func changeShape(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            content = ""
            square()
        case 1:
            content = ""
            triangle()
        case 2:
            content = ""
            pyramid()
        case 3:
            content = ""
            diamond()
        default:
            break
        }
    }
    
    @IBAction func changeNumber(_ sender: UISlider) {
        sender.value = sender.value.rounded() //使slider拉到整數位置
        number = Int(sender.value)
        sliderValueLabel.text = "\(number)"
        
        switch shapeSegmented.selectedSegmentIndex {
        case 0:
            content = ""
            square()
        case 1:
            content = ""
            triangle()
        case 2:
            content = ""
            pyramid()
        case 3:
            content = ""
            diamond()
        default:
            break
        }
    }
}

