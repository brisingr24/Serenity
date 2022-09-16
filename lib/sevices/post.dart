import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envision/models/postModel.dart';
import '../models/postModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostService{

  List<PostModel> _postListFromSnapshot(QuerySnapshot<Map<String,dynamic>> snapshot){
    return snapshot.docs.map((doc) {
      return PostModel(
        id: doc.id,
        text: doc.data()['text'] ?? '',
        creator: doc.data()['creator'] ?? '',
        timestamp: doc.data()['timestamp'] ?? '',
      );
    }).toList();
  }
  Future savePost(text) async{
    await FirebaseFirestore.instance.collection('posts').add({
      'text':text,
      'creator':FirebaseAuth.instance.currentUser?.uid,
      'timestamp':FieldValue.serverTimestamp()
    });
  }
  Stream<List<PostModel>> getPostByUser(uid){
    return FirebaseFirestore.instance
        .collection('posts')
        .snapshots()
        .map(_postListFromSnapshot);
  }
}