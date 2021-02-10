//
//  ViewController.swift
//  CoreDataSample
//
//  Created by home on 2021/02/03.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // 永続コンテナへの参照を保持する変数
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 永続コンテナのnilチェック
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
    }
    
    
    @IBAction func insertImageData(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Image", in: managedContext)!
        
        let image = NSManagedObject(entity: entity, insertInto: managedContext)
        
        image.setValue(1, forKey: "id")
        image.setValue("http://...", forKey: "imageURL")
        image.setValue(5, forKey: "likes")
        image.setValue("sea", forKey: "tag")
        
        appDelegate.saveContext()
    }
    
}

