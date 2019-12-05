//
//  MirrorableValues.swift
//  EqualableGeneric
//
//  Created by Alex Pinhasov on 17/12/2018.
//

import Foundation

public protocol MirrorableValues {
    func mirrorableValues() -> [Any]
}

extension MirrorableValues  {
    public func mirrorableValues() -> [Any]
    {
        return Mirror(reflecting: self).children.compactMap { $0.value }
    }
}
