class UserEntity {
  final String name;
  final String email;
  final String uid;
  final String phoneNumber;
  final bool isDoctor;

  UserEntity(
      {required this.name,
      required this.email,
      required this.uid,
      required this.phoneNumber,
      required this.isDoctor});
  factory UserEntity.fromFirestore(Map<String, dynamic> data) {
    return UserEntity(
        name: data['name'],
        email: data['email'],
        uid: data['uid'],
        phoneNumber: data['phoneNumber'],
        isDoctor: data['isDoctor']);
  }
}
