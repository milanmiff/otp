//
//  String+Extension.swift
//  OTP
//
//  Created by Milan Djordjevic on 08/01/2024.
//

import SwiftUI

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
