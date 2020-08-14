import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.book),
    NavigationItem(Icons.local_library),
    NavigationItem(Icons.person),
  ];
}

class Book {

  String title;
  String description;
  String author;
  String score;
  String image;

  Book(this.title, this.description, this.author, this.score, this.image);

}

List<Book> getBookList(){
  return <Book>[
    Book(
      "The Martian Chronicles",
      "The strange and wonderful tale of man's experiences on Mars, filled with intense images and astonishing visions. Now part of the Voyager Classics collection.",
      "Ray Bradbury",
      "4.14",
      "assets/images/the_martian_chronicles",
    ),
  ];
}

class Author {

  String fullname;
  int books;
  String image;


  Author(this.fullname, this.books, this.image);

}

List<Author> getAuthorList(){
  return <Author>[
    Author(
      "Philip K. Dick",
      44,
      "assets/images/hertz.png",
    ),
    Author(
      "Ray Bradbury",
      56,
      "assets/images/avis.png",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("CLASSICS"),
    Filter("NEW"),
    Filter("UPCOMING"),
  ];
}