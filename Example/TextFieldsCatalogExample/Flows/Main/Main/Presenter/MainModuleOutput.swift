//
//  MainModuleOutput.swift
//  TextFieldsCatalog
//
//  Created by Alexander Chausov on 23/01/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

protocol MainModuleOutput: class {
    var onFieldOpen: TextFieldTypeClosure? { get set }
    var onInfoOpen: EmptyClosure? { get set }
}
