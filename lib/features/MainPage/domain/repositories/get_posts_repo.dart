import 'package:findit/features/Posts/domain/entities/post_entity.dart';

abstract class GetPostsRepo {
  Future<List<PostEntity>> getPosts({required String type});
}
