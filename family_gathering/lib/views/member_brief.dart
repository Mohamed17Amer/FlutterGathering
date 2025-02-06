import 'package:family_gathering/models/members_profile_model.dart';
import 'package:family_gathering/widgets/custom_svg_img.dart';
import 'package:family_gathering/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:lottie/lottie.dart';

class MemberBrief extends StatefulWidget {
  const MemberBrief({super.key, required this.memberModel});
  final MemberProfileModel memberModel;

  @override
  State<MemberBrief> createState() => _MemberBriefState();
}

class _MemberBriefState extends State<MemberBrief>
    with TickerProviderStateMixin {
  late AnimationController _favoriteController;
  late AnimationController _connectionsMenuController;

  @override
  void initState() {
    super.initState();

    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1), );
    _connectionsMenuController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    _favoriteController.dispose();
    _connectionsMenuController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.00, vertical: 8.00),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: const Color(0xFFE0E0E0),
            width: 1,
          )),
      leading: widget.memberModel.img == null
          ? MySvg(svgImgPath: "assets/images/member_img.svg")
          : MySvg(svgImgPath: widget.memberModel.img!),
      title: (widget.memberModel.name == null)
          ? MyText(text: "😁 مش عايز يقول أنا مين")
          : MyText(text: widget.memberModel.name!),
      subtitle: (widget.memberModel.fromAddress == null ||
              widget.memberModel.livingAddress == null)
          ? MyText(text: "😁 مش عايز يقول أنا منين ")
          : MyText(
              text:
                  " من ${widget.memberModel.fromAddress!} أعيش في ${widget.memberModel.livingAddress!}",
            ),
      trailing: IconButton(
        icon: Lottie.asset(


          Icons8.heart_color,
          controller: _favoriteController,
        ),
        onPressed: () {
          if (_favoriteController.status == AnimationStatus.dismissed) {
            _favoriteController.reset();
            _favoriteController.animateTo(.6);
          } else {
            _favoriteController.reverse();
          }
        },
      ),
    );
  }
}
