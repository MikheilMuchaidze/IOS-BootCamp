//
//  CountriesListInteractor.swift
//  Muchaidze_Lecture_28
//
//  Created by Misha Muchaidze on 20220831...
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CountriesListBusinessLogic
{
  func doSomething(request: CountriesList.Something.Request)
}

protocol CountriesListDataStore
{
  //var name: String { get set }
}

class CountriesListInteractor: CountriesListBusinessLogic, CountriesListDataStore
{
  var presenter: CountriesListPresentationLogic?
  var worker: CountriesListWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CountriesList.Something.Request)
  {
    worker = CountriesListWorker()
    worker?.doSomeWork()
    
    let response = CountriesList.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
