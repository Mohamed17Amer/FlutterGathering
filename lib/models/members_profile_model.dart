import 'package:hive/hive.dart';

import 'address_model.dart';


part 'members_profile_model.g.dart';
@HiveType(typeId: 0)
class MemberProfileModel extends HiveObject {
  @HiveField(0) 
  final String? img;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? phone;

  @HiveField(3)
  final AddressModel? fromAddress;
  @HiveField(4)
  final AddressModel? livingAddress;

   Map<String?, String?>? memberConnectionMap;

  MemberProfileModel( {
    this.img,
    this.name,
    this.phone,
    this.fromAddress,
    this.livingAddress,
    this.memberConnectionMap,
  });



}


