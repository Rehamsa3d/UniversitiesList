//
//  UniversityDetailsInteractor.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

protocol UniversityDetailsInteractorProtocol {
    var presenter: UniversityDetailsPresenterProtocol? { get set }
}

class UniversityDetailsInteractor: UniversityDetailsInteractorProtocol {
    var presenter: UniversityDetailsPresenterProtocol?
}
