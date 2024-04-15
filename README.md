# songify

A new Flutter project.

## General Guidelines
- Clone the repo and run 'flutter pub get' followed by 'dart run build_runner build'
- The code follows clean architecture and SOLID principles, though solid principles are pretty verbose these days and was not entirely needed for this app.
- The architecture here is
-   - app (topmost layer - holds concrete implementation of repositories where third party dependencies are involved) [can access both features and core modules]
    - features (songs, search, auth) - the main features of the app (there was no need for a domain layer here) [can access the core module]
    - core (bottom most layer, the shared contents across the whole app. Mainly defines the contract and exposes a provider for features and app layer to use)
- Used 'firebase_auth' for authentication. The user is asked to login only if they choose to mark a song favourite.
- Used 'shared_preferences' to locally store the list of songs user has marked as favourites.
- Used 'riverpod' for state management, Bloc has a lot of boilerplate code and the builder/listner/consumer widgets are attached to the widget tree which can be too messy to handle in a bigger app
- The app supports both light and dark theme. The theme is updated based on the device's current theme. Toggle it in your phone's setting to test it in the app.
- 1 unit test and 1 widget test using 'mockito' and 'state_notifier_test'
- Used 'dart_mappable' instead of 'freezed' to generate models/entities/view states
