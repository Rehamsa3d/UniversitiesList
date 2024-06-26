//
//  UniversitiesRouter.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import UIKit

protocol UniversitiesRouterProtocol {
    var entry: EntryPoint? { get }
    static func start() -> UniversitiesRouterProtocol
    func routeToDetails(from view: UniversitiesViewProtocol, with university: University, refreshDelegate: RefreshUniversitiesProtocol)
}

class UniversitiesRouter: UniversitiesRouterProtocol {
    var entry: EntryPoint?
    
    static func start() -> UniversitiesRouterProtocol {
        let router = UniversitiesRouter()
        
        // Assign VIPER modules
        let view: UniversitiesViewProtocol = UniversitiesViewController()
        var presenter: UniversitiesPresenterProtocol = UniversitiesPresenter()
        var interactor: UniversitiesInteractorProtocol = UniversitiesInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    func routeToDetails(from view: UniversitiesViewProtocol, with university: University, refreshDelegate: RefreshUniversitiesProtocol) {
            let detailsVC = UniversityDetailsRouter.createModule(with: university, refreshDelegate: refreshDelegate)
            if let viewController = view as? UIViewController {
                
                viewController.present(detailsVC, animated: true, completion: nil)
            }
    }
}

typealias EntryPoint = UniversitiesViewProtocol & UIViewController
