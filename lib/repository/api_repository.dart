
abstract class ApiRepository {
  Future<dynamic> getResponse(
      String requestType, String url, String bodyPost, String bodyGet);
}