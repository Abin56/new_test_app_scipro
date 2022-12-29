import 'package:hive/hive.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 1)
class DBStudentList {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final String subject;
  @HiveField(3)
  final String mobilenumber;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final String? email;
    @HiveField(6)
  final String? pincode;

  DBStudentList({
    required this.name,
    required this.address,
    required this.subject,
    required this.mobilenumber,
    required this.image,
    required this.email,
    required this.pincode,
  });
}
