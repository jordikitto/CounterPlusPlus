//
//  CounterDashboardView.swift
//  CounterPlusPlus
//
//  Created by Jordi Kitto on 25/11/2022.
//

import SwiftUI

struct CounterDashboardView: View {
    @StateObject private var counter = Counter()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Label("\(counter.value)", systemImage: "number.circle")
                
                Button("Increase Count") {
                    counter.increaseCounter()
                }
                .controlSize(.large)
                .buttonStyle(.bordered)
                
                NavigationLink("Show Counter") {
                    CounterDetailsView(viewModel: .init(counter: counter))
                }
                
                NavigationLink("Show Date") {
                    DateView(date: counter.lastChangeDate)
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                print("NETWORK CALL")
                counter.increaseCounter()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CounterDashboardView()
    }
}
