class ConnectionWayModel {
  ConnectionWayModel({
    required this.contactImgPath,
    required this.onContactWayPressed,
  });
  final String contactImgPath;
  final void Function() onContactWayPressed;
}
