import 'package:league_app/src/data/app_endpoints.dart';
import 'package:league_app/src/services/sign_up_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import '../data/test_strings.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('SignUpService', () {
    test('.signUp returns true when the request completes successfully',
        () async {
      MockClient mockClient = MockClient();
      String url = AppEndpoints.signUpEndpoint;
      final String successResponseBody =
          TestStrings.signUpServiceTestSuccessResponseBody;
      Response successResponse = Response(successResponseBody, 200);
      when(mockClient.get(url)).thenAnswer((_) async {
        return Future.value(successResponse);
      });

      SignUpService signUpService = SignUpService(mockClient);
      bool signUpResult = await signUpService.signUp();

      expect(signUpResult, true);
    });
  });

  test('.signUp returns false when the request does not completes successfully',
      () async {
    MockClient mockClient = MockClient();
    String url = AppEndpoints.signUpEndpoint;
    String errorResponseBody =
        '''{"success": false,"error_message": "Could not login"}''';
    Response errorResponse = Response(errorResponseBody, 200);
    when(mockClient.get(url)).thenAnswer((_) async {
      return Future.value(errorResponse);
    });

    SignUpService signUpService = SignUpService(mockClient);
    bool signUpResult = await signUpService.signUp();

    expect(signUpResult, false);
  });

  test('.signUp returns false when the request returns a status code of 400',
      () async {
    MockClient mockClient = MockClient();
    String url = AppEndpoints.signUpEndpoint;
    final String errorResponseBody =
        TestStrings.signUpServiceTestErrorResponseBody;
    Response errorResponse = Response(errorResponseBody, 400);
    when(mockClient.get(url)).thenAnswer((_) async {
      return Future.value(errorResponse);
    });

    SignUpService signUpService = SignUpService(mockClient);
    bool signUpResult = await signUpService.signUp();

    expect(signUpResult, false);
  });
}
