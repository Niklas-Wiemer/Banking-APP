import 'package:flutter/material.dart';
import 'package:myfirstapp/boxArea.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileWidgetState();
}

class ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    List<CategoryItem> benachrichtigungen = [
      CategoryItem(icon: Icons.local_post_office_outlined, text: "Postfach"),
      CategoryItem(icon: Icons.bookmark_border, text: "Merkzettel"),
      CategoryItem(icon: Icons.alarm, text: "Kontowecker"),
    ];
    List<CategoryItem> einstellungen = [
      CategoryItem(icon: Icons.settings, text: "App-Einstellungen"),
      CategoryItem(icon: Icons.bar_chart, text: "Auswertungen"),
    ];
    List<CategoryItem> zahlungsmethoden = [
      CategoryItem(icon: Icons.mobile_friendly, text: "Mobiles Bezahlen"),
      CategoryItem(icon: Icons.payment, text: "giropay | Kwitt"),
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 10, right: 10),
          children: [
            BoxAreaBuilder(
                    context, this, "Benachrichtigungen", benachrichtigungen)
                .build(),
            BoxAreaBuilder(context, this, "Einstellungen", einstellungen)
                .build(),
            BoxAreaBuilder(context, this, "Zahlungsmethoden", zahlungsmethoden)
                .build()
          ]),
    );
  }
}
