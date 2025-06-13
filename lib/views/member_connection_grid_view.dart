
import 'package:family_gathering_v_0/models/member_conniction_way_model.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';

import '../widgets/custom_txt.dart';
import 'member_connection_grid_view_item.dart';


class MemberConnectionsGridView extends StatefulWidget {
   MemberConnectionsGridView({super.key,required this.connectionWaysMap});
  Map? connectionWaysMap={};

  @override
  State<MemberConnectionsGridView> createState() =>
      _MemberConnectionsGridViewState();
}

class _MemberConnectionsGridViewState extends State<MemberConnectionsGridView>
    with TickerProviderStateMixin {
  late AnimationController _connectionsMenuController;
  final bool _isMenuCollapsed = true;
  GlobalKey expansionTileKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _connectionsMenuController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();

    _connectionsMenuController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: expansionTileKey,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFFE0E0E0),
          width: 2.00,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16.00),
        ),
      ),
      trailing: IconButton(
        splashRadius: 50,
        iconSize: 100,
        onPressed: () {
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            title: Text('خربش على الكلام يا صاحبي'),
            autoCloseDuration: const Duration(seconds: 2),
          );
          // learn how to access a method of widget from out of the widget
          // if (_connectionsMenuController.status == AnimationStatus.dismissed) {
          //   //  _isMenuCollapsed= false;
          //   _connectionsMenuController.reset();
          //   _connectionsMenuController.animateTo(0.6);
          // } else {
          //   //  _isMenuCollapsed = true;
          //   _connectionsMenuController.reverse();
          // }
        },
        icon: Lottie.asset(Useanimations.menuV3,
            controller: _connectionsMenuController,
            height: 60,
            fit: BoxFit.fitHeight),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.00, vertical: 2.00),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.00),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
              width: 2.00,
              strokeAlign: BorderSide.strokeAlignInside,
            )),
        child: MyText(
          text: " طرق التواصل أو الاتصال",
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      children: [
        Container(
          height: 320,
          padding: const EdgeInsets.symmetric(horizontal: 8.00),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.00,
                mainAxisSpacing: 16.00),
            itemBuilder: (context, index) {
              MemberConnectionWayModel memberConnectionWayModel =
                  connectionWaysList[index];
              return MemberConnectionsGridViewItem(
                memberConnectionWayModel: memberConnectionWayModel,
              );
            },
            itemCount: connectionWaysList.length,
          ),
        ),
      ],
      onExpansionChanged: (bool isExpanded) {
        if (isExpanded || !_isMenuCollapsed) {
          _connectionsMenuController.forward();
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            title: Text('أيوا كدا ♥ عايزك كدا'),
            autoCloseDuration: const Duration(seconds: 2),
          );
        } else {
          _connectionsMenuController.reverse();
        }
      },
    );
  }
}
