//
//  EventViewModel.swift
//  ColumbiaMosaic
//
//  Created by Lucia Perez-Saignac on 12/17/23.
//


import Foundation


class EventViewModel: ObservableObject {
    @Published var events: [Event] = []

    func fetchEvents() {
        guard let url = URL(string: "http://127.0.0.1:5000/get-events") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedEvents = try JSONDecoder().decode([Event].self, from: data)
                    DispatchQueue.main.async {
                        self.events = decodedEvents
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("HTTP Request Failed: \(error)")
            }
        }.resume()
    }
}


