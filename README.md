# News App | Flutter & NewsAPI

A Flutter news browser with category/source selection, article search, pagination and Arabic/English UI support.

## Features

- Browse categories and retrieve their available news sources.
- Load articles for a selected source with paginated requests.
- Search articles using NewsAPI.
- Open an article website from its details sheet.
- Arabic and English localization, relative timestamps and light/dark theme switching.
- Persist the theme preference with Hive; display article images with cached network images.
- Firebase Cloud Messaging initialization and local-notification handling code.

## Structure and state management

Feature folders contain home, search and drawer views. Shared API services deserialize article/source models. Provider manages theme and localization state; network results are consumed by the UI through asynchronous builders.

## Main packages

`provider`, `http`, `easy_localization`, `hive_flutter`, `timeago`, `firebase_messaging`, `flutter_local_notifications`, `cached_network_image`, `url_launcher` and `skeletonizer`.

## Getting started

Use a Flutter installation whose bundled Dart SDK satisfies `^3.12.2`, as declared in `pubspec.yaml`.

```bash
git clone https://github.com/RafatMohamed/newsApp.git
cd newsApp
flutter pub get
```

1. Add your own NewsAPI key: copy `lib/core/consts/api_keys.example.dart` to `lib/core/consts/api_keys.dart` and paste your key there. That file is gitignored, so the key stays out of version control. Never commit a real key.
2. The service uses `v2/top-headlines/sources`, `v2/top-headlines` and `v2/everything`. API-plan restrictions and quotas may affect requests.
3. Configure your own Firebase project and regenerate Firebase options/platform files for messaging. Complete platform notification permissions and provider setup.

After completing the configuration above:

```bash
flutter run
```

## Current scope and limitations

- Hive is used for the theme preference, not an offline article database. Image caching is separate from offline article access.
- Notification integration exists in code; end-to-end push delivery was not tested.
- This README describes source-code implementation. Builds, external services and user flows have not been run as part of this documentation review.

## Code guide

- [`lib/core/services/api/api_services.dart`](lib/core/services/api/api_services.dart)
- [`lib/core/consts/api_const.dart`](lib/core/consts/api_const.dart)
- [`lib/feature/home/view/widgets/news_view.dart`](lib/feature/home/view/widgets/news_view.dart)
- [`lib/feature/search/view/search_view.dart`](lib/feature/search/view/search_view.dart)
- [`lib/core/services/FCM_Services/fcm_services.dart`](lib/core/services/FCM_Services/fcm_services.dart)
- [`lib/core/services/StorgeLocal/them_local_storge.dart`](lib/core/services/StorgeLocal/them_local_storge.dart)
