//
//  CustomDateFomatter.swift
//  MyMemo
//
//  Created by Satomi Hanai on 2019/07/15.
//  Copyright © 2019 Satomi Hanai. All rights reserved.
//

import UIKit

class CustomDateFomatter:NSObject {
    func getDateString(date:Date)  -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh"
        let dateString = df.string(from: date)
        return dateString
    }
}
