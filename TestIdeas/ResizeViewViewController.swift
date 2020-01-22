//
//  ResizeViewViewController.swift
//  TestIdeas
//
//  Created by Sylvan Ash on 22/01/2020.
//  Copyright © 2020 Sylvan Ash. All rights reserved.
//

import UIKit

class ResizeViewViewController: UIViewController {
    let testView = UIView()
    let button = UIButton()
    let testLabel = UILabel()
    var testViewHeightConstraint: NSLayoutConstraint?
    var testLabelHeightConstraint: NSLayoutConstraint?
    private let defaultHeight: CGFloat = 150
    private let text = "The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog. The quick fox jumped over the lazy dog."
    private var isInitialSetup = true
    private var isFullHeight = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        addViews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard isInitialSetup else { return }
        isInitialSetup = false
        testLabelHeightConstraint = testLabel.heightAnchor.constraint(equalToConstant: testLabel.bounds.size.height)
        testLabelHeightConstraint?.isActive = true
    }

    func addViews() {
        view.addSubview(testView)
        testView.backgroundColor = .cyan

        view.addSubview(button)
        button.setTitle("Change Height", for: .normal)
        button.addTarget(self, action: #selector(changeHeight), for: .touchUpInside)

        view.addSubview(testLabel)
        testLabel.numberOfLines = 0
        testLabel.text = text

        button.translatesAutoresizingMaskIntoConstraints = false
        testView.translatesAutoresizingMaskIntoConstraints = false
        testLabel.translatesAutoresizingMaskIntoConstraints = false

        addConstraints()
    }

    func addConstraints() {
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true

        testView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        testView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        testView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        testViewHeightConstraint = testView.heightAnchor.constraint(equalToConstant: defaultHeight)
        testViewHeightConstraint?.isActive = true

        testLabel.topAnchor.constraint(equalTo: testView.bottomAnchor).isActive = true
        testLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        testLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    @objc
    func changeHeight() {
        isFullHeight = !isFullHeight
        changeTestLabelHeight()
    }

    func changeTestViewHeight() {
        self.testViewHeightConstraint?.constant = self.isFullHeight ? self.defaultHeight : 50
        UIView.animate(withDuration: 2) { [weak self] in
            guard let self = self else { return }
            self.view.layoutIfNeeded()
        }
    }

    func changeTestLabelHeight() {
        self.testLabelHeightConstraint?.constant = self.isFullHeight ? self.defaultHeight : 50
        UIView.animate(withDuration: 2) { [weak self] in
            guard let self = self else { return }
            self.view.layoutIfNeeded()
        }
    }
}
