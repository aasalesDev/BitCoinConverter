//
//  GenericService.swift
//  ByteCoin
//
//  Created by Anderson Sales on 16/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
