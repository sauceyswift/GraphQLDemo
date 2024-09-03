//
//  ContentView.swift
//  GraphQLDemo
//
//  Created by Michael Ceryak on 9/2/24.
//

import SwiftUI
import PlatziAPI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            CategoriesView()
                .navigationDestination(for: AllCategoriesQuery.Data.Category.self) { category in
                    if let id = Double(category.id) {
                        ProductsView(categoryId: id)
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}
