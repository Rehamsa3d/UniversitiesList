//
//  UniversitiesViewController.swift
//  Universities
//
//  Created by Reham Saad on 25/06/2024.
//

import UIKit

protocol UniversitiesViewProtocol: AnyObject {
    var presenter: UniversitiesPresenterProtocol? { get set }
    
    func update(with universities: [University])
    func update(with error: Error)
}

class UniversitiesViewController: UIViewController, UniversitiesViewProtocol, UITableViewDataSource, UITableViewDelegate {
    var presenter: UniversitiesPresenterProtocol?
    var universities: [University] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Universities List"
        setupTableView()
        presenter?.view = self
        presenter?.viewDidLoad()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        let nib = UINib(nibName: "CellOfUniversity", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CellOfUniversity")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
            
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func update(with universities: [University]) {
        self.universities = universities
        self.tableView.reloadData()
    }
    
    func update(with error: Error) {
        // Handle the error (e.g., show an alert)
        print("error.localizedDescription", error.localizedDescription)
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource & UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfUniversity", for: indexPath) as! CellOfUniversity
//        cell.backgroundColor = .red
        cell.nameLabel?.text = "sadsadddasdd"//universities[indexPath.row].name
        cell.nameLabel?.textColor = .black
        cell.university = universities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.routeToDetails(from: self, with: universities[indexPath.row], refreshDelegate: self)
    }
}

extension UniversitiesViewController: RefreshUniversitiesProtocol {
    
    func refresh() {
        presenter?.viewDidLoad()
    }
    
}
