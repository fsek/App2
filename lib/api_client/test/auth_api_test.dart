import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for AuthApi
void main() {
  final instance = ApiClient().getAuthApi();

  group(AuthApi, () {
    // Auth:Jwt.Login
    //
    //Future<BearerResponse> authAuthJwtLogin(String username, String password, { String grantType, String scope, String clientId, String clientSecret }) async
    test('test authAuthJwtLogin', () async {
      // TODO
    });

    // Auth:Jwt.Logout
    //
    //Future<JsonObject> authAuthJwtLogout() async
    test('test authAuthJwtLogout', () async {
      // TODO
    });

    // Register:Register
    //
    //Future<UserRead> authRegisterRegister(UserCreate userCreate) async
    test('test authRegisterRegister', () async {
      // TODO
    });

    // Reset:Forgot Password
    //
    //Future<JsonObject> authResetForgotPassword(BodyAuthResetForgotPassword bodyAuthResetForgotPassword) async
    test('test authResetForgotPassword', () async {
      // TODO
    });

    // Reset:Reset Password
    //
    //Future<JsonObject> authResetResetPassword(BodyAuthResetResetPassword bodyAuthResetResetPassword) async
    test('test authResetResetPassword', () async {
      // TODO
    });

    // Verify:Request-Token
    //
    //Future<JsonObject> authVerifyRequestToken(BodyAuthVerifyRequestToken bodyAuthVerifyRequestToken) async
    test('test authVerifyRequestToken', () async {
      // TODO
    });

    // Verify:Verify
    //
    //Future<UserRead> authVerifyVerify(BodyAuthVerifyVerify bodyAuthVerifyVerify) async
    test('test authVerifyVerify', () async {
      // TODO
    });

  });
}
