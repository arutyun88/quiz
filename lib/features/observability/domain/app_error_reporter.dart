abstract interface class AppErrorReporter {
  bool get enabled;

  Future<void> setUser(String userId);

  Future<void> clearUser();

  Future<void> captureException(
    Object error,
    StackTrace stackTrace, {
    required String operation,
  });

  Future<void> addNavigationBreadcrumb(String routeName);
}
