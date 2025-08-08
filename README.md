# Shopping_Site_Django_Flutter

# 🛍️ Flutter + Django Shopping App

A full-stack **shopping app** built with **Flutter** (frontend) and **Django** (backend), featuring modern UI, state management, and REST APIs. This app supports user authentication, product listings, cart, wishlist, and order management.

---

## 📱 Flutter Frontend

### Features

- ✨ Clean, responsive UI
- 🧭 Navigation with `go_router`
- 📱 Device scaling with `flutter_screenutil`
- 🧠 State management using `Provider`
- 💾 Local storage using `GetStorage`
- 🔐 Authentication (JWT-based)
- 🛒 Cart and Wishlist support
- 👤 Profile page and user settings
- 📦 Product detail & category pages

### Key Screens

- Splash Screen
- Onboarding Flow
- Login / Register
- Home with Featured Products
- Product Detail Page
- Cart & Wishlist Pages
- Profile Page

### Folder Structure

lib/
├── main.dart
├── core/ # Constants, Themes, Helpers
├── auth/ # Login & Registration
├── features/
│ ├── home/
│ ├── cart/
│ ├── wishlist/
│ └── profile/

├── models/ # Dart data models
├── services/ # API and auth services
└── routes/ # go_router config






---

## ⚙️ Django Backend

### Features

- 🔐 JWT Authentication (via `djoser`)
- 📦 Product, Category & Brand APIs
- 🛒 Cart and Order management
- 📝 Admin panel (with Jazzmin UI)
- 🌐 CORS configured for Flutter frontend
- 📁 Media upload support

### Django Apps

backend/
├── users/ # Custom user model + auth
├── products/ # Product, Brand, Category
├── cart/ # Cart + Wishlist logic
├── orders/ # Order and checkout
├── settings.py
└── urls.py


✅ To Do
 Login/Signup

 Home UI

 Product Details

 Cart/Wishlist

 Profile Page

 Django APIs

 Razorpay / Stripe Payment Gateway

 Firebase Push Notifications

