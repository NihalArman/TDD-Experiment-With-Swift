//
//  HomeViewController.swift
//  TDDExperiment
//
//  Created by Arman Nihal on 20.9.2025.
//
import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func showLoadingSpinner()
    func stopLoadingSpinner()
    func updateView(with text: String)
}

class HomeViewController: UIViewController {
    internal let presenter: HomePresenterProtocol

    required init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupView()
    }

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.text = "No text has been set"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private lazy var button: UIButton = {
        let button = UIButton.init(
            configuration: .filled(),
            primaryAction: .init(
                handler: {_ in self.presenter.buttonPressed()
                })
        )
        button.configuration?.baseBackgroundColor = .systemCyan
        button.configuration?.title = "press me"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    private func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(button)
        containerView.addSubview(textView)
        containerView.addSubview(loadingSpinner)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            textView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.1),
            textView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5),
            textView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 60),

            loadingSpinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }

    func updateView(with text: String) {
        textView.text = text
        view.setNeedsDisplay()
    }

    func showLoadingSpinner() {
        loadingSpinner.startAnimating()
    }

    func stopLoadingSpinner() {
        loadingSpinner.stopAnimating()
    }
}

extension HomeViewController: HomeViewControllerProtocol {}
