// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CategoryProductsQuery: GraphQLQuery {
  public static let operationName: String = "CategoryProducts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query CategoryProducts($categoryId: Float!) { products(categoryId: $categoryId) { __typename id title price description category { __typename id name } } }"#
    ))

  public var categoryId: Double

  public init(categoryId: Double) {
    self.categoryId = categoryId
  }

  public var __variables: Variables? { ["categoryId": categoryId] }

  public struct Data: PlatziAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PlatziAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("products", [Product].self, arguments: ["categoryId": .variable("categoryId")]),
    ] }

    public var products: [Product] { __data["products"] }

    /// Product
    ///
    /// Parent Type: `Product`
    public struct Product: PlatziAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { PlatziAPI.Objects.Product }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", PlatziAPI.ID.self),
        .field("title", String.self),
        .field("price", Double.self),
        .field("description", String.self),
        .field("category", Category.self),
      ] }

      public var id: PlatziAPI.ID { __data["id"] }
      public var title: String { __data["title"] }
      public var price: Double { __data["price"] }
      public var description: String { __data["description"] }
      public var category: Category { __data["category"] }

      /// Product.Category
      ///
      /// Parent Type: `Category`
      public struct Category: PlatziAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PlatziAPI.Objects.Category }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", PlatziAPI.ID.self),
          .field("name", String.self),
        ] }

        public var id: PlatziAPI.ID { __data["id"] }
        public var name: String { __data["name"] }
      }
    }
  }
}
