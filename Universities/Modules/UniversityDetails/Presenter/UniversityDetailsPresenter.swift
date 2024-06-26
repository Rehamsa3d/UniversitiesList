//
//  UniversityDetailsPresenter.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import Foundation

protocol UniversityDetailsPresenterProtocol {
    var view: UniversityDetailsViewProtocol? { get set }
    var interactor: UniversityDetailsInteractorProtocol? { get set }
    var router: UniversityDetailsRouterProtocol? { get set }
    
    func viewDidLoad()
}

class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    var view: UniversityDetailsViewProtocol?
    var interactor: UniversityDetailsInteractorProtocol?
    var router: UniversityDetailsRouterProtocol?
    
    private let university: University
    
    init(university: University) {
        self.university = university
    }
    
    func viewDidLoad() {
        view?.showDetails(for: university)
    }
}
