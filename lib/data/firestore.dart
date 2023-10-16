import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/model/note.dart';
import 'package:uuid/uuid.dart';

class FirebaseDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser(String email) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({"id": _auth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> AddNote(
      String description, DateTime dateTime, String category) async {
    if (description.length == 0) {
      return true;
    }
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        'id': uuid,
        'description': description,
        'isDone': false,
        'time': DateUtils.dateOnly(dateTime),
        'category': category,
      });
      return true;
    } catch (e) {
      print('AddNote error: $e');
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notesList = _extractNotesFromSnapshot(snapshot);
      return notesList;
    } catch (e) {
      print('getNotes errors: $e');
      return [];
    }
  }

  List _extractNotesFromSnapshot(AsyncSnapshot snapshot) {
    return snapshot.data!.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Note.fromJson(data);
    }).toList();
  }

  List getWorkNotes(AsyncSnapshot snapshot) {
    try {
      final allNotes = _extractNotesFromSnapshot(snapshot);
      final workNotes =
          allNotes.where((note) => note.category == "Work").toList();
      return workNotes;
    } catch (e) {
      print('getWorkNotes errors: $e');
      return [];
    }
  }

  List getCategoryNotes(AsyncSnapshot snapshot,String category) {
    try {
      final allNotes = _extractNotesFromSnapshot(snapshot);
      final workNotes =
          allNotes.where((note) => note.category == category).toList();
      return workNotes;
    } catch (e) {
      print('getCategoryNotes errors: $e');
      return [];
    }
  }

  List geStudyNotes(AsyncSnapshot snapshot) {
    try {
      final allNotes = _extractNotesFromSnapshot(snapshot);
      final workNotes =
          allNotes.where((note) => note.category == "Study").toList();
      return workNotes;
    } catch (e) {
      print('getStudyNotes errors: $e');
      return [];
    }
  }

  // AsyncSnapshot snapshot{
  //   return snapshot().
  // }

  Stream<QuerySnapshot> stream() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .snapshots();
  }

  Future<bool> isdone(String uuid, bool isDone) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({'isDone': isDone});
      return true;
    } catch (e) {
      print('isDone errors: $e');
      return true;
    }
  }

  Future<bool> updateTask(String uuid, String description) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({'description': description});
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.SNACKBAR);
      print('updateTask errors: $e');
      return true;
    }
  }

  Future<bool> updateDeadline(String uuid, Timestamp time) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({'time': time});
      return true;
    } catch (e) {
      print('updateDeadline error :$e');

      return true;
    }
  }

  Future<bool> deleteTask(String uuid) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .delete();
      return true;
    } catch (e) {
      print('DeleteTask error: $e');
      return true;
    }
  }

  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }
}
