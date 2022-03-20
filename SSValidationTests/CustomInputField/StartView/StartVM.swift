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
    @Published private(set) var sampleModel = SampleModel()

    @Published var textInput = TextInputVM()
    @Published var doubleInput = DoubleInputVM()
    @Published var intInput = IntInputVM()

    init() {
        textInput.getResult().sink { [weak self] in
            self?.sampleModel.textValue = $0
        }
        .store(in: &cancellables)

        doubleInput.getResult().sink { [weak self] in
            self?.sampleModel.doubleValue = $0
        }
        .store(in: &cancellables)

        intInput.getResult().sink { [weak self] in
            self?.sampleModel.intValue = $0
        }
        .store(in: &cancellables)
    }
}
