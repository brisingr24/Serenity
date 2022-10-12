import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envision/models/postModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostService {
  List<PostModel> _postListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
        id: doc.id,
        text: doc.data()['text'] ?? '',
        creator: doc.data()['creator'] ?? '',
        timestamp: doc.data()['timestamp'] ?? '',
        likes: doc.data()['likes'] ?? '',
      );
    }).toList();
  }

  Future savePost(text) async {
    await FirebaseFirestore.instance.collection('posts').add({
      'text': text,
      'creator': FirebaseAuth.instance.currentUser?.uid,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  Stream<bool> getCurrentUserLike(PostModel post) {
    return FirebaseFirestore.instance
        .collection("posts")
        .doc(post.id)
        .collection("likes")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((snapshot) => snapshot.exists);
  }

  Future<int> getCountLike(PostModel post) async{
    int count = 0;
    await FirebaseFirestore.instance
        .collection("posts")
        .doc(post.id)
        .collection("likes")
        .get().then((value) => value.docs.forEach((element) {count++;}));
    return count;
  }

  Stream<List<PostModel>> getPostByUser(uid) {
    return FirebaseFirestore.instance
        .collection('posts')
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Future likePost(PostModel post, bool current) async {
    if (current) {
      await FirebaseFirestore.instance
          .collection("posts")
          .doc(post.id)
          .collection("likes")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .delete();
    }
    if (!current) {
      await FirebaseFirestore.instance
          .collection("posts")
          .doc(post.id)
          .collection("likes")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({});
    }
  }
}
