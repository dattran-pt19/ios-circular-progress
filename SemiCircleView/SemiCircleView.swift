//
//  SemiCircleView.swift
//  SemiCircleView
//
//  Created by Trần Đạt on 24/04/2022.
//

import UIKit

class SemiCircleView: UIView {
    private var backgroundLayer: CAShapeLayer?
    private var mainLayer: CAShapeLayer?
    
    func setupUI(color: UIColor) {
        // Remove layer trước khi thêm để tránh view chèn vào nhiều layer
        mainLayer?.removeFromSuperlayer()
        backgroundLayer?.removeFromSuperlayer()
        
        // Khởi tạo lại layer
        mainLayer = CAShapeLayer()
        backgroundLayer = CAShapeLayer()
        let center = CGPoint(x: frame.width/2, y: frame.height/2) // center nằm ở giữa view cha
        let circularPath = UIBezierPath(arcCenter: center, // tâm đường tròn
                                        radius: frame.height/2, // bán kính đường tròn
                                        startAngle: CGFloat.pi * 3/4, // điểm vẽ đầu
                                        endAngle: CGFloat.pi * 13/6, // điểm vẽ cuối
                                        clockwise: true) // Vẽ theo chiều kim đồng hồ
        mainLayer?.path = circularPath.cgPath
        backgroundLayer?.path = circularPath.cgPath
        setupSubLayer(backgroundLayer, color: UIColor.separator, progress: 1)
        setupSubLayer(mainLayer, color: color, progress: 0)
    }
    
    private func setupSubLayer(_ shapeLayer: CAShapeLayer?, color: UIColor, progress: CGFloat) {
        shapeLayer?.fillColor = UIColor.clear.cgColor // Màu của layer
        shapeLayer?.strokeEnd = progress // Độ phủ của stroke, tính theo %, max là 1
        shapeLayer?.strokeColor = color.cgColor // Màu của stroke
        shapeLayer?.lineWidth = 12 // Độ rộng stroke
        shapeLayer?.lineCap = .round // Hình dạng 2 đầu stroke (round là bo tròn)
        if let sub = shapeLayer {
            layer.addSublayer(sub)
        }
    }

    func setProgress(_ progress: Float) {
        UIView.animate(withDuration: 0.3) { // Đặt hiệu ứng cho chuyển động bắt mắt hơn
            self.mainLayer?.strokeEnd = CGFloat(progress)
        }
    }
}
