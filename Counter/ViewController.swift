//
//  ViewController.swift
//  Counter
//
//  Created by Анна Браун on 24.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateCounterLabel()
        textInfoCount.isEditable = false
    }

    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var buttonCount: UIButton!
    @IBOutlet weak var buttonMinusCount: UIButton!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var updateCount: UIButton!
    
    @IBOutlet weak var textInfoCount: UITextView!
    var counter = 0
    var history = "История изменений:\n"
    
    func updateCounterLabel() {
            count.text = "\(counter)"
        }
    
    @IBAction func updateCount(_ sender: Any) {
        counter = 0
        updateCounterLabel()
        updateHistory(message: "значение сброшено")
    }
    @IBAction func incrementButton(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        updateHistory(message: "значение изменено на +1")
    }
    
    @IBAction func decrementButton(_ sender: Any) {
        if counter == 0 {
            counter = 0
            updateHistory(message: "попытка уменьшить значение счетчика ниже 0")
        } else {
            counter -= 1
            updateCounterLabel()
            updateHistory(message: "значение изменено на -1")
        }
    }
    func updateHistory(message: String) {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let dateString = formatter.string(from: Date())
            history += "[\(dateString)]: \(message)\n"
            textInfoCount.text = history
        }
    
    
}

