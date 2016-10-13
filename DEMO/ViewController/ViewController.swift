//
//  ViewController.swift
//  VisualHumainNumber
//
//  Created by Norbert Billa on 13/10/2016.
//  Copyright © 2016 norbert-billa. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet private var label1: UILabel!
    @IBOutlet private var label2: UILabel!
    @IBOutlet private var label3: UILabel!
    @IBOutlet private var label4: UILabel!
    @IBOutlet private var label5: UILabel!
    @IBOutlet private var label6: UILabel!
    @IBOutlet private var label7: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.label1.text = VisualHumainNumber(long: 1000000).getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain)
        self.label2.text = VisualHumainNumber(string: "8 540").getVisualHumainNumbers(notation: VisualHumainNumberNotation.simpleHumain)
        self.label3.text = VisualHumainNumber(string: "123456789").getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa)
        self.label4.text = VisualHumainNumber(double: 912354523.55).getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComaRounded)
        self.label5.text = VisualHumainNumber(double: 912354523.55).getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithComa)
        self.label6.text = VisualHumainNumber(double: 912354523.55).getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpace)
        self.label7.text = VisualHumainNumber(double: 912354523.55).getVisualHumainNumbers(notation: VisualHumainNumberNotation.separatorHundredWithSpaceRounded)
    }

  

}
