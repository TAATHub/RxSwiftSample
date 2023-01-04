//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 董 亜飛 on 2023/01/04.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.frame = CGRect(x: (self.view.bounds.width - 200)/2, y: 100, width: 200, height: 40)
        label.text = "placeholder..."
        label.textColor = .black
        self.view.addSubview(label)
        
        let textField = UITextField()
        textField.frame = CGRect(x: (self.view.bounds.width - 200)/2, y: 160, width: 200, height: 40)
        textField.borderStyle = .line
        textField.textColor = .black
        self.view.addSubview(textField)
        
        let text = textField.rx.text
        text.map{ text -> String? in
          guard let text = text else { return nil }
          return "入力：\(text)"
        }
        .subscribe(onNext: { text in
            label.text = text
        }, onError: { _ in
            print("error")
        }, onCompleted: {
            print("completed")
        })
        .disposed(by: disposeBag)
    }
}

