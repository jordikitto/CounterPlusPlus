//
//  DateView.swift
//  CounterPlusPlus
//
//  Created by Jordi Kitto on 25/11/2022.
//

import SwiftUI

struct DateView: View {
    @Environment(\.dismiss) var dismiss
    
    let date: Date
    
    var body: some View {
        VStack(spacing: 50) {
            Text(date.formatted(.dateTime.year().month().day().hour().minute().second()))
            Button("Go Back", action: { dismiss() })
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: .now)
    }
}
