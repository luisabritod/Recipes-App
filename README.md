# 🍳 Recipes App

A beautiful Flutter application that showcases dessert recipes from TheMealDB API, featuring a modern dark theme with purple accents, custom splash screen, and smooth navigation between screens.

## 🎬 Demo

![App Demo](./assets/recipes_demo.gif)

## ✨ Features

- **Custom Splash Screen** - Elegant loading screen with app icon and progress indicator
- **Recipe Discovery** - Browse a randomized list of dessert recipes from TheMealDB API
- **Detailed Recipe View** - View complete recipe information including ingredients and step-by-step instructions
- **Modern Dark Theme** - Eye-friendly dark gray background (#1F2937) with purple accents (#A78BFA)
- **Smooth Navigation** - Seamless transitions between screens with custom styled navigation elements
- **Loading States** - Visual feedback during API requests
- **Error Handling** - Graceful handling of network errors and missing data

## 🎨 Design

### Color Scheme
- **Primary Color**: `#1F2937` (Dark gray-blue)
- **Secondary Color**: `#A78BFA` (Purple)
- **Surface Dark**: `#374151` (Card backgrounds)
- **Text**: White for primary text, purple for accents

### Theme Features
- Material Design 3 implementation
- Custom AppBar styling with purple title
- Elevated cards with subtle shadows
- Consistent typography across the app
- Purple progress indicators and back buttons

## 🛠️ Technical Concepts

### Architecture
- **Clean Architecture** - Separation of concerns with distinct layers:
  - `lib/models/` - Data models (ReceitaResumo, ReceitaDetalhada)
  - `lib/services/` - API service layer for network requests
  - `lib/providers/` - State management with Provider pattern
  - `lib/pages/` - UI screens
  - `lib/core/theme/` - Centralized theme configuration

### State Management
- **Provider Pattern** - Used for managing application state
- Multiple states managed: recipe list, detailed recipe, loading states
- Efficient rebuilds using Consumer widgets

### Navigation
- `Navigator.push` with `MaterialPageRoute` for screen transitions
- Data passing between screens via constructor parameters
- Custom back button with theme-consistent styling

### API Integration
- RESTful API consumption using [TheMealDB API](https://www.themealdb.com/api.php)
- HTTP package for network requests
- JSON parsing with factory constructors
- Complex JSON handling for ingredient lists

### Lifecycle Management
- `StatefulWidget` with proper lifecycle methods
- `WidgetsBinding.addPostFrameCallback()` for async operations in `initState`
- Mounted checks before navigation

### Special Features
- **Randomization** - Recipe order is shuffled on each load for variety
- **Error Handling** - Image loading fallbacks and API error messages
- **Responsive UI** - SingleChildScrollView for various screen sizes

## 📁 Project Structure

```
lib/
├── core/
│   └── theme/
│       ├── app_colors.dart      # Centralized color definitions
│       └── app_theme.dart       # Theme configuration
├── models/
│   ├── receita_detalhada.dart   # Detailed recipe model
│   └── receita_resumo.dart      # Recipe summary model
├── pages/
│   ├── details_page.dart        # Recipe details screen
│   ├── home_page.dart           # Main recipe list screen
│   ├── pages.dart               # Barrel export file
│   └── splash_page.dart         # Custom splash screen
├── providers/
│   ├── providers.dart           # Barrel export file
│   └── receitas_provider.dart   # Recipe state management
├── services/
│   └── receitas_service.dart    # API service layer
└── main.dart                    # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / Xcode for mobile development

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd receitas_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate splash screen and app icons:
```bash
flutter pub run flutter_native_splash:create
flutter pub run flutter_launcher_icons
```

4. Run the app:
```bash
flutter run
```

## 📦 Dependencies

- **provider**: ^6.1.2 - State management
- **http**: ^1.2.2 - HTTP client for API requests
- **flutter_native_splash**: ^2.4.3 - Custom splash screen generation
- **flutter_launcher_icons**: ^0.14.2 - App icon generation

## 🎯 Key Screens

### Splash Screen
- Displays app icon with purple loading indicator
- 2-second delay before navigation to home
- Dark theme background

### Home Page
- Grid layout of recipe cards
- Random recipe order on each load
- Loading state with purple progress indicator
- Navigation to details on tap

### Details Page
- Recipe image at the top
- Recipe name as headline
- Bulleted ingredient list
- Complete cooking instructions
- Purple back button for navigation

## 🔄 API Endpoints Used

- **List Desserts**: `https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert`
- **Recipe Details**: `https://www.themealdb.com/api/json/v1/1/lookup.php?i={id}`

## 🎓 Learning Outcomes

This project demonstrates:
- Navigation between screens in Flutter
- State management with Provider
- API consumption and JSON parsing
- Theme customization with Material Design 3
- Proper project structure and separation of concerns
- Lifecycle management and async operations
- Custom splash screens and app branding

## 📝 License

This project is for educational purposes.

---

Built with ❤️ using Flutter
