//
//  globalExtensions.swift
//  Most Viewed Articles
//
//  Created by Moustafa on 29/04/2023.
//

import Foundation
import UIKit

extension UIImageView {
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.width, self.frame.height) / 2
        self.clipsToBounds = true
    }
}
