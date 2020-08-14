import 'package:flutter/material.dart';
import 'package:bookstore/data.dart';
import 'package:bookstore/constants.dart';

class Bookstore extends StatefulWidget {
  @override
  _BookstoreState createState() => _BookstoreState();
}

class _BookstoreState extends State<Bookstore> {

  List<Filter> filters = getFilterList();
  Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.sort,
          color: kPrimaryColor,
          size: 28,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16,),
            child: Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 28,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 12,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  "Discover books",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 36,
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: buildFilters(size.width),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

  List<Widget> buildFilters(double width){
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildNavigationItem(filters[i], width / (filters.length + 1)));
    }
    return list;
  }

  Widget buildNavigationItem(Filter item, double width){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = item;
        });
      },
      child: Container(
        height: 50,
        child: Stack(
          children: <Widget>[

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 30,
                height: 3,
                color: selectedFilter == item ? kPrimaryColor : Colors.transparent,
              ),
            ),

            Center(
              child: Text(
                item.name,
                style: TextStyle(
                  color: selectedFilter == item ? kPrimaryColor : Colors.grey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget buildFilter(Filter filter){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter ? kPrimaryColor : Colors.grey[300],
            fontSize: 16,
            fontWeight: selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

}