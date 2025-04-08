import "package:flutter/material.dart";
import "../service/api.dart";
import "../widgets/category.dart";

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {

  String catUrl = 'https://api.escuelajs.co/api/v1/categories';

  List categories = [];

  void fetchCategories() async {
    final response = await APIService.get(catUrl);

    print(response);
    
    if(response != null) {
      response.data.forEach((el) {
        setState(() {
          categories.add(el);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
        actions: [
          IconButton(
            icon: Icon(Icons.flag),
            onPressed: () {
              print("Fetching categories...");
              
            }
          )
        ]
      ),
      body: categories.length > 0 ? ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          Map cat = categories[index];

          return CategoryWidget(
            title: cat['name'],
            imageUrl: cat['image'],
          );
        }
      ) : Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}
