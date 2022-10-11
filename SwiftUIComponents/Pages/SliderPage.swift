//
//  SliderPage.swift
//  SwiftUIComponents
//
//  Created by aprillee on 2022/10/11.
//

import SwiftUI

struct SliderPage: View {
    
    @State private var value = 20.0
    
    @State private var value2 = 15.0
    @State private var isEditing = false
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Slider")
                .bold()
            List {
                Section("Default Slider") {
                    DefaultSliderStyleOne(value: $value)
                }
               
                Section("Default Slider 2") {
                    DefaultSliderStyleTwo(value2: $value2, isEditing: $isEditing)
                }
            
                
                Section("Custom Slider") {
                    VStack {
                        HStack {
                            Text("0")
                            HStack(spacing: (((UIScreen.main.bounds.width - 190) / 12))) {
                                ForEach(0...12, id:\.self) { index in
                                    Circle()
                                        .fill(.black)
                                        .frame(width: 4, height: 4)
                                }
                            }
                            Text("100")
                        }
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                        
                            Capsule()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 5)
                            Capsule()
                                .fill(Color.yellow)
                                .frame(width: offset, height: 5)
                            
                            Circle()
                                .fill(.orange)
                                .frame(width: 15, height:15)
                                .background( Circle().stroke(Color.orange.opacity(0.5), lineWidth: 5))
                                .offset(x: offset)
                                .gesture(
                                    DragGesture().onChanged({ value in
                                        if value.location.x > 15 && value.location.x <= UIScreen.main.bounds.width - 70 {
                                            offset = value.location.x - 20
                                        }
                                    })
                                )
                        }
                        
                        Text("Custom Slider value:\(Int(offset))")
                        
                    }
                }
            }
            
            
            
        }
    }
}


struct DefaultSliderStyleOne: View {
    
    @Binding var value: Double
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...100)
            
            Slider(value: $value, in: 0...100)
                .accentColor(.orange)
            
            Text("Slider value: \(Int(value))")
        }
    }
    
}

struct DefaultSliderStyleTwo: View {
    
    @Binding var value2: Double
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack{
            Slider(value: $value2, in: 0...100) {
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            } onEditingChanged: { editing in
                isEditing = editing
            }
            
            VStack {
                Text("Slider with minimun and maximun")
                Text("\(Int(value2))")
                    .bold(isEditing)
                    .foregroundColor(isEditing ? .purple : .black)
            }
        }
    }
}


struct SliderPage_Previews: PreviewProvider {
    static var previews: some View {
        SliderPage()
    }
}
