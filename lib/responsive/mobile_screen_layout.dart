import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileViewWidget extends StatefulWidget {
  const MobileViewWidget({super.key});

  @override
  State<MobileViewWidget> createState() => _MobileViewWidgetState();
}

class _MobileViewWidgetState extends State<MobileViewWidget> {
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("mobile view"));
  }
}
