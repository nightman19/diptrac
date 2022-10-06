import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'location_model.dart';


class LocationDao{
  final CollectionReference collection = FirebaseFirestore.instance.collection('dropOffLocation');

  //Saving Pick Up location from cloud firestore
  void saveDropOffLocation(DropOffLocation dropOffLocation){
    collection.add(dropOffLocation.toJson());
  }

  //Retrieve Pick Up location from cloud firestore
  Stream<QuerySnapshot> getDropOffLocationStream(){
    return collection.snapshots();
  }
}