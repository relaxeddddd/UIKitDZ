// WKWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

///  Класс для отображения браузера
final class WKWebViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let backbuttoItemImageName = "chevron.left.2"
        static let forwardButtonItemImageName = "chevron.right.2"
        static let link = "https://www.youtube.com/@theswiftdevelopers1301"
    }

    // MARK: - Private Properties

    private let webView = WKWebView()
    private let toolbar = UIToolbar()

    // MARK: - Lyde Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupBarButtonItem()
        setupConstraintsWebView()
        setupConstraintstoolBar()
        loadRequest()
    }

    // MARK: - Private Methods

    private func setupBarButtonItem() {
        let backbuttoItem = UIBarButtonItem(
            image: UIImage(systemName: Constants.backbuttoItemImageName),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        let forwardButtonItem = UIBarButtonItem(
            image: UIImage(systemName: Constants.forwardButtonItemImageName),
            style: .plain,
            target: self,
            action: #selector(goForward)
        )
        let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
        let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)

        toolbar.items = [backbuttoItem, forwardButtonItem, spacer, refreshButtonItem]
        backbuttoItem.tintColor = .black
        forwardButtonItem.tintColor = .black
        refreshButtonItem.tintColor = .black
    }

    private func addViews() {
        view.addSubview(webView)
        view.addSubview(toolbar)
    }

    private func setupConstraintsWebView() {
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

    private func setupConstraintstoolBar() {
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        toolbar.topAnchor.constraint(equalTo: webView.bottomAnchor).isActive = true
        toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func loadRequest() {
        guard let url = URL(string: Constants.link) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @objc private func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}

// MARK: - WKWebViewController + WKNavigationDelegate

extension WKWebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        decisionHandler(.allow)
    }
}
