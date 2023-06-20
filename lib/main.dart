import 'package:flutter/material.dart';
import 'package:list_assigment/list.dart';
import 'package:list_assigment/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Appbar(),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[
      Container(
        color: Colors.amber,
        height: 200,
        width: 200,
      ),
      Container(
        color: Colors.black,
        height: 200,
        width: 200,
      ),
      Container(
        color: Colors.blue,
        height: 200,
        width: 200,
      ),
      Container(
        color: Colors.red,
        height: 200,
        width: 200,
      ),
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<Widget> tabItems = const [
      Text(
        'Meals',
        style: TextStyle(
          color: Colors.black38,
        ),
      ),
      Text(
        'Sides',
        style: TextStyle(
          color: Colors.black38,
        ),
      ),
      Text(
        'Snacks',
        style: TextStyle(color: Colors.black),
      ),
    ];

    List<Widget> tabBarViewItem = [
      ListView.builder(
        itemCount: ProductsList.products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage(ProductsList.products[index].imageAssetPath),
            ),
            title: Text(
              ProductsList.products[index].price.toString(),
            ),
            subtitle: Text(ProductsList.products[index].title),
            trailing: Text(
              ProductsList.products[index].description,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.028,
              ),
            ),
          );
        },
      ),
      GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisExtent: 20,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite,
        ),
      ),
    ];

    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.orange,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              label: 'arrow',
              icon: Icon(
                Icons.arrow_outward,
                color: Colors.black,
              ),
            ),
          ],
        ),
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Our Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart, color: Colors.black),
            ),
          ],
          bottom: TabBar(
            tabs: tabItems,
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: tabBarViewItem,
          ),
        ),
      ),
    );
  }
}
