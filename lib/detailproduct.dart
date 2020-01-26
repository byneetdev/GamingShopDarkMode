import 'package:ecommerce1/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProduct extends StatelessWidget {
  final Product product;
  DetailProduct({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick up",
          style: GoogleFonts.roboto(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: product.name,
                      child: Image.network(product.urlimage, fit: BoxFit.fill),
                    ),
                    Text(
                      product.name,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[100],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      product.description,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      )),
                    ),
                    SizedBox(height: 17),
                    SizedBox(
                      width: 220,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        onPressed: () {},
                        color: Colors.purpleAccent,
                        child: Text(
                          "Add to Cart",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
