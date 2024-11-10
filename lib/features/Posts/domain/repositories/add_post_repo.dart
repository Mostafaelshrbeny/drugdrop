import 'package:findit/features/Posts/domain/entities/post_entity.dart';

abstract class AddPostRepo {
  Future<void> addPost(
      {required PostEntity post, required String userId, required String type});
}
