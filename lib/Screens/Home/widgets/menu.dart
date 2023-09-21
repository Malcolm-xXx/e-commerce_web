import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/constants.dart';
import 'package:flutter_ecommerce_web/responsive.dart';

class Navigation extends StatelessWidget {
   const Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: kMaxWidth,
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.menu)),
                      //title
                      AutoSizeText(
                        "Wellens-Gadgets",
                        maxLines: 1,
                        minFontSize: 16,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width >= 348
                              ? 22
                              : 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),

                      const Spacer(),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color:Colors.grey.withOpacity(0.3))
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color:Colors.black,
                                ),

                                hintText: "Search",

                                hintStyle:
                                TextStyle (
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),

                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),

                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),

                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.search,
                      //     color: kDarkgreyColor,
                      //     size: 25,
                      //   ),
                      // ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: kDarkgreyColor,
                          size: 25,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_outline,
                          color: kDarkgreyColor,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WebMenu extends StatelessWidget {

  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  final GlobalKey _menuKey = GlobalKey();

  WebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuItems(
          //isActive: true,
          title: 'Home',
          press: () {
            showDropdown(context);},
        ),
        MenuItems(
          title: 'Products',
          press: () {},
        ),
        MenuItems(
          title: 'Category',
          press: () {},
        ),
        MenuItems(
          title: 'Contact Us',
          press: () {},
        ),
      ],
    );
  }
  void showDropdown(BuildContext context) async {
    
    final RenderBox popupMenuRenderBox =
    _menuKey.currentContext!.findRenderObject() as RenderBox;
    final popupMenuWidth = popupMenuRenderBox.size.width;

    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        popupMenuRenderBox.localToGlobal(Offset.zero, ancestor: overlay),
        popupMenuRenderBox.localToGlobal(popupMenuRenderBox.size.bottomLeft(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );


    final result = await showMenu<String>(
      context: context,
      position: position,
      items: dropdownItems.map((String value) {
        return PopupMenuItem<String>(
          value: value,
          child: Text(value),
          onTap: () {},
        );
      }).toList(),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    // if (result != null) {
    //   setState(() {
    //     dropdownValue = result;
    //   });
    // },
  }
}

class MobMenu extends StatelessWidget {
  const MobMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MenuItems(
              //isActive: true,
              title: 'Home',
              press: () {},
            ),
            MenuItems(
              title: 'Products',
              press: () {},
            ),
          ],
        ),
        Row(
          children: [
            MenuItems(
              title: 'Category',
              press: () {},
            ),
            MenuItems(
              title: 'Contact Us',
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class MenuItems extends StatefulWidget {
  final String title;
  final VoidCallback press;
  final bool isActive;
  const MenuItems(
      {Key? key,
      required this.title,
      required this.press,
      this.isActive = false})
      : super(key: key);

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: widget.press,
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: widget.isActive == true
                          ? kPrimaryColor
                          : isHover
                              ? kPrimaryColor
                              : Colors.transparent,
                      width: 4))),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: widget.isActive == true
                  ? FontWeight.bold
                  : isHover
                      ? FontWeight.bold
                      : FontWeight.normal,
              fontSize: _size.width >= 370 ? 18 : 14,
              color: widget.isActive == true
                  ? kPrimaryColor
                  : isHover
                      ? kPrimaryColor
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
