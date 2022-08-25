import 'package:flutter/material.dart';
import 'package:flutter_le_bon_coin/controller/CreationAnnonce.dart';
import 'package:flutter_le_bon_coin/controller/MesAnnonces.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}


class DashboardState extends State<Dashboard>{
  int index=0;
  PageController pageIndex = PageController(initialPage: 0);
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
  listingAnnonces(){
    //Récupération des annonces
    return const Text("Annonces");
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

