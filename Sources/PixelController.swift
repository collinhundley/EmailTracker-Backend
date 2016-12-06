//
//  TrackerController.swift
//  EmailTracker
//
//  Created by Collin Hundley on 12/5/16.
//
//

import Foundation
import Kitura


class TrackerController {
    
    /// Transparent 1x1 pixel
    private let pixel = Data(bytes: [
        71, 73, 70, 56, 57, 97, 1, 0,
        1, 0, 240, 0, 0, 255, 255, 255,
        0, 0, 0, 33, 249, 4, 0, 0, 0,
        0, 0, 44, 0, 0, 0, 0, 1, 0, 1,
        0, 2, 2, 68, 1, 0, 59
    ])
    
    private var router: Router
    
    init(router: Router) {
        self.router = router
        setupRoutes()
    }
    
    /// Sets up all HTTP routes for the controller.
    private func setupRoutes() {
        
        /// GET an email tracking pixel.
        router.get("/px") { (request, response, next) in
            let ip = request.remoteAddress
            if let id = request.queryParameters["id"] {
                self.logOpen(id: id, ip: ip, date: Date())
            }
            response.headers.setType("image/gif")
            try response.send(data: self.pixel).end()
        }
        
    }

}


fileprivate extension TrackerController {
    
    func logOpen(id: String, ip: String, date: Date) {
        
        print("EMAIL OPENED\nID: \(id)\nIP: \(ip)\nDate: \(date.timeIntervalSince1970)")
        
    }
    
}


