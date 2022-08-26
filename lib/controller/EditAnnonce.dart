import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_le_bon_coin/controller/Dashboard.dart';
import  'package:flutter_le_bon_coin/controller/MesAnnonces.dart';
import 'package:flutter_le_bon_coin/model/Annonces.dart';
import 'package:flutter_le_bon_coin/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_le_bon_coin/services/constants.dart';

class EditAnnonce extends StatefulWidget{

  Annonces annonce;

  EditAnnonce({required this.annonce});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditAnnonceState();
  }

}

class EditAnnonceState extends State<EditAnnonce>{
  late String title = "";
  late String description = "";
  late bool? available;
  late String annonceId;
  late Annonces annonce;



  @override
  void initState() {
    super.initState();


    setState((){
      annonce = widget.annonce;
      if (annonce.available == null){
        available = true;
      } else {
        available = annonce.available;
      }
      title = annonce.titre;
      description = annonce.description;
      annonceId = annonce.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return bodyPage();
  }

  Widget bodyPage(){

    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit annonce"),
        ),
        body: Column(
          children: [
            //Pseudo
            TextFormField(
              onChanged: (value){
                setState(() {
                  annonce.titre = value;
                });

              },
              initialValue: title,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Entrer le titre de l'annonce",
                border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                ),

              ),

            ),
            const SizedBox(height: 10,),


            //mail

            TextFormField(
              onChanged: (value){
                setState(() {
                  annonce.description = value;
                });

              },
              initialValue: description,
              maxLines: null,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Entrer la description de votre annonces",
                  border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),

            const SizedBox(height: 10,),

            CheckboxListTile(
                value: available,
                onChanged: (onChanged) {
                  setState(() {
                    annonce.available = onChanged;
                    available = onChanged;
                  });
                },
                title: Text("Annonce toujours disponible ?"),

            ),
            TextButton(
                onPressed: (){
                  FirestoreHelper().updateAnnonce(annonce).then((value){

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return Dashboard(index: 2,);
                        }
                    ));

                  }).catchError((error){

                  });

                },
                child: const Text("Editer l'annonce")
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return Dashboard(index: 2,);
                      }
                  ));
                },
                child: const Text("Annuler")
            )
    ])
    );

  }


}

