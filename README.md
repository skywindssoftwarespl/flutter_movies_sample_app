### Prerequisites

- Flutter SDK (version 2.0.0 or higher)
- Dart SDK (version 2.12.0 or higher)
- An IDE (e.g., Android Studio, Visual Studio Code)


## Plugins Used

1. **flutter_bloc**: ^8.1.6
   - State management library that helps in building applications using the BLoC (Business Logic Component) pattern.

2. **auto_route**: ^9.2.2
   - A powerful routing package for Flutter that provides declarative routing and nested navigation.

3. **google_fonts**: ^6.2.1
   - A package that allows you to use Google Fonts in your Flutter application.

4. **fluttertoast**: ^8.2.8
   - A Flutter plugin for displaying toast messages on the screen.

5. **cached_network_image**: ^3.4.1
   - A widget that displays images from the internet and caches them for better performance.

6. **flutter_spinkit**: ^5.2.1
   - A collection of loading indicators for Flutter applications.

7. **equatable**: ^2.0.5
   - A package that helps to make classes comparable by overriding `==` and `hashCode`.

8. **connectivity_plus**: ^6.0.5
   - A Flutter plugin that allows you to check the network connectivity status.

9. **easy_localization**: ^3.0.7
   - A localization package that makes it easy to add multi-language support in your Flutter application.

10. **http**: ^1.2.2
    - A package for making HTTP requests.

11. **shared_preferences**: ^2.3.2
    - A Flutter plugin for persisting simple data on the device.


    

## Design Considerations

- BLoC Architecture: The app uses the BLoC (Business Logic Component) pattern for state management, which separates business logic from UI code. This enhances maintainability and testability.
- Responsive UI: The design is responsive, ensuring that the application looks good on both small and large screens.
- User Experience: A user-friendly interface is prioritized, with clear search instructions and responsive feedback during loading states.
- State Handling: The app efficiently handles various states (initial, loading, loaded, error) to provide users with a smooth experience
