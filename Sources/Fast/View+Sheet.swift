//
//  View+ActionSheet.swift
//  Fast
//
//  Created by Nicolas Degen on 14.10.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
public struct SheetData: Identifiable  {
  public var id = UUID().uuidString
  public var view: () -> AnyView
  public init(view: @escaping () -> AnyView) {
    self.view = view
  }
}

public extension View {
  func sheet(_ data: Binding<SheetData?>) -> some View {
    self.sheet(item: data) { data in
      data.view()
    }
  }
}
#endif

