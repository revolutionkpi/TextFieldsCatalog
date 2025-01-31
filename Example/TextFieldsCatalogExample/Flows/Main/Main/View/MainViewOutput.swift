//
//  MainViewOutput.swift
//  TextFieldsCatalog
//
//  Created by Alexander Chausov on 23/01/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

protocol MainViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()

    /// Notify presenter that user wants to see some field
    func openField(with type: TextFieldType)

    /// Notify presenter that user wants to see info about this app
    func openInfo()
}
