
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_le_bon_coin/model/Utilisateur.dart';

class FirestoreHelper{
   final auth = FirebaseAuth.instance;
   final storage = FirebaseStorage.instance;
   final fireUsers = FirebaseFirestore.instance.collection("USERS");
   final fireMessage = FirebaseFirestore.instance.collection("MESSAGES");
   final fireConversation = FirebaseFirestore.instance.collection("CONVERSATIONS");






   //Méthodes

   //Se connecter à notre base de donnée
   Future <Utilisateur> connected(String mail , String password) async{
      UserCredential result = await auth.signInWithEmailAndPassword(email: mail, password: password);
      String uid = result.user!.uid;
      return getUsers(uid);


   }


   //S'inscrire dans notre base de donnnée
   Future<Utilisateur> inscription(String mail , String password, String pseudo,DateTime birthday) async {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: mail, password: password);

      String uid = result.user!.uid;
      Map<String,dynamic> map = {
         "PSEUDO": pseudo,
         "BIRTHDAY": birthday,
         "MAIL": mail,
      };
      addUser(uid, map);
      return getUsers(uid);


   }


   //ajouter un utilisateur
   addUser(String uid, Map<String,dynamic> map){
      fireUsers.doc(uid).set(map);
   }


   //Récuperer les infos des utilisateurs
   Future<Utilisateur> getUsers(String uid) async{
      DocumentSnapshot snapshot = await fireUsers.doc(uid).get();
      return Utilisateur(snapshot);
   }


   //mettre à jour les infos de l'utilisateurs
   updateUser(String uid, Map<String,dynamic> map){
      fireUsers.doc(uid).update(map);
   }



   //Stocker une image
   Future <String> stockageImage(String nameImage, Uint8List data) async {
      TaskSnapshot snapshot = await storage.ref("avatars/$nameImage").putData(data);
      String url = await snapshot.ref.getDownloadURL();
      return url;



   }

   //Enovyer les messages
   EnvoiMessage(String texte, Utilisateur moi , Utilisateur partenaire){
      DateTime date = DateTime.now();
      Map<String,dynamic> map = {
        "FROM": moi.id,
         "TO":  partenaire.id,
         "DATE" : date,
         "MESSAGE": texte,
      };

      addMesage(getMessageRef(moi.id, partenaire.id, date.toString()), map);
      addConversation(moi.id, getConversation(moi.id, partenaire, texte, date));
      addConversation(partenaire.id,getConversation(moi.id, partenaire, texte, date));



   }

   Map<String,dynamic> getConversation(String sender, Utilisateur partenaire, String texte , DateTime time){
      Map<String,dynamic> map = partenaire.toMap();
      map["IDMOI"] = sender;
      map["LASTMESSAGE"] = texte;
      map["ENVOIMASSAGE"]= time;
      map["DESTINATAIRE"] = partenaire.id;
      return map;
   }

   addMesage(String uid,Map<String,dynamic> map){
      fireMessage.doc(uid).set(map);
   }


   addConversation(String uid,Map<String,dynamic> map){
      fireConversation.doc(uid).set(map);
   }


   String  getMessageRef(String from , String to, String date){
      String resultat = "";
      List<String> liste =[from, to];
      liste.sort((a,b)=> a.compareTo(b));
      for (var x in liste){
         resultat += x+"+";
      }
      resultat = resultat + date;
      return resultat;
   }

   getFavoris(String userId){
      List listFavoris = [];
      final currentUser = fireUsers.doc(userId);
      //Get favoris
      currentUser.get().then(
             (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            for ( var user in data['FAVORIS']){
               listFavoris.add(user);
            }
            // ...
         },
         onError: (e) => print("Error getting document: $e"),
      );
      print(listFavoris);
      return null;
   }


}