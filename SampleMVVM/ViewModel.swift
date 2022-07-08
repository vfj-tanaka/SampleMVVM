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
}
