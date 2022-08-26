import 'package:flutter_le_bon_coin/services/FirestoreHelper.dart';
import 'package:flutter_le_bon_coin/services/constants.dart';
import 'package:flutter_le_bon_coin/controller/Dashboard.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InscriptionState();
  }

}

class InscriptionState extends State<Inscription>{
  //varibales
  late String pseudo;
  late String mail;
  late String password;
  DateTime time = DateTime.now();


  //Méthode interne
  openCalendar() async {
    DateTime? dateSelected = await showDatePicker(
        context: context,
        initialDate: time,
        firstDate: DateTime(1940),
        lastDate: time
    );
    if(dateSelected != null && dateSelected != time){
      setState(() {
        time = dateSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Padding(
        child: bodyPage(),
        padding: const EdgeInsets.all(15)
      )

    );
  }


  Widget bodyPage(){

    return Column(
      children: [
        //Pseudo
        TextField(
          onChanged: (value){
            setState(() {
              pseudo = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre pseudo",
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
              mail = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre mail",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),

        const SizedBox(height: 10,),


        //password

        TextField(
          obscureText: true,
          onChanged: (value){
            setState(() {
              password = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre password",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),

        const SizedBox(height: 10,),

        ElevatedButton.icon(
          icon: const Icon(Icons.watch_later_rounded),
            onPressed: (){
          //Ouverture de calendrier
              openCalendar();
          },
            label:Text("${time.day}/${time.month}/${time.year}")
        ),
        const SizedBox(height: 10,),

        TextButton(
            onPressed: (){
              print(time);
              FirestoreHelper().inscription(mail, password, pseudo, time).then((value){
                MyAccount = value;
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return Dashboard(index: 0,);
                    }
                ));

              }).catchError((error){

              });

            },
            child: const Text("Enregistrer")
        ),
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Annuler")
        )


        //bouton de la date de naissance
      ],

    );
  }

}