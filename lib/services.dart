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
