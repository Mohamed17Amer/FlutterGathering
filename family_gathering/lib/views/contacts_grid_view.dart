import 'package:family_gathering/models/contact_way_model.dart';
import 'package:family_gathering/reusables_and_constatnts/constants.dart';
import 'package:family_gathering/views/contact_grid_view_item.dart';
import 'package:family_gathering/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:lottie/lottie.dart';

class ConnectionsGridView extends StatefulWidget {
  const ConnectionsGridView({super.key});

  @override
  State<ConnectionsGridView> createState() => _ConnectionsGridViewState();
}

class _ConnectionsGridViewState extends State<ConnectionsGridView>
    with TickerProviderStateMixin {
  late AnimationController _connectionsMenuController;

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
            if (_connectionsMenuController.status ==
                AnimationStatus.dismissed) {
              _connectionsMenuController.reset();
              _connectionsMenuController.animateTo(0.6);
            } else {
              _connectionsMenuController.reverse();
            }
          },
          icon: Lottie.asset(Useanimations.menuV3,
              controller: _connectionsMenuController,
              height: 60,
              fit: BoxFit.fitHeight),
        ),
        title: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 10.00, vertical: 2.00),
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
                ConnectionWayModel connectionWayModel = connectionWaysList[index];
                return ConnectionsGridViewItem(
                  connectionWayModel: connectionWayModel,
                );
              },
              itemCount: connectionWaysList.length,
            ),
          ),
        ]);
  }
}
