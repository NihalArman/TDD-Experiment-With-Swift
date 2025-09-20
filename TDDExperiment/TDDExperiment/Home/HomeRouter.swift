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
    private let viewControllerType: HomeViewController.Type

    init(
        navigationController: UINavigationController,
        viewControllerType: HomeViewController.Type = HomeViewController.self
    ) {
        self.navigationController = navigationController
        self.viewControllerType = viewControllerType
    }

    func createView() -> UIViewController {
        let interactor = HomeInteractor()
        let presenter = HomePresenter(interactor: interactor)
        let viewController = viewControllerType.init(presenter: presenter)
        presenter.view = viewController
        return viewController
    }

    func load() {
        navigationController.show(createView(), sender: nil)
    }
}
