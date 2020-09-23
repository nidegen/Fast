//
//  NavigationLink+SystemSymbol.swift
//  Fast
//
//  Created by Nicolas Degen on 23.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
extension NavigationLink where Label == Image {
  public init(systemSymbol: String, destination: Destination) {
    self.init(destination: destination) {
      Image(systemName: systemSymbol)
    }
  }
}
#endif
