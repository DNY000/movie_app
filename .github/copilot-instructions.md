# AI Coding Agent Instructions

This document provides essential context for AI agents working in the LoadMore Flutter application codebase.

## Architecture Overview

The application follows a clean architecture pattern with clear separation of concerns:

- `lib/presentation/`: UI layer with pages, widgets and BLoC state management
- `lib/domain/`: Business logic and entities
- `lib/data/`: Data access and repository implementations
- `lib/core/`: Shared utilities, network client, and base classes

### Key Design Patterns

1. **Network Communication**
   - Centralized HTTP client in `lib/core/network/api_client.dart`
   - Type-safe requests with generic response parsing
   - Consistent error handling for network/server errors
   - Example usage:
     ```dart
     final response = await apiClient.get<UserModel>(
       url: endpoint,
       fromJson: UserModel.fromJson,
       itemsKey: 'data'
     );
     ```

2. **Localization**
   - Uses `easy_localization` package
   - Translation files in `assets/translations/{en,vi}.json`
   - Always use translation keys instead of hardcoded strings

3. **Responsive Design**
   - Uses `flutter_screenutil` for adaptive sizing
   - Base design size: 390x844 (iPhone 13)
   - Scale text and UI elements using `.sp` and `.w`/`.h` extensions

## Development Workflow

1. **Environment Setup**
   - Flutter SDK ^3.7.2
   - Run `flutter pub get` to install dependencies
   - Assets must be declared in `pubspec.yaml`

2. **Adding New Features**
   - Follow the existing layer separation pattern
   - Place new components in appropriate directories:
     - UI components → `lib/presentation/widgets/`
     - API models → `lib/data/models/`
     - Business logic → `lib/domain/`

3. **Asset Management**
   - SVG icons in `assets/icons/`
   - Images in `assets/images/`
   - Use the predefined asset paths and SVG widgets

## Testing and Quality Standards

1. **Error Handling**
   - Wrap API calls in try-catch blocks using `ApiClient._handleApiError`
   - Use custom exceptions from `core/error/exceptions.dart`
   - Present user-friendly error messages through UI

2. **State Management**
   - Use BLoC pattern for complex state
   - Keep presentation logic in BLoC classes
   - Handle loading, error, and success states explicitly

## Common Pitfalls

1. **Network Client Usage**
   - Always provide `fromJson` parameter for type-safe parsing
   - Use `itemsKey` when API response wraps data in a field
   - Handle expected status codes (201 for POST, etc.)

2. **Responsive UI**
   - Don't use raw pixel values - always use ScreenUtil extensions
   - Test layouts on different screen sizes

## Integration Points

1. **External Services**
   - HTTP API communication through `ApiClient`
   - Local storage via `shared_preferences`
   - SVG rendering with `flutter_svg`

Keep these patterns consistent when modifying or extending the codebase.
