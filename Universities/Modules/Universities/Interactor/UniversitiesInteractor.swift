//
//  UniversitiesInteractor.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import Foundation
import Alamofire
import RealmSwift

protocol UniversitiesInteractorProtocol {
    var presenter: UniversitiesPresenterProtocol? { get set }
    func fetchUniversities()
}

class UniversitiesInteractor: UniversitiesInteractorProtocol {
    var presenter: UniversitiesPresenterProtocol?
    let realm = try! Realm()
    
    func fetchUniversities() {
        let url = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                print("data", data)
                do {
                    let universities = try JSONDecoder().decode([University].self, from: data)
                    try! self.realm.write {
                        self.realm.add(universities, update: .all)
                    }
                    print("universities", universities)

                    self.presenter?.interactorDidFetchUniversities(with: .success(universities))
                } catch {
                    print("error1===>", error)
                    self.presenter?.interactorDidFetchUniversities(with: .failure(error))
                }
            case .failure(let error):
                print("error2===>", error)
                let cachedUniversities = Array(self.realm.objects(University.self))
                if cachedUniversities.isEmpty {
                    self.presenter?.interactorDidFetchUniversities(with: .failure(error))
                } else {
                    self.presenter?.interactorDidFetchUniversities(with: .success(cachedUniversities))
                }
            }
        }
    }
}
