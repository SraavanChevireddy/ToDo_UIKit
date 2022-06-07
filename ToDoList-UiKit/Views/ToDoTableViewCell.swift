//
//  ToDoTableViewCell.swift
//  ToDoList-UiKit
//
//  Created by Sraavan Chevireddy on 6/8/22.
//

import Foundation
import UIKit

class ToDoTableViewCell: UITableViewCell{
    
    var toDoItem: ToDoTable?{
        didSet{
            if let toDoItem = toDoItem {
                lbl_category.text = toDoItem.toDo
                lbl_toDo.text = toDoItem.category
            }
        }
    }
    
    // UI Components
    private var capsuleView : UIView!
    private var baseView : UIView!
    
    // Widget Components
    private var lbl_category : UILabel!
    private var lbl_toDo : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadUIComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Jai Baalayya")
    }
    
    private func loadUIComponents(){
        backgroundColor = .clear
        selectionStyle = .none
        baseView = {
            let modalView = UIView()
            modalView.backgroundColor = UIColor.white
            modalView.layer.cornerRadius = 10
            modalView.clipsToBounds = true
            return modalView
        }()
        contentView.addSubview(baseView)
        baseView.fillWithMasterView(withPadding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        capsuleView = {
            let modalView = UIView()
            modalView.layer.cornerRadius = 5
            modalView.clipsToBounds = true
            modalView.backgroundColor = UIColor.orange
            modalView.accessibilityTraits = .image
            return modalView
        }()
        
        lbl_category = {
            let modalView = UILabel()
            modalView.lineBreakMode = .byWordWrapping
            modalView.numberOfLines = 0
            return modalView
        }()
        
        lbl_toDo = {
            let modalView = UILabel()
            modalView.numberOfLines = 0
            modalView.lineBreakMode = .byWordWrapping
            return modalView
        }()
        
        // Add to Superview
     [capsuleView,lbl_category,lbl_toDo].forEach({baseView.addSubview($0)})

         // Setup the constriants
        capsuleView.setupAutoAnchors(top: baseView.topAnchor, leading: baseView.leadingAnchor, bottom: nil, trailing: nil, withPadding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 10, height: 50))
                 
        lbl_category.setupAutoAnchors(top: nil, leading: capsuleView.trailingAnchor, bottom: nil, trailing: baseView.trailingAnchor, withPadding: .init(top: 10, left: 3, bottom: 0, right: 3), size: .zero)
        lbl_category.centerYAnchor.constraint(equalTo: capsuleView.centerYAnchor).isActive = true
         
        lbl_toDo.setupAutoAnchors(top: capsuleView.bottomAnchor, leading: baseView.leadingAnchor, bottom: baseView.bottomAnchor, trailing: baseView.trailingAnchor, withPadding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .zero)
        
    }

}
