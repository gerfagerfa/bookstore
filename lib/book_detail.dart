import 'package:bookstore/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/data.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetail extends StatelessWidget {

  final Book book;

  BookDetail({@required this.book});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: [

          Container(
            child: Hero(
              tag: book.title,
              child: Image.asset(
                book.image,
                fit: BoxFit.fitWidth
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 32, left: 16,),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.5,
              padding: EdgeInsets.only(top: 64),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(
                    book.title,
                    style: GoogleFonts.catamaran(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),

                  Text(
                    book.author.fullname,
                    style: GoogleFonts.catamaran(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [

                        Row(
                          children: <Widget>[

                            Icon(Icons.star, size: 20, color: kStarsColor,),
                            Icon(Icons.star, size: 20, color: kStarsColor,),
                            Icon(Icons.star, size: 20, color: kStarsColor,),
                            Icon(Icons.star, size: 20, color: kStarsColor,),
                            Icon(Icons.star_half, size: 20, color: kStarsColor,),

                          ],
                        ),

                        SizedBox(
                          width: 12,
                        ),

                        Text(
                          book.score,
                          style: GoogleFonts.catamaran(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Text(
                        book.description,
                        style: GoogleFonts.catamaran(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 100,
                    color: Colors.white,
                  ),

                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 32, bottom: (size.height * 0.5) - (75 / 2)),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(book.author.image), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}