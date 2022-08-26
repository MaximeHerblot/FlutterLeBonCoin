import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_le_bon_coin/controller/Dashboard.dart';
import 'package:flutter_le_bon_coin/controller/MesAnnonces.dart';
import 'package:flutter_le_bon_coin/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_le_bon_coin/services/constants.dart';

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
    return Column(
      children: [
        //Pseudo
        TextField(
          onChanged: (value){
            setState(() {
              title = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer le titre de l'annonce",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),
        const SizedBox(height: 10,),


        //mail

        TextField(
          onChanged: (value){
            setState(() {
              description = value;
            });

          },
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


        TextButton(
            onPressed: (){
              print('pressed');
              FirestoreHelper().saveAd(MyAccount.id, title, description).then((value){

                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return Dashboard(index: 2,);
                    }
                ));

              }).catchError((error){

              });

            },
            child: const Text("Sauvegarder l'annonce")
        ),
        TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return Dashboard(index: 0,);
                  }
              ));
            },
            child: const Text("Annuler")
        )


        //bouton de la date de naissance
      ],

    );

    return const Text("Creation d'annonces");
  }




}