//
//  MirrorableValues.swift
//  EqualableGeneric
//
//  Created by Alex Pinhasov on 17/12/2018.
//

import Foundation

public protocol EqualableGenericProtocol : MirrorableValues,Equatable
{
    func isEqual(toObject objectToCompare: MirrorableValues) -> Bool
}

extension EqualableGenericProtocol where Self:MirrorableValues
{
    public func isEqual(toObject objectToCompare: MirrorableValues) -> Bool
    {
        let selfObjectProperties      = self.mirrorableValues()
        let objectToCompareProperties = objectToCompare.mirrorableValues()
        
        for (index,_) in selfObjectProperties.enumerated()
        {
            if String(describing: selfObjectProperties[index]) != String(describing: objectToCompareProperties[index])
            {
                return false
            }
        }
        return true
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool
    {
        return lhs.isEqual(toObject: rhs)
    }
}

extension NSObject: EqualableGenericProtocol
{
    static func == (lhs: NSObject, rhs: NSObject) -> Bool
    {
        return lhs.isEqual(toObject: rhs)
    }
}


