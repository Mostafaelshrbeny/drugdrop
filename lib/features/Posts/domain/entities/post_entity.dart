class PostEntity {
  final String userId;

  final String body;
  final int? imageUrl;
  final String phoneNumber;
  final String name;

  PostEntity(
      {required this.phoneNumber,
      required this.name,
      required this.userId,
      required this.body,
      this.imageUrl});
  factory PostEntity.fromFirestore(Map<String, dynamic> data) {
    return PostEntity(
        phoneNumber: data['phone'],
        name: data['name'],
        userId: data['userId'],
        body: data['body'],
        imageUrl: data['image']);
  }
}
