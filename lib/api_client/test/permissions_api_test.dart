import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for PermissionsApi
void main() {
  final instance = ApiClient().getPermissionsApi();

  group(PermissionsApi, () {
    // Change Post Permission
    //
    //Future<JsonObject> permissionsChangePostPermission(UpdatePermission updatePermission) async
    test('test permissionsChangePostPermission', () async {
      // TODO
    });

    // Create Permission
    //
    //Future<PermissionRead> permissionsCreatePermission(PermissionCreate permissionCreate) async
    test('test permissionsCreatePermission', () async {
      // TODO
    });

    // Get All Permissions
    //
    //Future<BuiltList<PermissionRead>> permissionsGetAllPermissions() async
    test('test permissionsGetAllPermissions', () async {
      // TODO
    });

  });
}
