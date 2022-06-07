//
//  AddOrUpdateDelegate.swift
//  ToDoList-UiKit
//
//  Created by Sraavan Chevireddy on 6/8/22.
//

import Foundation

protocol AddOrUpdateDelegate{
    func fetchToDos()
    func deleteToDo(_ entity: ToDoTable)
    func update(_ entity: ToDoTable)
    func create(_ category:String, toDos:String)
}
