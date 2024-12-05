
# **Bike App**

A Flutter-based mobile application that allows users to browse products, view product details, and manage a shopping cart. The app uses Firebase Authentication for secure login and integrates with RESTful APIs to fetch product data.

---

## **Features**

- **User Authentication**: Secure login and registration using Firebase.
- **Product Browsing**: Fetch and display product data from a RESTful API.
- **Product Details**: View detailed information about each product.
- **Shopping Cart**: Add products to the cart and manage them.
- **Offline Caching**: Cache API data for offline use.
- **Error Handling**: Smooth user experience with error messages and loading indicators.

---

## **Setup Instructions**

### **Prerequisites**
1. **Install Flutter**:  
   - Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. **Install Firebase CLI** (optional for Firebase project setup):  
   - Follow the [Firebase CLI guide](https://firebase.google.com/docs/cli).

3. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd ecommerce_app
   ```

---

### **Configuration**

#### **1. Firebase Setup**
1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Create a new Firebase project.
3. Add your app to the Firebase project:
   - For Android: Download the `google-services.json` file and place it in `android/app/`.
   - For iOS: Download the `GoogleService-Info.plist` file and place it in `ios/Runner/`.
4. Enable Firebase Authentication:
   - Go to **Authentication > Sign-in method** and enable **Email/Password** authentication.

#### **2. API Configuration**
- The app fetches product and category data from:
  - Products: `https://api.escuelajs.co/api/v1/products`
  - Categories: `https://api.escuelajs.co/api/v1/categories`

---

### **Running the App**

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the App**:
   ```bash
   flutter run
   ```

3. **Build APK** (for Android):
   ```bash
   flutter build apk --release
   ```

---

## **Project Structure**

```
lib/
├── main.dart         # Entry point of the application
├── core/             # API services and data management
├── l10n/             # Localization and translation files
├── src/              # Core application modules
│   ├── auth/         # Authentication-related logic and UI (login, signup, etc.)
│   ├── cart/         # Shopping cart functionality and UI
│   ├── categories/   # Category listing and management
│   ├── home/         # Home screen and dashboard logic/UI
│   ├── navbar/       # Navigation bar and routing
│   ├── orders/       # Order history and management
│   ├── products/     # Product listing and detailed view logic/UI
│   ├── profile/      # User profile settings and information
│   ├── settings/     # App settings and preferences
│   └── splash/       # Splash screen and initial app setup
```

---

## **Dependencies**
- **Firebase Authentication**: For user login and signup.
- **Dio**: For making API requests.
- **Provider**: For state management.
- **Shared Preferences**: For offline data caching.
- **Connectivity Plus**: For checking internet connection.

---

## **Additional Notes**

- **Caching Strategy**: API responses are cached using `shared_preferences` for offline use.
- **Error Handling**: Network errors and API issues are gracefully handled with appropriate user feedback.

---

## **Contributing**

Contributions are welcome! Please fork the repository and submit a pull request.

---

## **License**

This project is licensed under the MIT License.
