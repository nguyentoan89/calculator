//
//  GradientView.swift
//  Caculator
//
//  Created by Nguyen Cong Toan on 3/29/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit

class GradientView: UIView {

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if tag == 110
        {
            backgroundColor = UIColor.init(red: 49/255, green: 58/255, blue: 75/255, alpha: 1)
        }
        else
        {
            creatGradient()
        }
    }
    func creatGradient() -> Void
    {
        let bgGradient = CAGradientLayer()
        bgGradient.frame = self.frame
        bgGradient.colors = [UIColor.init(red: 57/255, green: 120/255, blue: 127/255, alpha: 1).cgColor, UIColor.init(red: 77/255, green: 188/255, blue: 201/255, alpha: 1).cgColor]
        
        let StartPoint = CGPoint.init(x: 0, y: 0)
        let EndPoint = CGPoint.init(x: 0.5, y: 0.8)
        bgGradient.startPoint = StartPoint
        bgGradient.endPoint = EndPoint
        
        self.layer.insertSublayer(bgGradient, at: 0)
    }

}
