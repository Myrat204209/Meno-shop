// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'address_model.g.dart';

/// Address model to store user addresses
@HiveType(typeId: 0)
class AddressModel extends Equatable with HiveObjectMixin {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String addressName;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final String phoneNumber;

  AddressModel({
    String? uuid,
    required this.addressName,
    required this.name,
    required this.address,
    required this.phoneNumber,
  }) : uuid = uuid ?? const Uuid().v4();

  @override
  List<Object?> get props => [
        uuid,
        name,
        address,
        addressName,
        phoneNumber,
      ];

  AddressModel copyWith({
    String? uuid,
    String? addressName,
    String? name,
    String? address,
    String? phoneNumber,
  }) {
    return AddressModel(
      uuid: uuid ?? this.uuid,
      addressName: addressName ?? this.addressName,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
