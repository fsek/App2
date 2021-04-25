import 'abstract.service.dart';

class NotificationsService extends AbstractService {
  /*
   * HTTP Requests
   */
  Future<bool> acceptNotifications(String token) async {
    Map json = await AbstractService.post("/settings/notifications/accept", body: token);
    return (json['result'] as bool);
  }
  Future<bool> declineNotifications(String token) async {
    Map json = await AbstractService.post("/settings/notifications/decline", body: token);
    return (json['result'] as bool);
  }
  Future<bool> updateEmailPreferences(bool email) async {
    Map json = await AbstractService.post("/settings/email", body: email.toString());
    return (json['result'] as bool);
  }
  
  Future<Map<String, bool>> getNotificationPreferences() async {
    Map<String, bool> result = new Map();
    Map json = await AbstractService.get("/settings/notifications/current");
    
    result["email"] = json['email'] as bool;
    result["web"] = json['web'] as bool;
    result["push"] = json['pushNotification'] as bool;
    return result;
  }
}