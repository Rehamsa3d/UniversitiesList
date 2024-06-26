//
//  UniversityDetailsViewController.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import UIKit

protocol UniversityDetailsViewProtocol {
    var presenter: UniversityDetailsPresenterProtocol? { get set }
    
    func showDetails(for university: University)
}

protocol RefreshUniversitiesProtocol {
    func refresh()
}


class UniversityDetailsViewController: UIViewController, UniversityDetailsViewProtocol {
    var presenter: UniversityDetailsPresenterProtocol?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var universityState: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var webPageLabel: UILabel!

    @IBOutlet weak var refreshButton: UIButton!

    var refreshDelegate : RefreshUniversitiesProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func showDetails(for university: University) {
        self.nameLabel?.text = university.name
        self.universityState?.text = university.stateProvince ?? ""
        self.countryLabel?.text = university.country ?? ""
        self.countryCodeLabel?.text = university.alphaTwoCode ?? ""
        self.webPageLabel.text = university.webPages.first
        
        refreshButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

    }
    
    @objc private func closeButtonTapped() {
        refreshDelegate?.refresh()
        dismiss(animated: true, completion: nil)
    }
}
