import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class MyDropdownMenu extends StatelessWidget {
  String dropdownValue = 'Option 1';

  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  final GlobalKey _menuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              showDropdown(context);
            },
            child: Container(
              key: _menuKey,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(dropdownValue),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
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

// class MyDropdownButton extends StatelessWidget {
//   final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
//   final String dropdownValue = 'Option 1';
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showDropdown(context);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(dropdownValue),
//             SizedBox(width: 10),
//             Icon(Icons.arrow_drop_down),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showDropdown(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 200,
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               //Text('Select an option'),
//               SizedBox(height: 20),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: dropdownItems.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       title: Text(dropdownItems[index]),
//                       onTap: () {
//                         Navigator.pop(context, dropdownItems[index]);
//                         // Do something with the selected value
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ).then((selectedValue) {
//       if (selectedValue != null) {
//         // Do something with the selected value
//       }
//     });
//   }
// }
