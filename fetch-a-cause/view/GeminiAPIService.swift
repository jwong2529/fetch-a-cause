//
//  Untitled.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/2/25.
//

import Foundation

struct GeminiAPIService {
    private let apiKey = "YOUR_GOOGLE_GEMINI_API_KEY"
    private let baseURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent"

    func sendMessage(_ message: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "\(baseURL)?key=\(apiKey)") else {
            completion(nil)
            return
        }

        let requestBody: [String: Any] = [
            "contents": [
                ["parts": [["text": message]]]
            ]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let candidates = jsonResponse["candidates"] as? [[String: Any]],
                   let content = candidates.first?["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let text = parts.first?["text"] as? String {
                    completion(text)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
