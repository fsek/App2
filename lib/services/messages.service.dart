import 'package:fsek_mobile/models/messages/groupmessage.dart';
import 'package:fsek_mobile/models/messages/message.dart';
import 'package:fsek_mobile/models/messages/messaging_group.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class MessagesService extends AbstractService {
  int pageCount = -1; //from server, NOTE: 1-indexed
  final int pageSize = 30;
  Future<List<MessagingGroup>> getGroups() async {
    Map json = await AbstractService.get("/groups");
    List<MessagingGroup> result = (json['groups'] as List).map((data) => MessagingGroup.fromJson(data)).toList();
    return result; 
  }
  Future<List<Message>> getMessages(int groupId) async {
    Map json = await AbstractService.get("/groups/$groupId/messages");
    List<Message> result = (json['messages'] as List).map((data) => Message.fromJson(data)).toList();
    pageCount = json["meta"]["total_pages"];
    return result; 
  }
  Future<List<Message>> getMoreMessages(int groupId, int page, ) async {
    Map json = await AbstractService.get("/groups/$groupId/messages?page=$page");
    List<Message> result = (json['messages'] as List).map((data) => Message.fromJson(data)).toList();
    pageCount = json["meta"]["total_pages"];
    return result; 
  }
  Future<String> getActionCableToken() async {
    Map json = await AbstractService.get("/messages/new_token");
    return json["token"];
  }
}