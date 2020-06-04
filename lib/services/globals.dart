import 'services.dart';

// Static global state. Immutable services that do not care about build context.
class Global {
  // App Data
  static final String title = 'Self Monitor';

  // Data Models
  static final Map models = {
    Monitor: (data) => Monitor.fromMap(data),
  };

  // Firestore References for Writes
  static final UserData<Monitor> monitorRef =
      UserData<Monitor>(collection: 'reports');
}
