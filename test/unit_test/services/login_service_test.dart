import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/services/login_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('LoginService()', () {
    test('.login returns true when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.loginEndpoint;
      String successResponseBody =
          '''{"success": true,"error_message": null}''';
      Response successResponse = Response(successResponseBody, 200);

      when(mockClient.get(url)).thenAnswer((_) {
        return Future.value(successResponse);
      });

      LoginService loginService = LoginService(mockClient);

      bool loginResult = await loginService.login();

      expect(loginResult, true);
    });

    test('.login returns false when the request does not complete successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.loginEndpoint;
      String errorResponseBody =
          '''{"success": false,"error_message": "Could not login"}''';
      Response errorResponse = Response(errorResponseBody, 200);

      when(mockClient.get(url)).thenAnswer((_) {
        return Future.value(errorResponse);
      });

      LoginService loginService = LoginService(mockClient);

      bool loginResult = await loginService.login();

      expect(loginResult, false);
    });

    test('.login returns false when the request returns a status code of 400',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.loginEndpoint;
      String errorResponseBody = "";
      Response errorResponse = Response(errorResponseBody, 400);

      when(mockClient.get(url)).thenAnswer((_) {
        return Future.value(errorResponse);
      });

      LoginService loginService = LoginService(mockClient);

      bool loginResult = await loginService.login();

      expect(loginResult, false);
    });
  });
}
