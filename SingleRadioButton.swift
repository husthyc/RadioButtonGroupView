//
//  SingleRadioButton.swift
//  RadioButtonDemo
//
//  Created by Yuchen Huang on 4/5/19.
//  Copyright © 2019 Yuchen Huang. All rights reserved.
//

import UIKit

class SingleRadioButton: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Properties
    var isSelected = false {
        didSet {
            toggleStatus(isSelected: isSelected)
        }
    }
    
    /// UI Components
    let indicatorOn: SimpleCircleView = {
        let indicatorOn = SimpleCircleView()
        indicatorOn.translatesAutoresizingMaskIntoConstraints = false
        indicatorOn.backgroundColor = UIColor.clear
        return indicatorOn
    }()
    
    let indicatorOff: SimpleCircleView = {
        let indicatorOff = SimpleCircleView()
        indicatorOff.translatesAutoresizingMaskIntoConstraints = false
        indicatorOff.fillingColor = UIColor.lightGray
        indicatorOff.circleColor = UIColor.lightGray
        indicatorOff.backgroundColor = UIColor.clear
        return indicatorOff
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate func setUpLayout() {
        addSubview(indicatorOn)
        indicatorOn.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        indicatorOn.topAnchor.constraint(equalTo: topAnchor).isActive = true
        indicatorOn.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        indicatorOn.heightAnchor.constraint(equalTo: indicatorOn.widthAnchor).isActive = true
        
        
        addSubview(indicatorOff)
        indicatorOff.leadingAnchor.constraint(equalTo: indicatorOn.leadingAnchor).isActive = true
        indicatorOff.topAnchor.constraint(equalTo: indicatorOn.topAnchor).isActive = true
        indicatorOff.bottomAnchor.constraint(equalTo: indicatorOn.bottomAnchor).isActive = true
        indicatorOff.trailingAnchor.constraint(equalTo: indicatorOn.trailingAnchor).isActive = true
        
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        indicatorOn.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -4).isActive = true
    }
    
    fileprivate func toggleStatus(isSelected: Bool) {
        if isSelected {
            indicatorOff.isHidden = true
        } else {
            indicatorOff.isHidden = false
        }
    }

}
