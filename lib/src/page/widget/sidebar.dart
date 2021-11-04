import 'package:admin_flutter/src/page/widget/sidebarItem.dart';
import 'package:admin_flutter/src/repository/preference.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

class SidebarPage extends StatefulWidget {
  final Widget? child;
  const SidebarPage({Key? key, this.child}) : super(key: key);

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem>? _items;
  AssetImage _avatarImg = AssetImage('images/user.png');

  String user = 'User Logged';

  @override
  void initState() {
    super.initState();
    _items = generateItems;
    getName().then((value) => user = value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CollapsibleSidebar(
        body: widget.child!,
        isCollapsed: true,
        items: _items!,
        avatarImg: _avatarImg,
        title: user,
        borderRadius: 0.0,
        toggleTitle: '',
        backgroundColor: Colors.white,
        selectedTextColor: Colors.white,
        selectedIconColor: Colors.white,
        unselectedTextColor: Colors.black,
        unselectedIconColor: Colors.black45,
        sidebarBoxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }
}
