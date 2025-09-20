//
//  HomeTests.swift
//  TDDExperiment
//
//  Created by Arman Nihal on 20.9.2025.
//
import Testing
import UIKit
@testable import TDDExperiment

struct TDDExperimentTests {
    @MainActor @Test
    func showButtonSucceeds() {
        let (sut, _) = makeSUT()

        sut.pressShowButton()

        #expect(sut.viewMessages.count == 1)
        #expect(sut.viewMessages == [.updateView("button pressed")])
    }

    // MARK: - Helpers
    @MainActor
    private func makeSUT() -> (sut: SUT, spy: SPY) {
        let spy = SPY()

        let router = HomeRouter(
            navigationController: spy,
            viewControllerType: SUT.self
        )
        router.load()

        let sut = spy.viewController!

        return (sut, spy)
    }

    // MARK: - SUT
    private class SUT: HomeViewController {
        enum Message: Equatable {
            case updateView(_ text: String)
        }
        private(set) var viewMessages: [Message] = []

        func pressShowButton() {
            presenter.buttonPressed()
        }

        // MARK: - HomeViewControllerProtocol
        override func updateView(with text: String) {
            viewMessages.append(.updateView(text))
        }
    }

    // MARK: - SPY
    private class SPY: UINavigationController {
        private(set) var viewController: SUT?

        override func show(_ vc: UIViewController, sender: Any?) {
            viewController = vc as? SUT
        }
    }
}
