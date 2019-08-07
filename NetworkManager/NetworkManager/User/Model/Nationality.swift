//
//  Nationality.swift
//  NetworkManager
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

public enum Nationality: String {
    
    case australia = "AU"
    case brazil = "BR"
    case canada = "CA"
    case china = "CH"
    case germany = "DE"
    case denmark = "DK"
    case spain = "ES"
    case finland = "FI"
    case france = "FR"
    case uk = "GB"
    case ireland = "IE"
    case iran = "IR"
    case norway = "NO"
    case netherland = "NL"
    case newZeland = "NZ"
    case turkey = "TR"
    case unitedStates = "US"
    
    var asFlag: String {
        switch self {
        case .australia:
            return "🇦🇺"
        case .brazil:
            return "🇧🇷"
        case .canada:
            return "🇨🇦"
        case .china:
            return "🇨🇳"
        case .germany:
            return "🇩🇪"
        case .denmark:
            return "🇩🇰"
        case .spain:
            return "🇪🇸"
        case .finland:
            return "🇫🇮"
        case .france:
            return "🇫🇷"
        case .uk:
            return "🇬🇧"
        case .ireland:
            return "🇮🇪"
        case .iran:
            return "🇮🇷"
        case .norway:
            return "🇳🇴"
        case .netherland:
            return "🇳🇱"
        case .newZeland:
            return "🇳🇿"
        case .turkey:
            return "🇹🇷"
        case .unitedStates:
            return "🇺🇸"
        }
    }
    
    var asName: String {
        switch self {
        case .australia:
            return "Australia"
        case .brazil:
            return "Brasile"
        case .canada:
            return "Canada"
        case .china:
            return "Cina"
        case .germany:
            return "Germaina"
        case .denmark:
            return "Danimarca"
        case .spain:
            return "Spagna"
        case .finland:
            return "Finlandia"
        case .france:
            return "Francia"
        case .uk:
            return "Regno Unito"
        case .ireland:
            return "Irlanda"
        case .iran:
            return "Iran"
        case .norway:
            return "Norvegia"
        case .netherland:
            return "Paesi Bassi"
        case .newZeland:
            return "Nuova Zelanda"
        case .turkey:
            return "Turchia"
        case .unitedStates:
            return "Stati Uniti"
        }
    }
    
}
