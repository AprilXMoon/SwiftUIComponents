//
//  ContentView.swift
//  SwiftUIComponents
//
//  Created by aprillee on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Label("SwiftUI UI Components", systemImage: "iphone")
                List {
                    Text("Slider")

                    Text("Toggle")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
