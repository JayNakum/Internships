import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'items_screen/shop_detail_screen.dart';
import 'items_screen/subcategory_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 330,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(76, 175, 80, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height:
                                MediaQuery.of(context).viewPadding.top + 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 21,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Good Morning",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      "Customer Name",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 116,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromRGBO(76, 175, 80, 1),
                                    ),
                                    Text("My Flat"),
                                    Icon(Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.green,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                hintText: "Search Category",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      options: CarouselOptions(height: 158.0),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(blurRadius: 5, color: Colors.grey)
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset("assets/images/banner.png"),
                            );
                          },
                        );
                      }).toList(),
                    )),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                "Stores",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SubCategoryScreen()));
                },
                child: Text(
                  "See all",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 7),
                ...[1, 2, 3, 4, 5].map((e) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShopDetailPage()));
                      },
                      child: Container(
                        width: 200,
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset("assets/images/store.png"),
                      ),
                    )),
                SizedBox(width: 7),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                "Featured Stores",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
              Text(
                "See all",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 7),
                ...[1, 2, 3, 4, 5].map((e) => Container(
                      width: 159,
                      height: 199,
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset("assets/images/stores.png"),
                    )),
                SizedBox(width: 7),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                "Offers",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 7),
                ...[1, 2, 3, 4, 5].map((e) => Container(
                      width: 253,
                      height: 162,
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(17)),
                      child: Image.asset("assets/images/offers.png"),
                    )),
                SizedBox(width: 7),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                "Categories",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 15),
          GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 78 / 100),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SubCategoryScreen(
                              category: "Product $index",
                            )));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(5)),
                        child: Image.asset("assets/images/categor.png"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Product $index",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                "Explore more Categories",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
              Text(
                "See all",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 7),
                ...[1, 2, 3, 4, 5].map((e) => Container(
                      width: 122,
                      height: 122,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset("assets/images/morCategories.png"),
                    )),
                SizedBox(width: 7),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
