import 'package:findit/features/Posts/domain/entities/post_entity.dart';
import 'package:findit/features/Posts/domain/repositories/add_post_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPostRepoimpl extends AddPostRepo {
  @override
  Future<void> addPost(
      {required PostEntity post,
      required String userId,
      required String type}) async {
    CollectionReference posts = FirebaseFirestore.instance.collection(type);
    await posts.add({
      'userId': userId,
      'body': post.body,
      'phone': post.phoneNumber,
      'name': post.name,
      'image': post.imageUrl
    });
  }
}
