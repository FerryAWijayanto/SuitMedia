//
//  GuestStore.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import UIKit

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum GuestError: Error {
    case guestImageCreationError
}

enum GuestResult {
    case success([Guest])
    case failure(RegresError)
}

class GuestStore {
    
    private let baseURL = "https://reqres.in/api/users?page=1&per_page=10"
    let imageStore = ImageStore()
    
    private let sessions: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchGuest(parameter: [String: String]?, completion: @escaping (GuestResult) -> Void) {
        let url = RegresAPI.regresAPI(parameter)
        let request = URLRequest(url: url)
        let task = sessions.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.invalidGuest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else { return }
            
            let result = self.parseJSON(data: data)
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }
    
    func fetchImage(for guest: Guest, completion: @escaping (ImageResult) -> Void) {
        
        let guestKey = "\(guest.id)"
        
        if let image = imageStore.image(forKey: guestKey) {
            DispatchQueue.main.async {
                completion(.success(image))
            }
            return
        }
        
        guard let photoURL = URL(string: guest.avatar) else { return }
        let request = URLRequest(url: photoURL)
        let task = sessions.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            let result = self.processImageRequest(data: data, error: error)
            
            if case let .success(image) = result {
                self.imageStore.setImage(image, forKey: guestKey)
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processImageRequest(data: Data?, error: Error?) -> ImageResult {
        guard
            let imageData = data,
            let image = UIImage(data: imageData)
            else {
                if data == nil {
                    return .failure(error!)
                } else {
                    return .failure(GuestError.guestImageCreationError)
                }
        }
        return .success(image)
    }
    
    private func parseJSON(data: Data) -> GuestResult {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            var finalGuests = [Guest]()
            
            let json = try decoder.decode(GuestModel.self, from: data)
            guard
                let page = json.page,
                let perPage = json.perPage,
                let total = json.total,
                let totalPages = json.totalPages,
                let company = json.ad?.company,
                let url = json.ad?.url,
                let text = json.ad?.text
                else {
                    return .failure(.invalidJSONData)
            }
            
            json.data?.forEach({ guestData in
                guard let id = guestData.id,
                let email = guestData.email,
                let firstName = guestData.firstName,
                let lastName = guestData.lastName,
                let avatar = guestData.avatar else {
                    return
                }
                
                let guest = Guest(page: page, perPage: perPage, total: total, totalPages: totalPages, company: company, url: url, text: text, id: id, email: email, firstName: firstName, lastName: lastName, avatar: avatar)
                finalGuests.append(guest)
            })
            
            return .success(finalGuests)
        } catch {
            return .failure(.invalidJSONData)
        }
        
    }
}
