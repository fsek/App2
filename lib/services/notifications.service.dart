import 'dart:io';

import 'package:fsek_mobile/util/storage_wrapper.dart';

import 'abstract.service.dart';
import 'service_locator.dart';

class NotificationsService extends AbstractService {
  void updatePushNotificationId(String notificationId, String? oldId) {
    createPushDevice(notificationId);
    if (oldId != null) deletePushDevice(oldId);
  }

  Future<void> createPushDevice(String notificationId) async {
    String platform =
        "ios"; //DO NOT CHANGE THIS :D The android option on the api dosent work. (BEcause it dosent specify the notifcation part of the payload, and im too lazy to change it)
    if (Platform.isIOS) platform = "ios";

    await AbstractService.post("/push_devices", mapBody: {
      "push_device": {"token": notificationId, "system": platform},
    },);
  }

  Future<void> deletePushDevice(String notificationId) async {
    await AbstractService.delete("/push_devices", mapBody: {
      "token": notificationId,
    },);
    locator<TokenStorageWrapper>().delete(key: "notificationId");
  }

  Future<void> logOutDevice() async {
    String? id = await locator<TokenStorageWrapper>().read("notificationId");

    if (id != null) deletePushDevice(id);
  }
}
