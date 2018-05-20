//
//  Team.swift
//  LazyMan-iOS
//
//  Created by Nick Thompson on 2/21/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//

import UIKit

enum League: String
{
    case NHL, MLB
}

protocol Team
{
    var location: String { get }
    var shortName: String { get }
    var abbreviation: String { get }
    var logo: UIImage { get }
    var league: League { get }
    var isFavorite: Bool { get }
}

extension Team
{
    var fullName: String
    {
        return String(format: "%@ %@", self.location, self.shortName)
    }
}

struct NHLTeam: Team
{
    var location: String
    var shortName: String
    var abbreviation: String
    var logo: UIImage
    var league: League
    {
        return League.NHL
    }
    var isFavorite: Bool
    {
        let favorite = SettingsManager.shared.favoriteNHLTeam
        return favorite?.shortName == self.shortName
    }
}

struct MLBTeam: Team
{
    var location: String
    var shortName: String
    var abbreviation: String
    var logo: UIImage
    var league: League
    {
        return League.MLB
    }
    var isFavorite: Bool
    {
        let favorite = SettingsManager.shared.favoriteMLBTeam
        return favorite?.shortName == self.shortName
    }
}
