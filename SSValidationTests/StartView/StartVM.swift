//
//  StartVM.swift
//  SSValidationTests
//
//  Created by sebastianstaszczyk on 19/03/2022.
//

import Combine
import Foundation
import SSValidation

final class StartVM: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []

    @Published var intInput = InputVM(type: .integer)
    @Published var doubleInput = InputVM(type: .double)
    @Published var textInput = InputVM(type: .text())
}
