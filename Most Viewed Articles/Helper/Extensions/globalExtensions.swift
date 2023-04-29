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
extension String {
    func toDate() -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let date = dateFormatterGet.date(from: self) {
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "yyyy-MM-dd"
            return dateFormatterPrint.string(from: date)
        } else {
            return nil
        }
    }
}
