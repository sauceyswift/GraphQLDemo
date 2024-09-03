// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AllCategoriesQuery: GraphQLQuery {
  public static let operationName: String = "AllCategories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AllCategories { categories { __typename id name image } }"#
    ))

  public init() {}

  public struct Data: PlatziAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PlatziAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("categories", [Category].self),
    ] }

    public var categories: [Category] { __data["categories"] }

    /// Category
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
        .field("image", String.self),
      ] }

      public var id: PlatziAPI.ID { __data["id"] }
      public var name: String { __data["name"] }
      public var image: String { __data["image"] }
    }
  }
}
