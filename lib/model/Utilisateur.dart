
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  //Attributs
  late String id;
  late String pseudo;
  late String mail;
  String? avatar;
  String? nom;
  String? prenom;
  late DateTime birthday;
  late List favoris;


  String get fullName {
    return "$prenom  $nom";
  }



  Utilisateur(DocumentSnapshot snapshot){
    String? avatarprovisoire;
    String? nomprovisoire;
    String? prenomprovisoire;
      id = snapshot.id;
      Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
      pseudo = map["PSEUDO"];
      mail = map["MAIL"];
      avatarprovisoire = map["AVATAR"];
      if (avatarprovisoire == null){
        avatar = "https://firebasestorage.googleapis.com/v0/b/ipssibd231.appspot.com/o/images.jpeg?alt=media&token=225c697a-b55a-456c-b89e-690665c12bbd";
      }
      else
        {
          avatar = avatarprovisoire;
        }
      nomprovisoire = map["NOM"];

    if (nomprovisoire == null){
      nom="";
    }
    else
    {
      nom = nomprovisoire;
    }
    prenomprovisoire = map["PRENOM"];
    if (prenomprovisoire == null){
      prenom="";
    }
    else
    {
      prenom = prenomprovisoire;
    }
    Timestamp timestamp = map["BIRTHDAY"];
    birthday = timestamp.toDate();
  }


  Utilisateur.empty(){
    id = "";
    mail = "";
    pseudo = "";
    birthday = DateTime.now();
    favoris = [];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map ={
      "PSEUDO" : pseudo,
      "MAIL": mail,
      "AVATAR": avatar,
      "NOM":nom,
      "PRENOM": prenom,
      "BIRTHDAY": birthday,
      "FAVORIS" : favoris
    };
    return map;
  }




}