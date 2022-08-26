import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_le_bon_coin/controller/CreationAnnonce.dart';
import 'package:flutter_le_bon_coin/controller/MesAnnonces.dart';
import 'package:flutter_le_bon_coin/model/Annonces.dart';
import 'package:flutter_le_bon_coin/services/FirestoreHelper.dart';

class Dashboard extends StatefulWidget{
  int index;
  Dashboard({required this.index});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}


class DashboardState extends State<Dashboard>{
  int index = 0;
  late PageController pageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState((){
      index = widget.index;
      pageIndex = PageController(initialPage: widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Scaffold(
      drawer: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width/1.5,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
        ),
      ),
      appBar: AppBar(
        title: const Text("Nouvelle page"),
      ),
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        onTap: (value){
          setState(() {
            index = value;
            pageIndex.jumpToPage(index);
          });
        },
        currentIndex: index,
        items: const  [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Accueil"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Ajout annonce"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: "Mes annonces"
          ),

        ],
      ),
    );
  }

  Widget
  listingAnnonces() {
    //Récupération des annonces

    var listAds = FirestoreHelper().getAvailableAds();
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().getAvailableAds(),
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
                        title: Text(annonce.titre),
                        subtitle: Text(annonce.description),
                        onTap: (){

                        },


                      ),

                      );

                }
            );


          }
        }
    );

    print(listAds);
    if (listAds == null) {
      return const Text("Il n'y a aucun annonces de disponible actuellement");
    } else {
      return const Text("Listes des annonces");
    }
  }

  Widget bodyPage(){
    return PageView(
      onPageChanged: (newValue){
        setState(() {
          index = newValue;
          pageIndex.jumpToPage(newValue);
        });
      },
      controller: pageIndex,
      children: [
        Center(
            child: listingAnnonces()
        ),

        Center(
          child: CreationAnnonce(),
        ),
        Center(
          child: MesAnnonces(),
        ),

      ],
    );


  }





}

