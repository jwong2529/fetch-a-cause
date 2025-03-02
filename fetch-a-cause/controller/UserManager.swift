//
//  UserManager.swift
//  fetch-a-cause
//
//  Created by Janice Wong on 3/2/25.
//

import SwiftUI
import Firebase

class UserManager: ObservableObject {
    // You can change this to any other static ID or identifier if needed.
    private let defaultUserID = "defaultUser"
    
    func initializeUser() {
        let databaseRef = Database.database().reference()
        
        // Reference to the "users" node in the database
        let userRef = databaseRef.child("users").child(defaultUserID)
        
        // Check if the user node already exists
        userRef.observeSingleEvent(of: .value) { snapshot in
            if !snapshot.exists() {
                // User does not exist, create a new user node
                print("Creating default user node.")
                
                let newUser = [
                    "volunteeringOpportunities": [] // Empty array to track opportunities
                ]
                
                // Set the default user data in the database
                userRef.setValue(newUser) { error, _ in
                    if let error = error {
                        print("Error creating user: \(error.localizedDescription)")
                    } else {
                        print("Default user created successfully.")
                    }
                }
            } else {
                // User already exists, do nothing
                print("Default user already exists.")
            }
        }
    }
}
