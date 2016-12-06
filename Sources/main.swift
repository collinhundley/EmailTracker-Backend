//
//  main.swift
//  Email Tracker
//
//  Created by Collin Hundley on 12/5/16.
//
//

import Kitura


// MARK: Router
let router = Router()


// MARK: Routes
let pixelController = TrackerController(router: router)


// MARK: Start server
Kitura.addHTTPServer(onPort: 8095, with: router)
Kitura.run()
