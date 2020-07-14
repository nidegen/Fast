//
//  Button+SystemSymbol.swift
//  Fast
//
//  Created by Nicolas Degen on 11.07.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

extension Button where Label == Image {
  public init(systemName: String, action: @escaping ()->()) {
    self.init(action: action) {
      Image(systemName: systemName)
    }
  }
}
