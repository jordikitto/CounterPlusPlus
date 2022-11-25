//
//  CounterDetailsView.swift
//  CounterPlusPlus
//
//  Created by Jordi Kitto on 25/11/2022.
//

import SwiftUI
import Combine

struct CounterDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 50) {
            Label("\(viewModel.counter.value)", systemImage: "number.circle")
            Label(viewModel.timeSinceLastChange.formatted(), systemImage: "clock.arrow.circlepath")
            Button("Go Back & Reset") { viewModel.resetCounter(); dismiss() }
            Button("Go Back") { dismiss() }
        }
    }
}

extension CounterDetailsView {
    class ViewModel: ObservableObject {
        @Published private(set) var counter: Counter
        @Published private(set) var timeSinceLastChange: Double
        var bag: Set<AnyCancellable> = []
        
        init(counter: Counter) {
            self.counter = counter
            self.timeSinceLastChange = Date().timeIntervalSince(counter.lastChangeDate)
            
            counter.$lastChangeDate
                .receive(on: RunLoop.main)
                .sink { [weak self] newChangeDate in
                    self?.timeSinceLastChange = Date().timeIntervalSince(newChangeDate)
                }
                .store(in: &bag)
        }
        
        func resetCounter() {
            counter.resetCounter()
        }
    }
}

struct CounterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CounterDetailsView(viewModel: .init(counter: Counter()))
    }
}
