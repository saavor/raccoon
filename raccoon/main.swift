//
//  main.swift
//  raccoon
//
//  Created by Joseph Malone on 12/26/19.
//  Copyright © 2019 Joseph Malone. All rights reserved.
//

import Foundation
var version = "0.0.1"
var args = CommandLine.arguments

/*
 print("hello")
*/
/*
 emoji codes:
 📕 error
 📙 warning
 */

// Error
class Error {
    var errorName = ""
    var errorType = ""
    var errorBio = ""
    var locationStart = ""
    var locationEnd = ""
    init(errorName:String, errorType:String? = "error", errorBio:String? = "", locationStart:String? = "", locationEnd:String? = "") {
        self.errorName = errorName
        self.errorType = errorType ?? "error"
        self.errorBio = errorBio ?? ""
        self.locationStart = locationStart ?? ""
        self.locationEnd = locationEnd ?? ""
    }
    func repr() -> String{
        var output = ""
        if(self.errorType == "error") {output = "📕 Error: "} else if(self.errorType == "warning") {output = "📙 Warning: "} else {unknownErrorType();return ""}
        output += self.errorName + ", "
        if(self.locationStart != "") {output += self.locationStart + ", "}
        if(self.locationEnd != "") {output += self.locationEnd + ", "}
        if(self.errorBio != "") {output += self.errorBio + ""}
        return output
    }
    func unknownErrorType() {
        let output = Error(errorName: "Unknown error type", errorType: "error", errorBio: "Unknown error type '" + self.errorType + "'.", locationStart: "main.swift").repr()
        print(output)
    }
}

// Tokens
var T_INT = "INT"
var T_FLOAT = "FLOAT"
var T_PLUS = "PLUS"
var T_MINUS = "MINUS"
var T_MUL = "MUL"
var T_DIV = "DIV"

class Token {
    var type = ""
    var value = ""
    init(type:String, value:String? = nil) {
        self.type = type
        self.value = value ?? ""
    }
    func out() -> [String] {
        return [self.type, self.value]
    }
    func repr() -> String {
        if(self.value != "") {
            return self.type + ":" + self.value
        } else {
            return self.type
        }
    }
}

// Lexer
class Lexer {
    init(input:String) {
        
    }
}

// Shell
func shell() {
    var command = ""
    var shellLineNumber = 0
    print("Welcome to raccoon version " + version)
    while true {
        shellLineNumber+=1
        // Input
        print(String(shellLineNumber) + "> ", terminator: "")
        command = readLine() ?? ""
        // Check for shell commands
        if(command == ":quit" || command == ":q") {break}
        if(command != ""){print(command)}
    }
}

// Run Shell
if(args.indices.contains(1)) {
    let output = Error(errorName: "Unknown file", errorType: "error", errorBio: "There is no file named '" + args[1] + "' in that location.", locationStart: "shellInput")
    print(output.repr())
} else {
    shell()
}
