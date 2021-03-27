//
//  Bundle+Version.swift
//  Fast
//
//  Created by Nicolas Degen on 17.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import Foundation

extension Bundle {
  var releaseVersion: String? {
    infoDictionary?["CFBundleShortVersionString"] as? String
  }
  
  var buildNumber: String? {
    infoDictionary?["CFBundleVersion"] as? String
  }
  
  var name: String? {
    infoDictionary?[kCFBundleNameKey as String] as? String
  }
}
