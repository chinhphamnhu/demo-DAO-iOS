//
//  DAO.swift
//  TheDAO
//
//  Created by Chinh Pham N. on 7/2/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import Foundation
import UIKit

protocol DAO { }

extension NSObject: DAO { }

extension DAO where Self: NSObject {

    typealias MultipleClosure = (Self) -> Void

    init(_ closures: MultipleClosure...) {
        self.init()
        closures.forEach { $0(self) }
    }
}

extension DAO where Self: UIButton {
    init(type: UIButton.ButtonType, closure: (Self) -> Void) {
        guard let self = UIButton(type: type) as? Self else { fatalError() }
        closure(self)
        self.init()
    }
}
