//
//  String+Extension.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Foundation

extension String {
    func formatDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else { return self }
        dateFormatter.dateFormat = "MM월 dd일 HH시"
        return dateFormatter.string(from: date)
    }
}
