//
//  AddOrUpdateView.swift
//  ToDoList-UiKit
//
//  Created by Sraavan Chevireddy on 6/8/22.
//

import Foundation
import UIKit

class AddOrUpdateView: UIViewController{
    
    private var lbl_toDo: UILabel!
    
    var delegate: AddOrUpdateDelegate!
    
    
    convenience init(_ delegate: AddOrUpdateDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUIComponents()
    }
    
    private func loadUIComponents(){
        view.backgroundColor = UIColor.systemGray
        lbl_toDo = {
            let modalView = UILabel()
            modalView.numberOfLines = 0
              return modalView
        }()
        
        navigationItem.title = "Add ToDo"
        let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addToDo))
        navigationItem.setRightBarButton(barButton, animated: true)
    }
    
    @objc
    private func addToDo(){
        delegate.create("Personal", toDos: "Go To Bed")
        self.dismiss(animated: true, completion: nil)
    }
    
}
