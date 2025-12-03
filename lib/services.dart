import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> addcon({
  required String name,
  required String phone,
  required BuildContext context,
}) async {
  try {
    await FirebaseFirestore.instance.collection("contacts").add({
      "name": name,
      "phone": phone,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Contact added successfully")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Stream<QuerySnapshot> getcon() {
  return FirebaseFirestore.instance.collection("contacts").snapshots();
}

Future<void> deletecon({
  required String id,
  required BuildContext context,
}) async {
  try {
    await FirebaseFirestore.instance.collection("contacts").doc(id).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("contact deleted succesfully")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> updatecon({
  required String id,
  required BuildContext context,
  required String name,
  required String phone,
}) async {
  try {
    await FirebaseFirestore.instance.collection("contacts").doc(id).update({
      "name": name,
      "phone": phone,
    });
    
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("contact updated succesfully")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
