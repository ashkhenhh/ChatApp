//
//  CompletionTypeAlias.swift
//  Chat App
//
//  Created by Ashkhen on 7/7/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import UIKit

public typealias CompletionValue<T> = (_ response: T?) -> Void
public typealias CompletionValues<T> = (_ response: [T]) -> Void
public typealias CompletionBlock = (_ response: Bool) -> Void
