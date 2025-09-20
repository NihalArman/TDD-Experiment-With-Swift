//
//  HomeRouter.swift
//  TDDExperiment
//
//  Created by Arman Nihal on 20.9.2025.
//
import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    func createView() -> UIViewController
    func load()
}

class HomeRouter: HomeRouterProtocol {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func createView() -> UIViewController {
        let interactor = HomeInteractor()
        let presenter = HomePresenter(interactor: interactor)
        let viewController = HomeViewController(presenter: presenter)
        return viewController
    }

    func load() {
        navigationController.pushViewController(createView(), animated: true)
    }
}
