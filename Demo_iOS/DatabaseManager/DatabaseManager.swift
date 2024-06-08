//
//  DatabaseManager.swift
//  Demo_iOS
//
//  Created by kishor garkal on 08/06/24.
//

import Foundation
import RealmSwift

class DatabaseManager {
    static var sharedQueue = DispatchQueue(label: "com.demo.in.Demo-iOS", qos: .background)
   // private init(){}

    func saveUniversities(_ universities: [University], completion: (() -> Void)? = nil) {
        DatabaseManager.sharedQueue.async {
            autoreleasepool {
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(universities, update: .all)
                    }
                    DispatchQueue.main.async {
                        completion?()
                    }
                } catch {
                    print("Error saving universities: \(error)")
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }

    func loadUniversities(completion: @escaping ([University]) -> Void) {
        DatabaseManager.sharedQueue.async {
            autoreleasepool {
                do {
                    let realm = try Realm()
                    let results = realm.objects(University.self)
                    let universities = Array(results)
                    DispatchQueue.main.async {
                        completion(universities)
                    }
                } catch {
                    print("Error loading universities: \(error)")
                    DispatchQueue.main.async {
                        completion([])
                    }
                }
            }
        }
    }
    
    

}

