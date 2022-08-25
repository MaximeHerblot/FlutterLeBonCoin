
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Annonces {
  //Attributs
  late String id;
  late String titre;
  late String description;
  late DateTime dateCreation;

  Annonces(DocumentSnapshot snapshot){
      id = snapshot.id;
      Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
      titre = map["TITRE"];
      description = map["DESCRIPTION"];
      if (map["DATECREATION"] == null){
        dateCreation = DateTime.now();
      } else {
        dateCreation = map["DATECREATION"];
      }
  }

}