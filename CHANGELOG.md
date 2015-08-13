## v0.2.2 (13/08/15)

Updating to the latest Swift in Xcode 7b5

* changing appending path using path utilities
* UIGraphicsGetCurrentContext() returns optional context

## v0.2.1 (23/07/15)

Using ResultType's flatMap (2 hrs)

* using flatMap influenced by Brian Gesiak's talk "compelling code"

## v0.2 (28/06/15)

Complete rewrite with Swift 2.0 (15 - 20 hrs)

* reimplementing all features in swift
* using guards for early exit pattern
* using Results for async error handling
* introducing cocoapods in the project
* SwiftyJSON for JSON parsing
* adding UI tests for iOS 9


## v0.1.1 (11/04/14)

Finishing implementation details (10 hrs)

* searches artists and view artists' detail
* shows similar artists and upcoming events
* displays upcoming event in map view with calendar as thumbnail, so fans can 'stalk' their fave bands/artist while on tour
* has test suites for models (gig and artists)
* has simple web service wrapper for songkick's API
* uses 3rd party map annotation to sped up the development process
* handles cases when searched returning empty results
* tested in both 3.5 and 4 screens

## v0.1 (11/04/2014)

Initial version (2 hrs)

* created artist model with its test, checking whether the properties were correct
* I used TDD for making the model
* I made a view template for the table view, so but still static
* Made a custom cell with the outlets
* Because of my personal preference, I usually make a simple icon (grabbed from the noun project) and images that necessary (made the tour badge)
* Haven't touch any controller's code yet
