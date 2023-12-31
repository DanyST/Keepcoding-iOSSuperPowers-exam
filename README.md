#  KeepCoding FullStack Mobile Bootcamp iOS Super Powers Exam

## Description
The objective of this practice is to implement an IOS iPhone mobile application that is capable of consuming a Marvel web service and displaying the information.

### Requirements
For the development of the application, the following technologies should be used within an MVVM architecture:
- SwiftUI
- Combine

The application will consist of a list of heroes, where a list with the photo and name will be displayed. When tapping on a hero, the detail view will show the series in which the hero appears, along with a photo of the series, the title, and a description.

Testing needs to be added to the App's code and a minimum code coverage of 50% should be achieved.

## Architecture Solution
- Clean architecture
  - Data Layer
    - DTO Models mappers to Domain
    - Network with endpoint connection.
    - Repository
  - Domain Layer
    - UseCases
    - Models
  - Presentation Layer 
    - ViewModels
    - Views

Layer-to-layer connection with protocols and Combine.

## Features Solution
- HeroList
- HeroDetail
- SerieDetail

## Preview
![App preview](ReadmeResources/DemoPreview.gif)


# Installation

To run the project, you need to obtain the authorization data from the [Marvel API](https://developer.marvel.com/documentation/authorization). These are **hash**, **apikey**, and **ts**.

Once you obtain these data, add them to the **ApiConfig** file in the project.

<img width="350" src="ReadmeResources/ApiConfigDemo.png">

For convenience, you can search for it with keyboard shortcut **CMD + Shift + O**.

#### Great! You can now run the project and test the application :)