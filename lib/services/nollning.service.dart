import 'package:fsek_mobile/models/nollning/nollning_group.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class NollningService extends AbstractService {
  Future<List<NollningGroup>> getNollningGroups() async {
    Map json = await AbstractService.get("/groups");
    List<NollningGroup> result = (json['groups'] as List).map((data) => NollningGroup.fromJson(data)).toList();
    return result;
  }
}
