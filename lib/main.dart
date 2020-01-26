import 'package:ecommerce1/detailproduct.dart';
import 'package:ecommerce1/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaming Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Text("Byneet Dev\nMarketplace",
                style: GoogleFonts.bioRhyme(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ))),
            SizedBox(height: 27),
            Container(
              width: double.infinity,
              height: 40,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                unselectedLabelColor: Colors.white60,
                labelStyle: TextStyle(fontWeight: FontWeight.w800),
                tabs: <Widget>[
                  Tab(text: "Popular"),
                  Tab(text: "Recommended"),
                  Tab(text: "Newest"),
                  Tab(text: "Keyboard"),
                  Tab(text: "Headset"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width +
                  kBottomNavigationBarHeight,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  PopularItem(),
                  Center(
                    child: Text("Recommended"),
                  ),
                  Center(
                    child: Text("Newest"),
                  ),
                  Center(
                    child: Text("Keyboard"),
                  ),
                  Center(
                    child: Text("Headset"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class PopularItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dummyProduct.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        final data = dummyProduct[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduct(
                          product: data,
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: data.name,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(data.urlimage),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rp. ${data.price}",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
