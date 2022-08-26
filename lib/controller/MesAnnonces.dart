import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_le_bon_coin/controller/EditAnnonce.dart';
import 'package:flutter_le_bon_coin/model/Annonces.dart';
import 'package:flutter_le_bon_coin/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';

class MesAnnonces extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MesAnnoncesState();
  }

}

class MesAnnoncesState extends State<MesAnnonces>{
  late String title = "";
  late String description = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }


  Widget bodyPage(){
      //Récupération des annonces

      return StreamBuilder<QuerySnapshot>(
          stream: FirestoreHelper().getMyAds(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              //La base de donnée n'a aucun snapshot
              return const Center(
                //Widget en forme de cercle qui tourne sur lui meme en permance
                  child: CircularProgressIndicator()
              );


            }
            else
            {
              //La base de donnée a un ou plusieurs snapshots
              List documents = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context,index){
                    Annonces annonce = Annonces(documents[index]);
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                      child:  ListTile(
                        key: Key("annonce.id"),
                        title: Text(annonce.titre),
                        subtitle: Text(annonce.description),

                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return EditAnnonce(annonce: annonce,);
                              }
                          ));

                        },


                      ),

                    );

                  }
              );


            }
          }
      );

  }
}






