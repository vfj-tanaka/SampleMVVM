//
//  Alert.swift
//  SampleMVVM
//
//  Created by mtanaka on 2022/07/08.
//

import UIKit

final class Alert {
    // 自動で消えるアラート
    static func autoCloseAlert(vc: UIViewController, title: String, message: String) {
        let autoCloseAlertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.present(autoCloseAlertVC, animated: true) {
            // 2秒後に消える
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                autoCloseAlertVC.dismiss(animated: true, completion: nil)
            }
        }
    }
}
