//
//  CategoriesView.swift
//  GraphQLDemo
//
//  Created by Michael Ceryak on 9/2/24.
//

import SwiftUI

@MainActor
struct CategoriesView: View {
    
    @State private var VM = ViewModel()
    
    var body: some View {
        List {
            ForEach(VM.categories, id: \.id) { category in
                NavigationLink(value: category){
                    HStack(spacing: 20) {
                        AsyncImage(url: URL(string: category.image)) {
                            result in
                            result.image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(radius: 5)
                                .frame(height: 100)
                        }
                        Text(category.name)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .navigationTitle("Categories")
        .task {
            await VM.loadCategories()
        }
    }
}

#Preview {
    ContentView()
}
