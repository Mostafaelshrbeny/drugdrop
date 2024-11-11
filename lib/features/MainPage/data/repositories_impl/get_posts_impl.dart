import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findit/features/MainPage/domain/repositories/get_posts_repo.dart';
import 'package:findit/features/Posts/domain/entities/post_entity.dart';

class GetPostsImpl extends GetPostsRepo {
  @override
  Future<List<PostEntity>> getPosts({required String type}) async {
    List<PostEntity> posts = [];
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection(type).limit(100).get();
    for (var element in data.docs) {
      posts.add(
          PostEntity.fromFirestore(element.data() as Map<String, dynamic>));
    }
    return posts;
  }
}
