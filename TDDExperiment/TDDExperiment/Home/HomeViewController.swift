//
//  HomeViewController.swift
//  TDDExperiment
//
//  Created by Arman Nihal on 20.9.2025.
//
import UIKit

protocol HomeViewControllerProtocol: AnyObject {
}

class HomeViewController: UIViewController {
    internal let presenter: HomePresenterProtocol

    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
}

extension HomeViewController: HomeViewControllerProtocol {}
