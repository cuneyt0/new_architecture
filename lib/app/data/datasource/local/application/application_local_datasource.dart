abstract class ApplicationLocalDataSource {
  Future<void> saveAuthorizationKey(String key);
  Future<String> getAuthorizationKey();

  Future<void> saveSecureKey(List<int> key);
  Future<String?> getSecureKey();
}
