//
//  Binding+Ext.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 20/10/25.
//

import SwiftUI

extension Binding where Value == Bool {
    
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
