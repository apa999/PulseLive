//
//  NetworkManager.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

struct NetworkManager {
  
  static let shared = NetworkManager()
  let decoder       = JSONDecoder()
  
  private init() {
    // Not required in this example, but included for future
    decoder.keyDecodingStrategy  = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .iso8601
  }
  
  // MARK: - Get Contents
  func getContents() async throws -> Content {
    let endpoint = DataSourceLinks.contentListEndpoint
    
    guard let url = URL(string: endpoint) else { throw PLError.invalidEndpoint }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw PLError.invalidResponse
    }
    
    do {
      return try decoder.decode(Content.self, from: data)
    } catch (let error) {
      throw PLError.invalidData
    }
  }
  
  // MARK: - Get Item Details
  func getItemDetail(for id: Int) async throws -> Item {
    let endpoint = "\(DataSourceLinks.contentDetailEndpoint)\(id)"
    
    guard let url = URL(string: endpoint) else { throw PLError.invalidEndpoint }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw PLError.invalidResponse
    }
    
    do {
      return try decoder.decode(Item.self, from: data)
    } catch {
      throw PLError.invalidData
    }
  }
  
  // MARK: - Testing
  func getContents(from data: Data) throws -> Content {
    do {
      return try decoder.decode(Content.self, from: data)
    } catch {
      throw PLError.invalidData
    }
  }
  
  func getItem(from data: Data) throws -> Item {
    do {
      return try decoder.decode(Item.self, from: data)
    } catch {
      throw PLError.invalidData
    }
  }
  
  func getItemDetail(from data: Data) throws -> ItemDetail {
    do {
      return try decoder.decode(ItemDetail.self, from: data)
    } catch {
      throw PLError.invalidData
    }
  }
}
