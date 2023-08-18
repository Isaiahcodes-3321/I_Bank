import 'package:hive/hive.dart';

import 'package:image_picker/image_picker.dart';
part 'person.g.dart';


@HiveType(typeId: 1)
class UserStorage {
  UserStorage({
    required this.name,
    required this.funds,
    required this.userImage,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  double funds;

  @HiveField(2)
  var userImage;
}

@HiveType(typeId: 2)
class ReceiverStorage {
  ReceiverStorage({
    required this.receiverName,
    required this.receiverAmount,
    required this.receiverNumber,
    required this.timeSent,
    required this.dateSent,
  });

  // receiver details
  @HiveField(0)
  final String receiverName;

  @HiveField(1)
  final String receiverAmount;

  @HiveField(2)
  final String receiverNumber;

  @HiveField(3)
  final String timeSent;

  @HiveField(4)
  final String dateSent;
}
