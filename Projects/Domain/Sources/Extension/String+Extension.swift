//
//  String+Extension.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Foundation

extension String {
    public func parseToHourMinute() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DomainConfiguration.dateFormatDefault
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = DomainConfiguration.dateFormatHourMinute
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    public func parseToDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DomainConfiguration.dateFormatDefault
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        dateFormatter.dateFormat = DomainConfiguration.dateFormatEraHourMinut
        let formattedString = dateFormatter.string(from: date)
        return formattedString
    }
}
