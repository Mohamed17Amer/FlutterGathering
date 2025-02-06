import 'package:family_gathering/models/address_model.dart';

class MemberProfileModel {
  final String? img;
  final String? name;
  final String? phone;

  final AddressModel? fromAddress;
  final AddressModel? livingAddress;

  final Map<String?, String?>? contactMP;

  MemberProfileModel({
    this.img,
    this.name,
    this.phone,
    this.fromAddress,
    this.livingAddress,
    this.contactMP,
  });



}


