import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_le_bon_coin/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';

class CreationAnnonce extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreationAnnonceState();
  }

}

class CreationAnnonceState extends State<CreationAnnonce>{
  late String title = "";
  late String description = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }


  Widget bodyPage(){
    // Column(
    //    children: [
    // //        TextField(
          onChanged:// (value){
            //         setState(() {
            //          pseudo = value;
            //         });
//
            //       },
            //       obscureText: true,
            //        decoration: InputDecoration(
            border:// OutlineInputBorder(),
            //          labelText: 'Password',
            //        ),

            //      )
            //     ],
            //  );
            return const Text("Creation d'annonces");
  }




}