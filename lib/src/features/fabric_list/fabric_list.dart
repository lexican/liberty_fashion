import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/api/api.dart';
import 'package:liberty_fashion/src/core/models/models.dart';
import 'package:liberty_fashion/src/features/fabric_list/fabric_card/fabric_card.dart';

class FabricList extends StatefulWidget {
  final String selectedId;
  const FabricList({Key? key, required this.selectedId}) : super(key: key);

  @override
  State<FabricList> createState() => _FabricListState();
}

class _FabricListState extends State<FabricList> {
  CollectionsApi collectionsApi = CollectionsApi();

  ProductModel? selectedfabric;

  void setSelectedFabric(product) {
    print("Faric set");
    setState(() {
      selectedfabric = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
    return Scaffold(
      body: StreamBuilder(
        stream: collectionsApi.getDocumentByCategoryId("22O0bRY5wWTTkiI83uJ5"),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            
            if (snapshot.data != null) {
              List<ProductModel> collections =
                  snapshot.data!.docs.map((DocumentSnapshot doc) {
                return ProductModel.fromSnapshot(doc);
              }).toList();

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: cardWidth / cardHeight,
                ),
                shrinkWrap: true,
                itemCount: collections.length,
                itemBuilder: (BuildContext context, int index) {
                  return FabricCard(
                    product: collections[index],
                    selectedId: widget.selectedId,
                    onFabricSelected: setSelectedFabric,
                  );
                },
              );
            }
          } else {
            return const SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
