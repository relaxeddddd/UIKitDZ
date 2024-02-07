// CostumModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель
struct CalculationModel {
    func additionNumbers(_ num1: Double, _ num2: Double) -> Double {
        num1 + num2
    }

    func subtractNumbers(_ num1: Double, _ num2: Double) -> Double {
        num1 - num2
    }

    func multiplicationNumbers(_ num1: Double, _ num2: Double) -> Double {
        num1 * num2
    }

    func dividingNumbers(_ num1: Double, _ num2: Double) -> Double? {
        guard num1 != 0 else { return nil }
        guard num2 != 0 else { return nil }
        return num1 / num2
    }

    let randomNumber = Int.random(in: 0 ... 10)
}
