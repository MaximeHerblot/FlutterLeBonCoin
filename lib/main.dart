import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_le_bon_coin/controller/CreationAnnonce.dart';
import 'package:flutter_le_bon_coin/controller/Dashboard.dart';
import 'package:flutter_le_bon_coin/firebase_options.dart';
import 'package:flutter_le_bon_coin/services/FirestoreHelper.dart';
import 'package:flutter_le_bon_coin/services/Permission.dart';
import 'package:flutter_le_bon_coin/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid || Platform.isIOS){
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyDwBuMxD1PWrlWE5NzO29-JFDmneUcTCqk',
        appId: '1:848914813672:web:fd1d82934aaaba6b86af5d',
        messagingSenderId: '848914813672',
        projectId: 'ipssi-flutter-le-bon-coin',
        authDomain: 'ipssi-flutter-le-bon-coin.firebaseapp.com',
        storageBucket: 'ipssi-flutter-le-bon-coin.appspot.com',
        measurementId: 'G-CPRYZ1TWET',
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le bon coin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Le bon coin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String mail;
  late String password;

  popUp(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              content: const Text("Email or password invalid"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok")
                )
              ],
            );
          }
          else {
            return AlertDialog(
              content: const Text("Email or password invalid"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok")
                )
              ],
            );
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: bodyPage()
    );
  }

  Widget bodyPage(){
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onChanged: (value){
              setState(() {
                mail = value;
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your mail',




            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onChanged: (value){
              setState(() {
                password = value;
              });
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your password',
            ),
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: (){
            print(mail);
            print(password);
            FirestoreHelper().connected(mail, password).then((value){
              print(value);
              MyAccount = value;
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return Dashboard();

                  }
              ));
            }).catchError((onError){
              //Afficher popUp
              popUp();

            });




          },
          child: const Text("Connexion"),
        ),
        TextButton(
            onPressed: (){
              // Fonction navigation inscription ici
            },
            child: const Text("Sign up")
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return CreationAnnonce();
            }));
          },
          child: const Text("create annonce"),
        )
      ],
    );
  }
}