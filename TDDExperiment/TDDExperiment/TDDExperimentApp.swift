//
//  TDDExperimentApp.swift
//  TDDExperiment
//
//  Created by Arman Nihal on 19.9.2025.
//

import SwiftUI
import SwiftData

@main
struct TDDExperimentApp: App {
    var body: some Scene {
        WindowGroup {
            HomeController().edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let navigationController = UINavigationController()

        let router = HomeRouter(navigationController: navigationController)
        router.load()

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
