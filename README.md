# Ticket App

A Flutter help desk ticketing app for creating, tracking, and managing support tickets locally on device.

## Project Setup

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.x** (Dart **3.11+**)
- Xcode (for iOS) and/or Android Studio with SDK (for Android)
- CocoaPods (for iOS): `sudo gem install cocoapods`

### Install and run

```bash
# Clone the repository, then from the project root:
flutter pub get

# iOS — install native dependencies first
cd ios && pod install && cd ..

# Run on a connected device or simulator
flutter run
```

### Run tests

```bash
flutter test
```

Tests use `sqflite_common_ffi` for in-memory SQLite in unit tests and `mocktail` for repository mocks.

---

## Architecture Overview

The app follows a **feature-first clean architecture** with clear separation between data, domain, and presentation layers.

```
lib/
├── core/                    # Shared infrastructure
│   ├── constants/           # Colors, text styles
│   ├── helpers/             # Layout utilities (e.g. SizeConfig)
│   ├── router/              # go_router route definitions
│   ├── theme/               # Light/dark themes, ThemeCubit
│   ├── utils/               # Service locator (GetIt)
│   └── widgets/             # Reusable UI components
│
└── features/
    ├── splash/              # Animated splash screen
    ├── dashboard/           # Home dashboard (status grid, recent tickets)
    └── tickets/
        ├── data/            # SQLite datasource, models, repository impl
        ├── domain/          # Entities, enums, repository contract
        └── presentation/    # Cubits, screens, widgets
```

### Data flow

```
UI (Widgets)
    ↕  BlocBuilder / context.read<Cubit>()
Cubit (TicketCubit, SearchCubit, ThemeCubit)
    ↕
Repository (TicketRepository)
    ↕
Local Data Source (TicketsLocalDataSource → SQLite)
```

| Layer | Responsibility |
|---|---|
| **Presentation** | Screens, widgets, and Cubits that emit UI state |
| **Domain** | Business contracts (`TicketRepository`), entities, enums |
| **Data** | SQLite persistence, `TicketModel` mapping, repository implementation |

### Navigation

Routing is handled by **go_router** in `lib/core/router/app_router.dart`:

| Route | Screen |
|---|---|
| `/` | Splash |
| `/home` | Dashboard |
| `/create_ticket` | Create ticket form |
| `/all_tickets` | Searchable ticket list |
| `/ticket_details` | Ticket detail & update |

### Dependency injection

**GetIt** (`lib/core/utils/service_locator.dart`) registers singletons at startup:

- `Database` (SQLite via sqflite)
- `SharedPreferences` (theme persistence)
- `TicketsLocalDataSource` → `TicketRepository` → `TicketCubit`
- `SearchCubit` (factory — new instance per All Tickets screen)
- `ThemeCubit`

### Local storage

Tickets are stored in a SQLite database (`tickets.db`) with the schema:

| Column | Type | Notes |
|---|---|---|
| `id` | INTEGER | Primary key, auto-increment |
| `title` | TEXT | Ticket subject |
| `description` | TEXT | Ticket body |
| `priority` | TEXT | `low`, `medium`, `high` |
| `status` | TEXT | `open`, `inProgress`, `closed` |
| `created_at` | TEXT | ISO 8601 timestamp |

---

## State Management

State is managed with **flutter_bloc** using the **Cubit** pattern (simpler BLoC without explicit events).

### TicketCubit (app-wide singleton)

Manages the ticket lifecycle: load, create, update, and delete.

| State | Meaning |
|---|---|
| `TicketInitial` | Before first load |
| `TicketLoading` | Operation in progress |
| `TicketLoaded` | Tickets fetched successfully |
| `TicketsEmpty` | No tickets in database |
| `TicketCreated` / `TicketUpdated` / `TicketDeleted` | Mutation succeeded |
| `TicketError` | Operation failed |

Provided at the app root via `MultiBlocProvider` and re-provided on routes that need it. Screens call methods like `loadTickets()` and `createTicket()` and react with `BlocListener` / `BlocBuilder`.

### SearchCubit (screen-scoped factory)

Powers the **All Tickets** screen with live search and status filtering. It subscribes to `TicketRepository.watchSearch()`, which re-emits results whenever tickets change (create/update/delete).

| State | Meaning |
|---|---|
| `SearchInitial` | Before watching starts |
| `SearchLoading` | Fetching results |
| `SearchLoaded` | Matching tickets found |
| `SearchEmpty` | No matches (context-aware message) |
| `SearchError` | Stream or query error |

Created in the router for `/all_tickets` and disposed when leaving the screen.

### ThemeCubit (app-wide singleton)

Holds the current `ThemeMode` (light, dark, or system) and persists the choice to `SharedPreferences`. The root `MaterialApp.router` rebuilds when the theme changes.

---

## Assumptions and Limitations

### Assumptions

- **Single local user** — there is no authentication, accounts, or multi-user support.
- **Offline-first** — all data lives on device; no network API or cloud sync.
- **Fixed ticket fields** — every ticket has title, description, priority, status, and creation date.
- **Default status** — new tickets are always created with status `open`.
- **Static categories** — Technical, Billing, and General categories are hard-coded in the UI for form validation only.

### Limitations

- **Categories are not persisted** — selecting a category is required when creating a ticket, but the value is not stored in SQLite or shown after creation.
- **No backend** — tickets cannot be shared across devices or users.
- **Prefix-only search** — search matches titles, descriptions, and IDs that *start with* the query string (`LIKE query%`), not full-text or substring search.
- **No sorting or pagination** — tickets are returned in database insertion order; large lists are not paginated.
- **No schema migrations** — the database is created at version 1 with no upgrade path for future schema changes.
- **Hardcoded dashboard greeting** — the home screen displays a fixed welcome message rather than a dynamic user name.
- **Unused dependency** — `share_plus` is listed in `pubspec.yaml` but not yet integrated.
- **Partial test coverage** — tests cover the data source, repository stream behavior, and a few widgets; Cubits and most screens are not yet tested.

---

## Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_bloc` | State management (Cubits) |
| `get_it` | Dependency injection |
| `go_router` | Declarative navigation |
| `sqflite` | Local SQLite database |
| `shared_preferences` | Theme preference storage |
| `equatable` | Value equality (where used) |
| `intl` | Date/time formatting |
| `uuid` | Unique identifiers (available for future use) |


For Demo Video Please Visit 
https://drive.google.com/drive/folders/1dQ3b7kVO17fOGo380a-0tKLMiNlgEdQk?usp=drive_link
