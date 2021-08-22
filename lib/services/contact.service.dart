
import 'package:fsek_mobile/models/contact/contact.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class ContactService extends AbstractService {
  String uri = "/contacts"; 
  Future<List<Contact>> getContacts() async {
    Map json = await AbstractService.get(uri); 
    List<Contact> result = (json['contacts'] as List).map((data)
        => Contact.fromJson(data)).toList(); 
    return result;  
  }
  Future<Map> sendMessage(Map<String, dynamic> message, int recipientID) async {
    try{
      String postUri = uri + "/" + recipientID.toString() + "/mail"; 
      Map response = await AbstractService.post(postUri, mapBody: message);
      return response; 
    } catch (error){
        throw error; 
    }
}

}