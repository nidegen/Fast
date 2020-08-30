//
//  View+When.swift
//  Fast
//
//  Created by Nicolas Degen on 21.08.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

extension View {
  @ViewBuilder
  public func when(_ condition: Bool) -> some View {
    if condition {
      self
    }
  }
}
