//
//  RadioButton.swift
//  RadioButtonDemo
//
//  Created by Yuchen Huang on 4/5/19.
//  Copyright © 2019 Yuchen Huang. All rights reserved.
//

import UIKit

class RadioButtonGroupView: UIView {
    
    init(frame: CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame: frame)
        setUpButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// properties
    var titles: [String] = [] {
        didSet {
            setUpButtons()
        }
    }
    
    var selectedIndex: Int? {
        for i in 0...buttons.count - 1 {
            if buttons[i].isSelected {
                return i
            }
        }
        return nil
    }
    
    var action: ((SingleRadioButton) -> Void)?
    
    var innerRadius: CGFloat = 5.0 {
        didSet {
            buttons.forEach { (button) in
                button.indicatorOn.innerRadius = self.innerRadius
            }
        }
    }
    
    var fillingColor = UIColor.white {
        didSet {
            buttons.forEach { (button) in
                button.indicatorOn.fillingColor = self.fillingColor
            }
        }
    }
    
    var circleColor = UIColor.black {
        didSet {
            buttons.forEach { (button) in
                button.indicatorOn.circleColor = self.circleColor
            }
        }
    }
    
    var unselectedColor = UIColor.gray {
        didSet {
            buttons.forEach { (button) in
                button.indicatorOff.circleColor = self.unselectedColor
                button.indicatorOff.fillingColor = self.unselectedColor
            }
        }
    }
    
    /// UI Components
    fileprivate var buttons: [SingleRadioButton] = []
    
    fileprivate func generateButtons() {
        var srButtons: [SingleRadioButton] = []
        for title in titles {
            let button = SingleRadioButton()
            button.label.text = title
            button.indicatorOn.fillingColor = fillingColor
            button.indicatorOn.circleColor = circleColor
            button.indicatorOff.fillingColor = unselectedColor
            button.indicatorOff.circleColor = unselectedColor
            srButtons.append(button)
            
            let singleTapGR = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(sender:)))
            button.addGestureRecognizer(singleTapGR)
        }
        buttons = srButtons
    }
    
    func selectItemAtIndex(index: Int?) {
        for i in 0...buttons.count - 1 {
            if let index = index, i == index {
                buttons[i].isSelected = true
            } else {
                buttons[i].isSelected = false
            }
        }
    }
    
    func deselectAllItems() {
        selectItemAtIndex(index: nil)
    }
    
    fileprivate func setUpLayout() {
        let bgStackView = UIStackView(arrangedSubviews: buttons)
        bgStackView.translatesAutoresizingMaskIntoConstraints = false
        bgStackView.axis = .horizontal
        bgStackView.distribution = .equalSpacing
        
        addSubview(bgStackView)
        bgStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bgStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    fileprivate func setUpButtons() {
        generateButtons()
        setUpLayout()
    }
    
    @objc func handleSingleTap(sender: UITapGestureRecognizer) {
        guard let button = sender.view as? SingleRadioButton else { return }
        for itor in buttons {
            if itor === button {
                itor.isSelected = true
            } else {
                itor.isSelected = false
            }
        }
        if let action = action {
            action(button)
        }
    }
}
