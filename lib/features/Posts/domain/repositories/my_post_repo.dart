import 'package:findit/features/Posts/domain/entities/post_entity.dart';

abstract class MyPostRepo {
  Future<List<PostEntity>> getMyPosts();
}
