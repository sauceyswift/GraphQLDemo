//
//  ProductsView.swift
//  GraphQLDemo
//
//  Created by Michael Ceryak on 9/3/24.
//

import SwiftUI


@MainActor
struct ProductsView: View {
    
    let categoryId: Double
    
    @State private var VM = ViewModel()
    
    var body: some View {
        List {
            ForEach(VM.products, id: \.id) { product in
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(product.title)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Text(product.price, format: .currency(code: "USD"))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.green)
                            .clipShape(Capsule())
                    }
                    Text(product.description)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listRowSpacing(10)
        .task {
            await VM.loadProducts(categoryId: categoryId)
        }
    }
}

#Preview {
//    if let category = AllCategoriesQuery.Data.Category(data: ["id": 1, "name": "Furniture"]) {
        
    ProductsView(categoryId: 1)
//    try! ProductsView(category: .init(data: ["__typename": "Category", "id": 1, "name": "Furniture", "image": ""]))
//    }
}
