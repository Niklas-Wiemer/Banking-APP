import 'package:flutter/material.dart';
import 'package:myfirstapp/main.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Finanzübersicht',
      expandedValue: 'Sichteinlagen',
    );
  });
}

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartWidgetState();
}

class StartWidgetState extends State<StartWidget> {
  final List<Item> _data = generateItems(2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_buildHover(), _buildFinances()],
      ),
    );
  }

  Widget _buildFinances() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Gesamtsumme
              Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [Text('Gesamtsumme')],
                    ),
                    Column(
                      children: [
                        Card(
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text('1353.45€'),
                          ),
                          color: const Color.fromARGB(150, 10, 230, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _data[index].isExpanded = !isExpanded;
                    });
                  },
                  children: _data.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item.headerValue),
                        );
                      },
                      body: ListTile(
                        leading: Image.asset(
                          "images/img.png",
                          width: 32,
                        ),
                        title: Text(item.expandedValue),
                        subtitle: const Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          child: Text("DE18 4123 0345 2343 09\nNiklas Wiemer"),
                        ),
                        trailing: const Align(
                          widthFactor: 0,
                          alignment: Alignment.bottomRight,
                          child: Text("513,04 €",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                ),
              ),
              // Gesamtsumme
              Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [Text('Gesamtsumme')],
                    ),
                    Column(
                      children: [
                        Card(
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text('1353.45€'),
                          ),
                          color: const Color.fromARGB(150, 10, 230, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings),
                    Text("Finzanzübersicht bearbeiten")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHover() {
    List<ScrollItem> children = [
      ScrollItem(title: "Geld senden", icon: Icons.send),
      ScrollItem(title: "Geld anfordern", icon: Icons.request_page),
      ScrollItem(title: "Mobiles Bezahlen", icon: Icons.wifi),
      ScrollItem(title: "S-Invest", icon: Icons.bar_chart),
      ScrollItem(title: "Filiale suchen", icon: Icons.gps_fixed),
      ScrollItem(title: "Karte sperren", icon: Icons.sd_card_alert_outlined),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            physics: const BouncingScrollPhysics(),
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index) {
              return generateItem(children[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          )),
    );
  }

  _todo() {}

  Widget generateItem(ScrollItem item) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: FloatingActionButton(
              onPressed: _todo,
              child: Icon(item.icon),
            ),
          ),
          Text(
            item.title,
            textScaleFactor: 0.85,
          )
        ],
      ),
    );
  }
}

class ScrollItem {
  ScrollItem({
    required this.title,
    required this.icon,
  });

  String title;
  IconData icon;
}
