//
//  JSON+Required.swift
//  Pods
//
//  Created by Colton Nohelty on 6/8/17.
//
//

import SwiftyJSON

//MARK: - Errors
private let SwiftyExtensionErrorDomain = "Swifty"
private let SwiftyExtensionErrorRequired = 400

//MARK: - Throwable Accessors for Required Properties
internal extension JSON {
    
    func requiredString() throws -> String {
        guard let value = self.string, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "String is missing or null"])
        }
        
        return value
    }
    
    func requiredBool() throws -> Bool {
        guard let value = self.bool, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Bool is missing or null"])
        }
        
        return value
    }
    
    func requiredInt() throws -> Int {
        guard let value = self.int, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Int is missing or null"])
        }
        
        return value
    }
    
    func requiredDouble() throws -> Double {
        guard let value = self.double, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Double is missing or null"])
        }
        
        return value
    }
    
    func requiredUInt() throws -> UInt {
        guard let value = self.uInt, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "UInt is missing or null"])
        }
        
        return value
    }
    
    func requiredUInt64() throws -> UInt64 {
        guard let value = self.uInt64, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "UInt64 is missing or null"])
        }
        
        return value
    }
    
    func requiredFloat() throws -> Float {
        guard let value = self.float, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Float is missing or null"])
        }
        
        return value
    }
    
    func requiredArray() throws -> [JSON] {
        guard let value = self.array, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Array is missing or null"])
        }
        
        return value
    }
    
    func requiredDictionary() throws -> JSON {
        guard let _ = self.dictionary, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Dictionary is missing or null"])
        }
        
        return self
    }
    
    func requiredURL() throws -> URL {
        guard let value = self.url, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "URL is missing or null"])
        }
        
        return value
    }
}
