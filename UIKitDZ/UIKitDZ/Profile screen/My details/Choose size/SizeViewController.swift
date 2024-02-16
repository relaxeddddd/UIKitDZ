// SizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Представление окна выбора размера
class SizeViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let sizes = [32, 33, 34, 35, 36, 37, 38, 49, 40, 41, 42, 43, 44]
    }

    // MARK: - Public Properties

    public var didSelectSizeHandler: ((Int) -> Void)?

    // MARK: - Private Properties

    private var sizeView = SizeView()
    private var selectedSize: Int?
    private var pickerView = UIPickerView()

    // MARK: - Lify Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPicker()
        addTarget()
    }

    override func loadView() {
        super.loadView()
        view = sizeView
    }

    // MARK: = Private Methods

    private func addTarget() {
        sizeView.closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        sizeView.saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }

    private func setupPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        sizeView.backgrounUiView.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: sizeView.backgrounUiView.centerXAnchor).isActive = true
    }

    @objc private func save() {
        guard let size = selectedSize else {
            dismiss(animated: true)
            return
        }
        didSelectSizeHandler?(size)
        dismiss(animated: true)
    }

    @objc private func close() {
        dismiss(animated: true)
    }
}

extension SizeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constants.sizes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(Constants.sizes[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSize = Constants.sizes[row]
    }
}
