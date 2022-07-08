//
//  ViewModel.swift
//  SampleMVVM
//
//  Created by mtanaka on 2022/07/08.
//

import Foundation
import RxSwift
import RxCocoa

final class ViewModel {
    
    typealias Input = (
        idDriver: Driver<String>,
        passDriver: Driver<String>,
        confirmDriver: Driver<String>
    )
    // バリデーション結果
    let validationResult: Driver<ValidationResult>
    // 空欄がないかのバリデーション
    let blankValidation: Driver<Bool>
    // パスワードが確認用と一致しているかのバリデーション
    let confirmValidation: Driver<Bool>
    
    init(input: Input) {
        
        let validationModel = ValidationModel()
        // combineLatest 合成してストリームに流す
        blankValidation = Driver.combineLatest(
            input.idDriver,
            input.passDriver,
            input.confirmDriver
        ) { id, pass, confirm in
            return validationModel.blankValidation(text: [id, pass, confirm])
        }
        
        confirmValidation = Driver.combineLatest(
            input.passDriver,
            input.confirmDriver
        ) { pass, confirm in
            return validationModel.confirmValidation(pass: pass, confirm: confirm)
        }
        
        validationResult = Driver.combineLatest(
            blankValidation,
            confirmValidation
        ) { blankValidation, confirmValidation in
            if !blankValidation {
                return .blankError
            } else if !confirmValidation {
                return .confirmError
            } else {
                return .ok
            }
        }
    }
}
