//
//  GreenhouseManager.swift
//  Greenhouse_v1
//
//  Created by Tomás Veiga on 05/05/2023.
//

import Foundation

class GreenhouseManager {
    func getCurrentGreenhouseStats() async throws -> ResponseBody {
        guard let url = URL(string: "https://api.thingspeak.com/channels/2128848/feeds.json?api_key=P983C0G1H6RO2L1Z") else {fatalError("Missing URL")}
    
        let urlRequest = URLRequest(url: url);
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching greenhouse data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from:data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var channel: ChannelResponse
    var feeds: [FeedResponse]
    
    struct ChannelResponse: Decodable {
        var id: Int
        var name: String
        var latitude: String
        var longitude: String
        var field1: String
        var field2: String
        var field3: String
        var field4: String
        var last_entry_id: Int
    }
    
    struct FeedResponse: Decodable {
        var created_at: String
        var entry_id: Int
        var field1: String
        var field2: String
        var field3: String
        var field4: String
    }
}

extension ResponseBody.ChannelResponse {
    var numEntries: Int {return last_entry_id}
}

extension ResponseBody.FeedResponse {
    var timeStamp: String {return created_at}
    var entryID: Int {return entry_id}
    var temperature: Double {return Double(field1)!}
    var humidity: Int {return Int(field2)!}
    var light: Int {return Int(field3)!}
    var windowAngle: Int {return Int(field4)!}
}
