import 'package:findit/features/Posts/domain/entities/post_entity.dart';

abstract class GetPostRepo {
  Future<List<PostEntity>> getPosts();
}
