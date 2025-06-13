import 'package:hive/hive.dart';



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
   String? fromAddress;
  @HiveField(4)
   String? livingAddress;

   Map<String?, dynamic>? memberConnectionMap;

  MemberProfileModel( {
    this.img,
    this.name,
    this.phone,
    this.fromAddress,
    this.livingAddress,
    this.memberConnectionMap,
  });



}


