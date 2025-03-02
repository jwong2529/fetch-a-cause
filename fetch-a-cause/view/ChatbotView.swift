//
//  ChatbotView.swift
//  fetch-a-cause
//
//  Created by Tiffany Mo on 3/2/25.
//

import SwiftUI

struct ChatbotView: View {
    @State private var userInput: String = ""
    @State private var messages: [(String, Bool)] = [] // (Message, isUser)
    private let apiService = GeminiAPIService()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages, id: \.0) { message, isUser in
                        HStack {
                            if isUser {
                                Spacer()
                                Text(message)
                                    .padding()
                                    .background(Color.blue.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            } else {
                                Text(message)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                Spacer()
                            }
                        }
                    }
                }
                .padding()
            }

            HStack {
                TextField("Type a message...", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Send") {
                    sendMessage()
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("Chatbot")
    }

    func sendMessage() {
        let message = userInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !message.isEmpty else { return }

        messages.append((message, true)) // Append user message
        userInput = ""

        apiService.sendMessage(message) { response in
            DispatchQueue.main.async {
                if let responseText = response {
                    messages.append((responseText, false)) // Append bot response
                } else {
                    messages.append(("Error: Could not fetch response", false))
                }
            }
        }
    }
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView()
    }
}
