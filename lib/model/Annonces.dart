
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_le_bon_coin/model/Utilisateur.dart';

class Annonces {
  //Attributs
  late String id;
  late String titre;
  late String description;
  late Utilisateur? user;
  late bool? available;

  final fireUsers = FirebaseFirestore.instance.collection("USERS");


  Annonces(DocumentSnapshot snapshot){
      id = snapshot.id;
      Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
      titre = map["TITLE"];
      description = map["DESCRIPTION"];
      fireUsers.doc(map['USER']).get().then((snapshotUser) => user = Utilisateur(snapshotUser));
      available = map["AVAILABLE"];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map ={
      "TITRE" : titre,
      "DESCRIPTION": description,
      "USER": user,
      "AVAILABLE": available,
    };
    return map;
  }
}