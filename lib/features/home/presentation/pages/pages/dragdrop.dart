import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../../../app.dart';
import '../../../../../di.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/theme/widget_themes/text_field_theme.dart';

var uuid = Uuid();

GlobalKey ketStack = GlobalKey();

class MyDragAndDropWidget extends StatefulWidget {
  const MyDragAndDropWidget({Key? key}) : super(key: key);

  @override
  _MyDragAndDropWidgetState createState() => _MyDragAndDropWidgetState();
}

class _MyDragAndDropWidgetState extends State<MyDragAndDropWidget> {
  Color caughtColor = Colors.red;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable'),
        actions: [
          IconButton(
              onPressed: () {
                sl<SharedPreferences>()
                    .setString('ketStack', ketStack.toString());
              },
              icon: Icon(Icons.save))
        ],
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Draggable Widget
            SizedBox(
              width: 200,
              child: Container(
                color: AppColor.buttonDisabled,
                child: Column(
                    children: draggableList
                        .map<Widget>((e) => Draggable<MyWidgetTree>(
                              data: e
                      ,
                              feedback: Material(
                                child:customSelectWidget( e),
                              ),
                              child: Container(
                                width: 300,
                                height: 56,
                                color: Colors.blueGrey,
                                child: Center(
                                  child: Text(
                                    e.label,
                                  ),
                                ),
                              ),
                            ))
                        .toSet()
                        .toList()),
              ),
            ),

            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.ofWhite,
                    border: Border.all(color: AppColor.accent)),
                child: DragTarget<MyWidgetTree>(
                  onWillAcceptWithDetails: (data) {
                    return true;
                  },
                  onAcceptWithDetails: (data) {
                    double? xD = data.offset.dx - 26;
                    double? yD = data.offset.dy - 57;
                    data.data.key=    data.data.key + '_' + uuid.v1().toString();
                    MyWidgetTree _temp=MyWidgetTree(key:  data.data.key + '_' + uuid.v1().toString()
                    ,width:    data.data.width,height:    data.data.height,label:    data.data.label
                    );
                    widgetList.add(_temp);
                    setState(() {

                    });
                  },
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: Stack(

                          // runSpacing: 10.r,
                          // spacing: 10.r,
                          children: widgetList
                              .map((e) => e)
                              .map<Widget>((e1) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      customSelectWidget(   e1),

                                      PopupMenuButton(
                                        color: AppColor.white,
                                      //  padding: const EdgeInsets.all(8.0),
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: AppColor.primary,
                                          size: 30,
                                        ),
                                        itemBuilder: (BuildContext context1) =>
                                            <PopupMenuEntry>[
                                          ...List.generate(clintOptions.length,
                                              (index) {
                                            var item = clintOptions[index];
                                            return PopupMenuItem(
                                              enabled: item['visible'],
                                              onTap: () {
                                                onSelectOption(
                                                    item['option'], e1);
                                                setState(() {});
                                              },
                                              padding: EdgeInsets.zero,
                                              height: 50,
                                              labelTextStyle:
                                                  MaterialStateProperty.all(
                                                      TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              AppColor.dark)),
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColor.dark),
                                              child: Row(children: [
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                item['icon'],
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  item['title'],
                                                )
                                              ]),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ))
                              .toList(),
                          // List.generate(widgetList.length, (index) =>
                          //     Flex(
                          //       mainAxisSize: MainAxisSize.min,
                          //       direction: Axis.horizontal,
                          //       children: [
                          //
                          //         InkWell(onTap: (){
                          //           widgetList.remove(  widgetList.keys.map((e) => e).toSet().toList()[index]);
                          //           setState(() {
                          //
                          //           });
                          //
                          //         }, child: Icon(Icons.close,color: Colors.red,))
                          //       ],
                          //     ),
                          // )
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onSelectOption(SelectOption option, item) {
    switch (option) {
      case SelectOption.edit:
        updateItem(item);
      case SelectOption.delete:
        widgetList.remove(item);
    }
  }

  updateItem(MyWidgetTree item) {
    print(item.label);
    // bool isTextFiled =
    // item.label.toString().contains('TextFormField');
    MyWidgetTree? _temp = item;

    showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            item.key.split("_").first,
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColor.white, surfaceTintColor: AppColor.white,
          //   actionsPadding: EdgeInsets.all(20),
          content: Container(
            width: 500,
            height: 300,
            color: AppColor.white,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _temp?.label.toString(),
                  onChanged: (e) {
                    _temp?.label = e;
                  },
                ),
                TextFormField(
                  initialValue: (_temp?.width ?? 10).toString(),
                  validator: (e) {
                    if (e!.isEmpty) return "required";
                    if (double.tryParse(e) != null) return "required";
                  },
                  onChanged: (e) {
                    print(e);
                    _temp?.width = double.tryParse(e) ?? _temp?.width ?? 10;
                  },
                ),
                TextFormField(
                  initialValue: (_temp?.height ?? 10).toString(),
                  validator: (e) {
                    if (e!.isEmpty) return "required";
                    if (double.tryParse(e) != null) return "required";
                  },
                  onChanged: (e) {
                    _temp?.height = double.tryParse(e) ?? _temp?.height ?? 10;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      maximumSize: MaterialStateProperty.all(Size(100, 48)),
                      minimumSize: MaterialStateProperty.all(Size(100, 48)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.grey)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        maximumSize: MaterialStateProperty.all(Size(100, 48)),
                        minimumSize: MaterialStateProperty.all(Size(100, 48)),
                       // backgroundColor: MaterialStateProperty.all(AppColor.success)
                    ),
                    onPressed: () {

                      widgetList.forEach((element) {
                        print(element.key);
                      });

                      int i = widgetList.indexWhere((element) => element.key == item.key);
                      print('index: ${i}');
                      widgetList[i] = _temp!;


                      _temp = null;
                      // item.values.first['config']=_temp;
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child:  Text(
                      'YES',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),),
              ],
            ),
          ],
        );
      },
    );
  }List<MyWidgetTree> widgetList = [];
Widget customSelectWidget( date){

String _tempKey=  date.key;
MyWidgetTree _tempDate=  date;
  if(  _tempKey.contains("SizedBox")) {
  return MySizeBox(item: _tempDate,);
} else if(  _tempKey.contains("TextFormField")) {
 return MyTextFormField(item: _tempDate,);
}
 else if(  _tempKey.contains("Text")) {
  return MyText(item: _tempDate,);
}

else if(  _tempKey.contains("Divider")) {
  return Divider();
}


return SizedBox();
}
}


enum SelectOption {
  edit,
  delete,
}

List<Map<String, dynamic>> clintOptions = [
  {
    "icon": const Icon(
      Icons.edit,
      color: AppColor.primary,
    ),
    'title': 'edit',
    'visible': true,
    'option': SelectOption.edit,
  },
  {
    "icon": Icon(
      Icons.delete,
      color: AppColor.error,
    ),
    'title': 'delete',
    'visible': true,
    'option': SelectOption.delete,
  },
];
List draggableList = [
  MyWidgetTree(key: 'SizedBox' ,   label: 'Save',),
  MyWidgetTree(
      key: 'Text', width: 32, label: 'Add Label'),
  MyWidgetTree(
      key: 'TextFormField',
      height: 56.r,
      width: 300,
      label: 'input here... '),

  MyWidgetTree(
    key: 'Divider',   label: 'Divider',
  )
];

class MyText extends StatelessWidget {
  late MyWidgetTree item;
  MyText({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(
      item.label ?? 'label',
      style: TextStyle(fontSize: item.width),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  late MyWidgetTree item;
  MyTextFormField({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: item.width,
      height: item.height,
      decoration: BoxDecoration(
          color: Colors.transparent,
          //      color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,

          enabledBorder: const OutlineInputBorder(),
          border: const OutlineInputBorder(),
          //  focusedBorder:const OutlineInputBorder() ,
          // prefixIcon: Icon(
          //   Iconsax.search_normal,
          //   color: Theme.of(context).iconTheme.color,),
          hintText: item.label,
          hintStyle: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}

class MySizeBox extends StatelessWidget {
  MyWidgetTree item;
  final GlobalKey mySizeBox = GlobalKey();

  MySizeBox({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mySizeBox.currentContext?.size?.width,
      height: mySizeBox.currentContext?.size?.height,
    );
  }
}

class MyWidgetTree {
  late String key;
  String? label;
  double width;
  double height;
  late List<MyWidgetTree>? children;
  late MyWidgetTree? child;
  Map<String, dynamic>? prop = {};

  MyWidgetTree(
      {required this.key,
      this.label,
      this.width = 10,
      this.height = 50,
      this.children,
      this.child,
      this.prop});

  // MyWidgetTree.fromJson(date)
  //     : key = date['name'],
  //       profilePicture = doc['profile_picture'],
  //       email = (doc['email'] as String),
  //       super.fromFirestoreDocument();

  // @override
  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'profile_picture': profilePicture,
  //     'email': email,
  //   };
}
