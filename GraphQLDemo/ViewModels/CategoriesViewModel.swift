//
//  CategoriesViewModel.swift
//  GraphQLDemo
//
//  Created by Michael Ceryak on 9/3/24.
//

import SwiftUI
import PlatziAPI

extension CategoriesView {

    @Observable
    @MainActor
    final class ViewModel {
        
        private(set) var categories: [AllCategoriesQuery.Data.Category] = []
        
        private(set) var errors: [any Error] = []
        
        func loadCategories() async {
            self.errors = []
            do {
                let result = try await Network.shared.fetch(AllCategoriesQuery(), returning: AllCategoriesQuery.Data.self)
                self.categories = result.data?.categories ?? []
                self.errors = result.errors
            } catch {
                self.errors = [error]
            }
        }
        
    }
    
}
