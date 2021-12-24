//
//  ViewController.swift
//  test4
//
//  Created by Ruslan Sharshenov on 23.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var textField = UITextView()
    private var button1 = UIButton()
    private var totalLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        view.addSubview(textField)
        textField.backgroundColor = .red
        textField.textAlignment = .left
        textField.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(250)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
       
        view.addSubview(button1)
        button1.setTitle("Посчитать", for: .normal)
        button1.backgroundColor = .darkGray
        button1.addTarget(nil, action: #selector(resultButton(sender:)), for: .touchUpInside)
        button1.snp.makeConstraints{make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        view.addSubview(totalLabel)
        totalLabel.backgroundColor = .yellow
        totalLabel.adjustsFontSizeToFitWidth = true
        totalLabel.numberOfLines = 3
        totalLabel.snp.makeConstraints{make in
            make.top.equalTo(button1.snp.bottom).offset(30)
            make.height.equalTo(100)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
    }
    

    @objc func resultButton(sender: UIButton){
        if textField.text != nil && textField.text != "" {
            totalLabel.text = "Количество слов: \(textField.text!.numberOfWords) \n Количество символов: \(textField.text!.count) \n Количество пробелов в тексте: \(textField.text!.numberOfWords - 1 )"
        }else{
            totalLabel.text = "Введите текст в поле выше"
        }
    }
}

extension String {
    var numberOfWords: Int {
        var count = 0
        let range = startIndex..<endIndex
        enumerateSubstrings(in: range, options: [.byWords, .substringNotRequired, .localized], { _, _, _, _ -> () in
            count += 1
        })
        return count
    }
}

