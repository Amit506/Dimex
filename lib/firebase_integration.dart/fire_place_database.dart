import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';


 FirebaseFirestore firestore = FirebaseFirestore.instance;
class FireStoreData{
  final String uid;
  FireStoreData({this.uid});


 
final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('PlaceFireData');

      void  likeAndgoingToEvent(String uid,int like,int people)async{
        userCollection.add({
          'likes': like,
          'People':people,
        });
      }

 

}