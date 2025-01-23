//
//  String+Helpers.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/23/25.
//

import Foundation

extension String {
    func formattedDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat.responseFormat

        guard let date = dateFormatter.date(from: self)
        else {
            return nil
        }
        
        dateFormatter.dateFormat = Constants.DateFormat.productionYearFormat
        return dateFormatter.string(from: date)
    }
}
