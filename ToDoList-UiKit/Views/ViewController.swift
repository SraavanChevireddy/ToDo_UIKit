//
//  ViewController.swift
//  ToDoList-UiKit
//
//  Created by Sraavan Chevireddy on 6/8/22.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    private let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    private var ary_toDos: [ToDoTable]!{
        didSet{
            DispatchQueue.main.async { [weak self] in
                if let self = self{
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUIComponents()
        fetchToDos()
    }
    
    private func loadUIComponents(){
        let add_right_barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showToDoView))
        navigationItem.title = "ToDo"
        navigationItem.setRightBarButton(add_right_barButton, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        // tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    @objc
    private func showToDoView(){
        DispatchQueue.main.async { [weak self] in
            if let self = self{
                let vc_addOrUpdate = AddOrUpdateView(self)
                self.present(UINavigationController(rootViewController: vc_addOrUpdate), animated: true, completion: nil)
            }
        }
    }

}


extension ViewController: AddOrUpdateDelegate{
    func fetchToDos() {
        var fetchErr: Error? = nil
        
        let toDosReq: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoTable")
        let sorter: NSSortDescriptor = NSSortDescriptor(key: "createdTime" , ascending: false)
        toDosReq.sortDescriptors = [sorter]
        toDosReq.returnsObjectsAsFaults = false
        do{
            ary_toDos = try context?.fetch(toDosReq) as! [ToDoTable]
        }catch{
            fetchErr = error
        }
        
    }
    
    func deleteToDo(_ entity: ToDoTable){
        
    }
    
    func update(_ entity: ToDoTable){
        
    }
    
    func create(_ category:String, toDos:String){
        let toDoObj = NSEntityDescription.insertNewObject(forEntityName: "ToDoTable", into: context!) as! ToDoTable
        
        toDoObj.toDo = toDos
        toDoObj.createdTime = Date()
        toDoObj.category = category
        toDoObj.id = UUID()
        
        do{
            try context?.save()
            if ((context?.hasChanges) != nil){
                fetchToDos()
            }
            print("Save")
        }catch{
            print("Unable to save")
        }
    }
    
}


extension ViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoTableViewCell
        cell.toDoItem = ary_toDos[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ary_toDos != nil ? ary_toDos.count : 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap me")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
