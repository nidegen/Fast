//
//  NavigationLink+SystemSymbol.swift
//  Fast
//
//  Created by Nicolas Degen on 23.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
extension NavigationLink where Label == Image {
  public init(systemSymbol: String, destination: Destination) {
    self.init(destination: destination) {
      Image(systemName: systemSymbol)
    }
  }
}
