//
//  HomePresenter.swift
//  TDDExperiment
//
//  Created by Arman Nihal on 20.9.2025.
//
protocol HomePresenterProtocol: AnyObject {
    func buttonPressed()
}

class HomePresenter {
    private let interactor: HomeInteractorProtocol

    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
    weak var view: HomeViewControllerProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    func buttonPressed() {
        view?.showLoadingSpinner()
        view?.updateView(with: "button pressed")
        view?.stopLoadingSpinner()
    }
    
}
