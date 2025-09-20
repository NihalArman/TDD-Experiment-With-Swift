//
//  HomePresenter.swift
//  TDDExperiment
//
//  Created by Arman Nihal on 20.9.2025.
//
protocol HomePresenterProtocol: AnyObject {
}

class HomePresenter {
    private let interactor: HomeInteractorProtocol

    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
    weak var view: HomeViewControllerProtocol?
}

extension HomePresenter: HomePresenterProtocol {
}
