import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_icons.dart';


class CustomCard extends StatefulWidget {
  CustomCard({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool ontap = false;
  List text = [
    "UI/UX Designer",
    "Ilustrator Designer",
    "Developer",
    "Management",
    "Information Technology",
    "Research and Analytics",
  ];
  List<IconData> icon = [
    CustomIcons.bezier,
    CustomIcons.pen_tool_2,
    CustomIcons.code,
    CustomIcons.graph,
    CustomIcons.monitor_mobbile,
    CustomIcons.cloud_add,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 156,
      decoration: BoxDecoration(
          color: ontap == true ? Color(0xffD6E4FF) : Color(0xffFAFAFA),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
              color: ontap == true ? Color(0xff3366FF) : Color(0xffD1D5DB))),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: InkWell(
          onTap: () {
            setState(() {
              ontap = !ontap;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              CircleAvatar(
                backgroundColor: ontap == true
                    ? const Color(0xff3366FF)
                    : const Color(0xffD1D5DB),
                radius: 25,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Icon(
                      icon[widget.index],
                      color: ontap == true
                          ? const Color(0xff3366FF)
                          : Colors.black,
                    )
                    // Image.asset(widget.image)
                    ),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(text[widget.index], style: const TextStyle(fontSize: 16)),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCity extends StatefulWidget {
  CustomCity({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;

  @override
  State<CustomCity> createState() => _CustomCityState();
}

class _CustomCityState extends State<CustomCity> {
  bool ontap = false;
  List city = [
    "United States",
    "Malaysia",
    "Singapore",
    "Indonesia",
    "Philiphines",
    "Polandia",
    "India",
    "Vietnam",
    "China",
    "Canada",
    "Saudi Arabia",
    "Argentina",
    "Brazil"
  ];
  List flag = [
    "lib/images/cities/united states.png",
    "lib/images/cities/malaysia.png",
    "lib/images/cities/singapore.png",
    "lib/images/cities/indonesia.png",
    "lib/images/cities/philiphines.png",
    "lib/images/cities/polandia.png",
    "lib/images/cities/india.png",
    "lib/images/cities/vietnam.png",
    "lib/images/cities/china.png",
    "lib/images/cities/canada.png",
    "lib/images/cities/saudi arabia.png",
    "lib/images/cities/argentina.png",
    "lib/images/cities/brazil.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 16),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
            color: ontap == true ? Color(0xffD6E4FF) : Color(0xffFAFAFA),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(
                color: ontap == true ? Color(0xff3366FF) : Color(0xffE5E7EB))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              setState(() {
                ontap = !ontap;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor:
                      ontap == true ? Color(0xff3366FF) : Color(0xffE5E7EB),
                  radius: 13,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 12,
                    child: Image.asset(flag[widget.index]),
                    // Image.asset(widget.image)
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(city[widget.index], style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
