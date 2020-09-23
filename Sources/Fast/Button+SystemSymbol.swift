//
//  Button+SystemSymbol.swift
//  Fast
//
//  Created by Nicolas Degen on 11.07.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
extension Button where Label == Image {
  public init(systemSymbol: String, action: @escaping ()->()) {
    self.init(action: action) {
      Image(systemName: systemSymbol)
    }
  }
}
#endif
