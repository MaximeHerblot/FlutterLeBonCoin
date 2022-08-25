
import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  late String id;
  late String from;
  late String to;
  late String texte;
  late DateTime time;


  Message(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    from =map["FROM"];
    to = map["TO"];
    Timestamp timestamp = map["DATE"];
    time = timestamp.toDate();
    texte = map["MESSAGE"];
  }
}