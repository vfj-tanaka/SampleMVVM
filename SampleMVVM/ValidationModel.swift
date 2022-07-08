//
//  ValidationModel.swift
//  SampleMVVM
//
//  Created by mtanaka on 2022/07/08.
//

import Foundation
import UIKit

enum ValidationResult {
    
    case ok
    case blankError
    case confirmError
    
    var isValidated: Bool {
        
        switch self {
        case .ok: return true
        case .blankError, .confirmError: return false
        }
    }
    
    var text: String {
        
        switch self {
        case .ok: return "登録可能です。"
        case .blankError: return "空欄があります。"
        case .confirmError: return "パスワードが確認用と一致しません。"
        }
    }
    
    var color: UIColor {
        
        switch self {
        case .ok: return .green
        case .blankError, .confirmError: return .red
        }
    }
    
    
}
