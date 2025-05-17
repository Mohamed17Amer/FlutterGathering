import 'package:hive/hive.dart';

import 'address_model.dart';


part 'members_profile_model.g.dart';
@HiveType(typeId: 0)
class MemberProfileModel extends HiveObject {
  @HiveField(0) 
   String? img;
  @HiveField(1)
   String? name;
  @HiveField(2)
    String? phone;

  @HiveField(3)
   AddressModel? fromAddress;
  @HiveField(4)
   AddressModel? livingAddress;

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


