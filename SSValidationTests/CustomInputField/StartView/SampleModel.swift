//
//  SampleModel.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 20/03/2022.
//

import Combine
import Foundation
import SSUtils
import SSValidation

struct SampleModel {
    var text: String?
    var double: Double?
    var int: Int?
}

extension SampleModel {
    static func bind(text: TextInputVM, double: DoubleInputVM, int: IntInputVM) -> Driver<SampleModel> {
        Publishers.CombineLatest3(text.result(), double.result(), int.result())
            .map { SampleModel(text: $0, double: $1, int: $2) }
            .asDriver
    }
}
