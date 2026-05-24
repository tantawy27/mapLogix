# MapLogix

MapLogix is a robust, location-based Flutter application engineered with professional coding standards. It integrates real-time mapping, secure user authentication, and offline data persistence, all structured within a scalable **Clean Architecture** pattern.

## 🚀 Technical Stack
* **Core Framework:** Flutter
* **Architecture:** Clean Architecture (Domain, Data, Presentation layers)
* **State Management:** Bloc / Cubit
* **Networking:** Dio (for efficient API communication)
* **Local Database:** SQFlite (for offline data storage and persistence)
* **Authentication:** Firebase Authentication
* **Maps Integration:** Google Maps Flutter
* **Object Comparison:** Equatable

## 💡 What Does This App Do?
MapLogix provides a seamless experience for users to:
* **Secure Access:** Register and authenticate users via Firebase for a safe and personalized experience.
* **Geospatial Tracking:** Interact with Google Maps to visualize location data and track movements in real-time.
* **Offline Operations:** Cache and retrieve data locally using SQFlite, ensuring the app remains functional even without an active internet connection.
* **Professional State Handling:** Utilize Bloc/Cubit to ensure that UI changes are reactive, predictable, and decoupled from the business logic.

## 📂 Project Structure
Following the **Clean Architecture** philosophy:
- **Data Layer:** Manages remote APIs (Dio), local database (SQFlite), and data models.
- **Domain Layer:** Contains the business logic, use cases, and repository interfaces.
- **Presentation Layer:** Manages UI screens and connects them to the state management logic (Bloc/Cubit).

## ⚙️ Installation & Setup
1. **Clone the repository:**
```bash
   git clone https://github.com/tantawy27/mapLogix.git
