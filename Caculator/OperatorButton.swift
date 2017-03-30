//
//  OperatorButton.swift
//  Caculator
//
//  Created by Nguyen Cong Toan on 3/29/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit

class OperatorButton: UIButton {

    required init?(coder aDecoder: NSCoder){
    super.init(coder: aDecoder)
        configuraButton()
        
    }

    func configuraButton() -> Void
    {
        if tag == 1 {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        }
        else
        {
            backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 1)
        }
        layer.cornerRadius = 8.0
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.setTitleColor(UIColor.white, for: UIControlState.normal)
    }
}
