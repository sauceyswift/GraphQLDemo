//
//  ProductsViewModel.swift
//  GraphQLDemo
//
//  Created by Michael Ceryak on 9/3/24.
//

import SwiftUI
import PlatziAPI

extension ProductsView {
    
    @Observable
    @MainActor
    final class ViewModel {
        
        private(set) var products: [CategoryProductsQuery.Data.Product] = []
        private(set) var errors: [any Error] = []
        
        func loadProducts(categoryId: Double) async {
            self.errors = []
            do {
                let result = try await Network.shared.fetch(CategoryProductsQuery(categoryId: categoryId), returning: CategoryProductsQuery.Data.self)
                self.products = result.data?.products ?? []
                self.errors = result.errors
            } catch {
                self.errors = [error]
            }
        }
        
    }
}
