// CostumModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель
struct CalculationModel {
    // MARK: - Public Properties

    let randomNumber = Int.random(in: 0 ... 10)

    // MARK: - Public Methods

    public func additionNumbers(_ num1: Double, _ num2: Double) -> Double {
        num1 + num2
    }

    public func subtractNumbers(_ num1: Double, _ num2: Double) -> Double {
        num1 - num2
    }

    public func multiplicationNumbers(_ num1: Double, _ num2: Double) -> Double {
        num1 * num2
    }

    public func dividingNumbers(_ num1: Double, _ num2: Double) -> Double? {
        guard num1 != 0 else { return nil }
        guard num2 != 0 else { return nil }
        return num1 / num2
    }
}
