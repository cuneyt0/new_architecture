import 'package:architecture/core/network/builder/network_manager.dart';

bool? kApiReleaseMode = true;

class NetworkClient {
  NetworkClient._privateConstructor();

  static final NetworkClient _instance = NetworkClient._privateConstructor();

  static NetworkClient get instance => _instance;

  Future<NetworkManager> networkClient() async => _networkManager;
  Future<NetworkManager> postsNetworkClient() async => _postsNetworkManager;
}

final NetworkManager _networkManager = NetworkManager(
    authToken: null,
    isLog: true,
    isReleaseURL: kApiReleaseMode,
    releaseBaseURL: 'https://reqres.in/',
    testBaseURL: 'https://reqres.in/');
final NetworkManager _postsNetworkManager = NetworkManager(
    authToken: null,
    isLog: true,
    isReleaseURL: kApiReleaseMode,
    releaseBaseURL: 'https://jsonplaceholder.typicode.com/',
    testBaseURL: 'https://jsonplaceholder.typicode.com/');
