//
//  ButtonStyle+Float.swift
//  Fast
//
//  Created by Nicolas Degen on 11.07.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI


struct FloatStyle: ButtonStyle {
  var color: Color
  
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .frame(minWidth: 30, maxWidth: .infinity)
      .padding(10)
      .foregroundColor(.white)
      .background(configuration.isPressed ? .white : self.color)
      .cornerRadius(5)
  }
}
