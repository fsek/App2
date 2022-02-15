import 'package:fsek_mobile/models/fredmansky/fredmansky.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class FredmanskyService extends AbstractService {
  Future<Fredmansky> toggleFredmansky() async {
    Map json = await AbstractService.patch("/fredmansky/toggle");
    return Fredmansky.fromJson(json as Map<String, dynamic>);
  }

  void testGetThings() async {
    print("TEST /fredmansky:");
    Map json = await AbstractService.patch("/fredmansky/toggle");
    print(json);
  }
}
