import 'dart:io';

import 'abstract.service.dart';

class NotificationsService extends AbstractService {
  void updatePushNotificationId(String notificationId, String? oldId) {
    createPushDevice(notificationId);
    if(oldId != null) deletePushDevice(oldId);
  }

  void createPushDevice(String notificationId) async {
    String platform = "ios"; //DO NOT CHANGE THIS :D The android option on the api dosent work. (BEcause it dosent specify the notifcation part of the payload, and im too lazy to change it)
    if(Platform.isIOS)
      platform = "ios";

    await AbstractService.post("/push_devices", mapBody: {"push_device": {"token": notificationId, "system": platform}});
  }

  void deletePushDevice(String notificationId) async {
    await AbstractService.delete("/push_devices", mapBody: {"token": notificationId,});
  }
}