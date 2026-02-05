# Flutter Post Viewer

A simple Flutter application that fetches posts and users from a REST API, displays them, and allows users to bookmark posts locally.

## How to Run the App

1.  **Prerequisites**:
    *   Flutter SDK installed.
    *   An Android/iOS emulator or a physical device connected.

2.  **Clone and Navigate**:
    ```bash
    git clone <repository-url>
    cd flutter_assignment
    ```

3.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

4.  **Run Code Generation**:
    The project uses Riverpod and Isar annotations, so you need to generate the necessary files:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Run the App**:
    ```bash
    flutter run
    ```

## Architectural Decisions

### 1. State Management (Riverpod)
The app uses **Riverpod** with code generation (`riverpod_annotation`). This provides a reactive way to manage state, ensuring that the UI updates automatically when the underlying data changes. The `AppStateProvider` handles navigation, loading states, and search queries.

### 2. Local Persistence (Isar)
**Isar** is used as the local database for its performance and ease of use with Flutter. 
*   **Offline Support**: Once posts are fetched, they are stored in Isar. The app reads from Isar to display data, allowing for smooth performance and offline viewing.
*   **Bookmarking**: Bookmark status is persisted in Isar, ensuring user preferences are saved across sessions.

### 3. API & User Handling
*   **Data Aggregation**: The app fetches data from two separate endpoints: `/posts` and `/users`. 
*   **User Mapping**: To display the author's name for each post, the repository fetches the list of users once and creates a map of `userId` to `username`. This map is then used to populate the `username` field in each `PostModel` before saving it to the local database. This avoids redundant lookups and simplifies the UI logic.
*   **Networking**: **Dio** is used for HTTP requests due to its powerful feature set, including interceptors and base configurations.

### 4. Dependency Injection
The app uses a service locator pattern (via `GetIt`) to manage singleton instances like the Isar database, promoting better testability and separation of concerns.
