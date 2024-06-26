//
//  UniversityDetailsRouter.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import UIKit

protocol UniversityDetailsRouterProtocol {
    static func createModule(with university: University, refreshDelegate: RefreshUniversitiesProtocol) -> UIViewController
}

class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    static func createModule(with university: University, refreshDelegate: RefreshUniversitiesProtocol) -> UIViewController {
        let storyBoard = UIStoryboard(name: "UniversityDetails",bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "UniversityDetailsViewController") as! UniversityDetailsViewController
        var interactor: UniversityDetailsInteractorProtocol = UniversityDetailsInteractor()
        var presenter: UniversityDetailsPresenterProtocol = UniversityDetailsPresenter(university: university)
        let router: UniversityDetailsRouterProtocol = UniversityDetailsRouter()
        
        view.presenter = presenter
        view.refreshDelegate = refreshDelegate
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
