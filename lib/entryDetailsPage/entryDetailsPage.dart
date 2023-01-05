import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EntryDetailsPage extends StatefulWidget {
  const EntryDetailsPage({Key? key}) : super(key: key);

  @override
  State<EntryDetailsPage> createState() => _EntryDetailsPageState();
}

class _EntryDetailsPageState extends State<EntryDetailsPage> {

  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("user").snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

      ),
    );
  }
}
