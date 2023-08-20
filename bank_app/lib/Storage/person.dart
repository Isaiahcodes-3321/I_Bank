import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
part 'person.g.dart';


// Storage for user
@HiveType(typeId: 1)
class UserStorage {
  UserStorage({
    required this.name,
    required this.funds,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  int funds;
}


// Storage for Receiver who money has been sent to 
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


// Storage for user Profile image
@HiveType(typeId: 3)
class UserStorageImage {
  UserStorageImage({
    required this.userImage,
  });

  @HiveField(0)
  Uint8List userImage;
}

// flutter packages pub run build_runner build
