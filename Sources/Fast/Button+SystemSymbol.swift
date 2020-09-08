//
//  Button+SystemSymbol.swift
//  Fast
//
//  Created by Nicolas Degen on 11.07.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == Image {
  public init(systemSymbol: String, action: @escaping ()->()) {
    self.init(action: action) {
      Image(systemName: systemSymbol)
    }
  }
}
