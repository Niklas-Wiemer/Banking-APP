import 'package:flutter/material.dart';
import 'package:myfirstapp/start.dart';

class CategoryItem {
  CategoryItem({
    required this.icon,
    required this.text,
  });

  IconData icon;
  String text;
}

class BoxAreaBuilder {
  BuildContext context;
  State state;

  String? category;
  List<CategoryItem> items;

  BoxAreaBuilder(this.context, this.state, this.category, this.items);

  BoxAreaBuilder.withoutCategory(this.context, this.state, this.items)
      : category = null;

  Widget build() {
    List<Widget> list = [];

    for (int i = 0; i < items.length; i++) {
      list.add(_buildRow(items[i]));
      if (i + 1 < items.length) list.add(_buildDivider());
    }

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          if (category != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(category!, textScaleFactor: 1.3),
            ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45,
              boxShadow: const [
                BoxShadow(color: Colors.white38, spreadRadius: 1),
              ],
            ),
            child: Column(
              children: list.map((item) {
                return item;
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRow(CategoryItem item) {
    return ListTile(
      leading: Icon(item.icon, size: 24),
      title: Text(item.text, textScaleFactor: 1.2),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
        size: 24,
      ),
      dense: true,
      onTap: () {
        state.setState(() {
          Navigator.of(context).popUntil((route) => route.isFirst);
        });
      },
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
      color: Colors.white38,
      height: 2,
    );
  }
}
