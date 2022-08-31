//
//  Alerts.swift
//  Takoe
//
//  Created by Andy on 27.03.2022.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    var title : Text
    var massage: Text
    var buttonTitle: Text
}

struct AlertContext{
    static let humanWin    = AlertItem(title: Text("You Win!!!"),
                             massage: Text("You are so smart"),
                             buttonTitle: Text("Hell yea"))
    static let computerWin = AlertItem(title: Text("You Lost"),
                             massage: Text("You programed super AI"),
                             buttonTitle: Text("Fuck you"))
    static let draw        = AlertItem(title: Text("Draw"),
                             massage: Text("Super Battle"),
                             buttonTitle: Text("Try again"))
}
