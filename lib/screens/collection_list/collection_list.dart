import 'package:flutter/material.dart';
import 'package:liberty_fashion/models/build_grid_item.dart';
import 'package:liberty_fashion/utils/parameters.dart';
import 'package:liberty_fashion/widgets/build_list_item_card.dart';

class CollectionList extends StatefulWidget {
  const CollectionList({Key? key}) : super(key: key);

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  final List<BuildGridItem> _buildListItem = <BuildGridItem>[
    BuildGridItem("assets/images/men.png", "Men", "Men Collection"),
    BuildGridItem("assets/images/women.png", "Women", "Women Collection"),
    BuildGridItem(
        "assets/images/children.png", "Children", "Children Collection"),
    BuildGridItem("assets/images/fabrics.png", "Fabrics", "Fabrics"),
    BuildGridItem("assets/images/trending.jpg", "Trending", "Trending"),
    BuildGridItem(
        "assets/images/tailor.jpg", "Tailor's Profile", "Tailor's Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: Colors.white,
        title: const Text(
          "Fashion App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Parameters.primaryColor,
            ),
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
        leading: const Icon(
          Icons.ac_unit,
          color: Parameters.primaryColor,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Explore collection",
                  style: TextStyle(fontSize: 18, fontFamily: "SegoeUi"),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                controller: ScrollController(keepScrollOffset: false),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                primary: false,
                children: _buildListItem
                    .map((item) => BuildListItemCard(
                          item: item,
                          onTap: () {},
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
