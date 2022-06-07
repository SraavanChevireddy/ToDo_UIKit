//
//  View+Extensions.swift
//  ToDoList-UiKit
//
//  Created by Sraavan Chevireddy on 6/8/22.
//

import UIKit

extension UIView
{
    func setupAutoAnchors(top: NSLayoutYAxisAnchor?,leading: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, withPadding: UIEdgeInsets = .zero, size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top
        {
            topAnchor.constraint(equalTo: top, constant: withPadding.top).isActive = true
        }
        if let left = leading
        {
            leadingAnchor.constraint(equalTo: left, constant: withPadding.left).isActive = true
        }
        if let bottom = bottom
        {
            bottomAnchor.constraint(equalTo: bottom, constant: -withPadding.bottom).isActive = true
        }
        if let right = trailing
        {
            trailingAnchor.constraint(equalTo: right, constant: -withPadding.right).isActive = true
        }
        if size.width != 0
        {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0
        {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    
    
    /// Master view and padding
    func fillWithMasterView(withPadding:UIEdgeInsets = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor{
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: withPadding.top).isActive = true
        }
        if let superviewLeftAnchor = superview?.leftAnchor{
            leftAnchor.constraint(equalTo: superviewLeftAnchor, constant: withPadding.left).isActive = true
        }
        if let superviewBottomAnchor = superview?.bottomAnchor{
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -withPadding.bottom).isActive = true
        }
        if let superviewRightAnchor = superview?.rightAnchor{
            rightAnchor.constraint(equalTo: superviewRightAnchor, constant: -withPadding.right).isActive = true
        }
    }
    
    func createAttributedString2(titleText:String,titleColor:UIColor,titleFont:UIFont,valueText:String,valueText2:String,valColor:UIColor, valFont:UIFont) -> NSAttributedString{
        
        let titleAttributes = [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: titleColor]
        let subtitleAttributes = [NSAttributedString.Key.font: valFont, NSAttributedString.Key.foregroundColor: valColor]
        let subtitleAttributes2 = [NSAttributedString.Key.font: valFont, NSAttributedString.Key.foregroundColor: valColor]

     let titleString = NSMutableAttributedString(string: "\(titleText)\n", attributes: titleAttributes)
     let subtitleString = NSAttributedString(string: "\(valueText)\n", attributes: subtitleAttributes)
     let subtitleString2 = NSAttributedString(string: valueText2, attributes: subtitleAttributes2)
    
     titleString.append(subtitleString)
     titleString.append(subtitleString2)
        return titleString
    }
    
}
