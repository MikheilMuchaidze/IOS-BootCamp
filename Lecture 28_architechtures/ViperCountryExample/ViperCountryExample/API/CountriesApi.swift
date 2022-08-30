//
//  CountriesApi.swift
//  Countries_VIPER
//
//  Created by Vasili Baramidze on 28.08.22.
//  Copyright © 2022 Vasili Baramidze. All rights reserved.
//

import Foundation

struct CountriesApi {

    func getCountries(onSuccess: @escaping ([Country]) -> Void, onError: @escaping (Error) -> Void) {
        DataFetcher.shared.fetch(with: CountryUrlBuilder.shared.urlString, as: [Country].self) { data in
            onSuccess(data)
        } onError: { error in
            onError(error)
        }
    }
}
