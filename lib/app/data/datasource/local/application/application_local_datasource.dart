abstract class ApplicationLocalDataSource{
  void saveAuthorizationKey(String key);
  Future<String> getAuthorizationKey();

  void saveSecureKey(List<int> key);
  Future<String?> getSecureKey();
}