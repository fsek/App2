import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/contact/contact.dart';
import 'package:fsek_mobile/services/contact.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';

class ContactPage extends StatefulWidget {
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact>? contacts = [];
  Contact? currentContact;
  String localMessage = "";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    locator<ContactService>().getContacts().then((value) {
      setState(() {
        contacts = value;
        currentContact = contacts![0];
        contacts!.sort(
            (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (contacts!.isEmpty) {
      return Scaffold(
          appBar: AppBar(
              title: Text("Kontakt",
                  style: Theme.of(context).textTheme.headline5)),
          body: Center(
              child: CircularProgressIndicator(color: Colors.orange[600])));
    }
    return Scaffold(
        appBar: AppBar(
            title:
                Text("Kontakt", style: Theme.of(context).textTheme.headline5)),
        //Bilder och skit kommer senare
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(color: Colors.orange[600]),
                  child: Stack(children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            //image:
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.grey[400]!,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(currentContact!.name!,
                              style: Theme.of(context).textTheme.subtitle1)),
                    ),
                  ]),
                ),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
                    child: Text("Kontktperson",
                        style: Theme.of(context).textTheme.subtitle2),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                    autofocus: false,
                    value: currentContact!,
                    isExpanded: true,
                    onChanged: (Contact? contact) {
                      setState(() {
                        currentContact = contact;
                      });
                    },
                    items: contacts!.map((contact) {
                      return DropdownMenuItem(
                          child: Text(contact.name!), value: contact);
                    }).toList()),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 24, 8, 4),
                    child: Text("Beskrivning",
                        style: Theme.of(context).textTheme.subtitle2),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                  child: Text(currentContact!
                      .text!) //Make into html when that dependency is merged
                  ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 24, 8, 4),
                    child: Text("Kontaktinformation",
                        style: Theme.of(context).textTheme.subtitle2),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "E-post: ",
                          style: Theme.of(context).textTheme.bodyText2),
                      TextSpan(
                          text: currentContact!.email!,
                          style: Theme.of(context).textTheme.bodyText2)
                    ])),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Posten innehavs av: ",
                          style: Theme.of(context).textTheme.bodyText2),
                      TextSpan(
                          text: _getPostUserNames(),
                          style: Theme.of(context).textTheme.bodyText2)
                    ]))
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 24, 8, 4),
                    child: Text("Meddelande",
                        style: Theme.of(context).textTheme.subtitle2),
                  )),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    autofocus: false,
                    controller: controller,
                    maxLines: 4,
                    decoration:
                        InputDecoration(hintText: "Skriv ditt meddelande här"),
                    onChanged: (input) => localMessage = input,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(color: Colors.grey[200]),
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: Ink(
                    decoration: BoxDecoration(color: Colors.orange[600]),
                    child: InkWell(
                        child: Center(
                            child: Text(
                          "Skicka",
                          style: Theme.of(context).textTheme.button,
                        )),
                        onTap: () => _sendMessage(localMessage)),
                  )),
              Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(color: Colors.grey[200]),
              ),
            ],
          ),
        ));
  }

  String _getPostUserNames() {
    List<String> names = currentContact!.users!.map((user) => user).toList();
    return names.length != 0 ? names.join(", ") : "V.A. Kant";
  }

  void _sendMessage(String messageBody) {
    if (messageBody == "") {
      //Popup att meddelande är tomt
      return;
    }
    try {
      locator<UserService>().getUser().then((user) {
        Map<String, dynamic> message = Map();
        message["name"] = user.firstname! + " " + user.lastname!;
        message["email"] = user.email!;
        message["message"] = messageBody;
        //Message has to be wrapped to be accepted by api
        locator<ContactService>().sendMessage(
            {"contact_message": message}, currentContact!.id!).then((reponse) {
          controller.clear();
          _successPopup();
        });
      });
    } catch (error) {
      _failPopup();
    }
  }
  void _successPopup(){

  }
  void _failPopup(){

  }
}
