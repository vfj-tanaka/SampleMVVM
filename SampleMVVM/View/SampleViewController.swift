//
//  SampleViewController.swift
//  SampleMVVM
//
//  Created by mtanaka on 2022/07/05.
//

import UIKit
import RxSwift
import RxCocoa

final class SampleViewController: UIViewController {
    
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet private weak var passTextField: UITextField!
    @IBOutlet private weak var confirmTextField: UITextField!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var registerButton: UIButton!
    
    private var viewModel: ViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindInputStream()
    }
    
    private func bindInputStream() {
        
        self.viewModel = ViewModel(
            input: (
                idTextField.rx.text.orEmpty.asDriver(),
                passTextField.rx.text.orEmpty.asDriver(),
                confirmTextField.rx.text.orEmpty.asDriver()
            )
        )
        
        viewModel.validationResult.drive(onNext: { Validationresult in
            
            self.registerButton.isEnabled = Validationresult.isValidated
            self.statusLabel.text = Validationresult.text
            self.statusLabel.textColor = Validationresult.color
        }).disposed(by: disposeBag)
    }
    
    @IBAction private func tappedRegisterButton(_ sender: Any) {
        
        Alert.autoCloseAlert(vc: self, title: "登録", message: "")
    }
}
