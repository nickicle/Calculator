//
//  ViewController.swift
//  Calculator
//
//  Created by Nick Johnson on 8/22/17.
//  Copyright © 2017 Nick Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum MathType: Int {
        case none = 0
        case add
        case minus
        case multiply
        case divide
    }
    
    var totalValue: Double = 0
    var changed = false
    let nf = NumberFormatter()
    
    var store: (Double, Double) = (0, 0)
    
    
    var math : MathType = .none
    @IBAction func Clear(_ sender: Any)
    {
        label.text = "0"
        store = (0, 0)
    }

    @IBOutlet weak var label: UITextField!
    
    @IBAction func addition(_ sender: Any)
    {
        changed = true
        if let text = label.text {
            store = (Double(text)!, 0)
        }
        label.text = "0"
        math = .add
    }
    
    @IBAction func multiply(_ sender: Any)
    {
        changed = true
        
        if let text = label.text {
            store = (Double(text)!, 0)
        }
        label.text = "0"
        math = .multiply
    }
    
    @IBAction func divide(_ sender: Any)
    {
        changed = true
        if let text = label.text {
            let number = nf.number(from: text)
            store = (Double(number!), 0)
        }
        label.text = "0"
        math = .divide
    }
    
    @IBAction func minus(_ sender: Any)
    {
        changed = true

        if let text = label.text {
            store = (Double(text)!, 0)
        }
        label.text = "0"
        math = .minus
    }
    
    @IBAction func Dot(_ sender: Any)
    {
        if let text = label.text {
            if (text.contains(".")){
                label.text = text
            } else {
                label.text = text + "."
            }
        }
    }
    
    @IBAction func total(_ sender: Any)
    {
        if let text = label.text {
            if changed == true {
                store = (store.0, Double(nf.number(from: text)!))
                changed = false
            }
        }
        
        switch math {
        case .add:
            totalValue = store.0 + store.1
            store.0 = totalValue
            break
        case .divide:
            totalValue = store.0 / store.1
            store.0 = totalValue
            break
        case .multiply:
            totalValue = store.0 * store.1
            store.0 = totalValue
            break
        case .minus:
            totalValue = store.0 + -store.1
            store.0 = totalValue
            break
        default:
            if let text = label.text {
                totalValue = Double(text)!
            } else {
                totalValue = 0
            }
            break
        
            }
        nf.numberStyle = .decimal
        label.text = nf.string(for: totalValue)
        
    }
    
    @IBAction func Numbers(_ sender: UIButton)
    {
        if let text = label.text {
            if text == "0" {
                label.text = ""
            }
        }
    label.text = label.text! + String(sender.tag-1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

