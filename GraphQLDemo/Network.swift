//
//  Network.swift
//  GraphQLDemo
//
//  Created by Michael Ceryak on 9/2/24.
//

import Foundation
import Apollo
import ApolloAPI

struct GraphQLFetchResult<T: RootSelectionSet> {
    let data: T?
    let errors: [any Error]
}

class Network {
    static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.escuelajs.co/graphql")!)
    
    
    func fetch<T: GraphQLQuery, S: RootSelectionSet>(_ query: T, returning: S.Type, returnCacheDataElseFetch: Bool=true) async throws -> GraphQLFetchResult<S> {
        
        try await withCheckedThrowingContinuation { continuation in
            
            apollo.fetch(query: query, cachePolicy: returnCacheDataElseFetch ? .returnCacheDataElseFetch : .fetchIgnoringCacheData) { result in
            
                switch result {
                case .success(let graphQLData):
                    continuation.resume(returning: GraphQLFetchResult<S>(data: graphQLData.data as? S, errors: graphQLData.errors ?? []))
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
            
        }
    }
    
}
