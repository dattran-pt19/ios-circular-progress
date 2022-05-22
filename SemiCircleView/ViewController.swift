//
//  ViewController.swift
//  SemiCircleView
//
//  Created by Trần Đạt on 24/04/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var semiCircleView: SemiCircleView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        semiCircleView.setupUI(color: .systemBlue)
        semiCircleView.setProgress(0)
    }
    
    @IBAction func recTap(_ sender: UIButton) {
        let progress = Int.random(in: 0...100)
        progressLabel.text = "\(progress) %"
        semiCircleView.setProgress(Float(progress)/100)
    }
    
}

