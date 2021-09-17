import 'package:fsek_mobile/models/notiser/notis_wrapper.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class NotiserService extends AbstractService {
  final int pageSize = 30;
  Future<NotisWrapper> getMoreMessages(int page) async {
    Map json = await AbstractService.get("/notifications?page=$page");
    NotisWrapper wrapper = NotisWrapper.fromJson(json as Map<String, dynamic>);
    return wrapper;
  }

  Future<void> visitNotis(int notisId) async {
    await AbstractService.patch("/notifications/$notisId/visit");
    return;
  }
}
