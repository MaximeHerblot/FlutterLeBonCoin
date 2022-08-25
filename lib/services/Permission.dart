
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {


  //Initialiser
  init() async {
    if (Platform.isAndroid) {
      PermissionStatus storage = await Permission.storage.status;
      checkStorage(storage);
    }
    else {
      PermissionStatus status = await Permission.photos.status;
      checkPhotos(status);
    }

    PermissionStatus location = await Permission.location.status;
    checkLocation(location);
  }


  //Vérifier la loclisation
  Future<PermissionStatus >checkLocation(PermissionStatus status) async{
    switch (status) {
      case PermissionStatus.permanentlyDenied :
        return Future.error("L'accès au gps est refusé");
      case PermissionStatus.denied :
        return await Permission.location.request().then((value) =>
            checkStorage(status));
      case PermissionStatus.limited :
        return await Permission.location.request().then((value) =>
            checkStorage(status));
      case PermissionStatus.restricted :
        return await Permission.location.request().then((value) =>
            checkStorage(status));
      case PermissionStatus.granted :
        return Future.error("L'accès au gps est accepté");
      default :
        return Future.error(
            "Vous n'avez pas de status pour l'accès au gps");
    }

  }


  //verifier les statuts des photos

  Future<PermissionStatus> checkStorage(PermissionStatus status) async {
    switch (status) {
      case PermissionStatus.permanentlyDenied :
        return Future.error("L'accès des photos est refusé");
      case PermissionStatus.denied :
        return await Permission.storage.request().then((value) =>
            checkStorage(status));
      case PermissionStatus.limited :
        return await Permission.storage.request().then((value) =>
            checkStorage(status));
      case PermissionStatus.restricted :
        return await Permission.storage.request().then((value) =>
            checkStorage(status));
      case PermissionStatus.granted :
        return Future.error("L'accès des photos est accepté");
      default :
        return Future.error(
            "Vous n'avez pas de status pour l'accès aux photos");
    }
  }


  Future<PermissionStatus> checkPhotos(PermissionStatus status) async {
    switch (status) {
      case PermissionStatus.permanentlyDenied :
        return Future.error("L'accès des photos est refusé");
      case PermissionStatus.denied :
        return await Permission.photos.request().then((value) =>
            checkPhotos(status));
      case PermissionStatus.limited :
        return await Permission.photos.request().then((value) =>
            checkPhotos(status));
      case PermissionStatus.restricted :
        return await Permission.photos.request().then((value) =>
            checkPhotos(status));
      case PermissionStatus.granted :
        return Future.error("L'accès des photos est accepté");
      default :
        return Future.error(
            "Vous n'avez pas de status pour l'accès aux photos");
    }
  }
}







