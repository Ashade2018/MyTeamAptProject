import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/services/reset_password_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('ResetPasswordService() ', () {
    test(
        '.resetPassword() returns true when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();

      String url = AppEndpoints.resetPasswordEndpoint;
      String successResponseBody =
          '''{"success": true,"error_message": null}''';
      Response successResponse = Response(successResponseBody, 200);

      when(mockClient.get(url)).thenAnswer((_) {
        return Future.value(successResponse);
      });

      ResetPasswordService resetPasswordService =
          ResetPasswordService(mockClient);

      bool resetPasswordResult = await resetPasswordService.resetPassword();

      expect(resetPasswordResult, true);
    });

    test(
        '.resetPassword() returns false when the request does not complete successfully',
        () async {
      MockClient mockClient = MockClient();

      String url = AppEndpoints.resetPasswordEndpoint;
      String errorResponseBody =
          '''{"success": false,"error_message": "Could not reset password"}''';
      Response errorResponse = Response(errorResponseBody, 200);

      when(mockClient.get(url)).thenAnswer((_) {
        return Future.value(errorResponse);
      });

      ResetPasswordService resetPasswordService =
          ResetPasswordService(mockClient);

      bool resetPasswordResult = await resetPasswordService.resetPassword();

      expect(resetPasswordResult, false);
    });

    test(
        '.resetPassword() returns false when the request returns a status code of 400',
        () async {
      MockClient mockClient = MockClient();

      String url = AppEndpoints.resetPasswordEndpoint;
      String errorResponseBody = "";
      Response errorResponse = Response(errorResponseBody, 400);

      when(mockClient.get(url)).thenAnswer((_) {
        return Future.value(errorResponse);
      });

      ResetPasswordService resetPasswordService =
          ResetPasswordService(mockClient);

      bool resetPasswordResult = await resetPasswordService.resetPassword();

      expect(resetPasswordResult, false);
    });
  });
}
