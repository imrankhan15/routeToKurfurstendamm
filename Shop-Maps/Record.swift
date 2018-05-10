//
//  Record.swift
//  Shop-Maps
//
//  Created by Muhammad Faisal Imran Khan on 17/4/18.
//  Copyright © 2018 MI Apps. All rights reserved.
//

import UIKit
import os.log

class Record: NSObject, NSCoding {
    
    var question: String
    var answer: String
    
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("records")
    
    //MARK: Types
    
    struct PropertyKey {
        static let question = "question"
        static let answer = "answer"
       
        
    }
    
    //MARK: Initialization
    
    init?( question: String, answer: String) {
        
        
        guard !question.isEmpty else {
            return nil
        }
        guard !answer.isEmpty else {
            return nil
        }
        
        
        // Initialize stored properties.
        self.question = question
        self.answer = answer
       
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(question, forKey: PropertyKey.question)
        aCoder.encode(answer, forKey: PropertyKey.answer)
       
        
    }

    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let question = aDecoder.decodeObject(forKey: PropertyKey.question) as? String else {
            os_log("Unable to decode the question for a record object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let answer = aDecoder.decodeObject(forKey: PropertyKey.answer) as? String else {
            os_log("Unable to decode the answer for a record object.", log: OSLog.default, type: .debug)
            return nil
        }
        
         
        // Must call designated initializer.
        self.init(question: question, answer: answer)
        
    }



}
