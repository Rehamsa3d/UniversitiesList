//
//  UniversitiesPresenter.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import Foundation

protocol UniversitiesPresenterProtocol {
    var view: UniversitiesViewProtocol? { get set }
    var interactor: UniversitiesInteractorProtocol? { get set }
    var router: UniversitiesRouterProtocol? { get set }
    
    func interactorDidFetchUniversities(with result: Result<[University], Error>)
    func viewDidLoad()
}

class UniversitiesPresenter: UniversitiesPresenterProtocol {
    var view: UniversitiesViewProtocol?
    var interactor: UniversitiesInteractorProtocol? {
        didSet {
            interactor?.fetchUniversities()
        }
    }
    var router: UniversitiesRouterProtocol?
    
    func interactorDidFetchUniversities(with result: Result<[University], Error>) {
        switch result {
        case .success(let universities):
            view?.update(with: universities)
        case .failure(let error):
            view?.update(with: error)
        }
    }

    func viewDidLoad() {
        interactor?.fetchUniversities()
    }
}
