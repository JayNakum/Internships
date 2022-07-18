import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shambhoo/screens/main/home/items_screen/item_detail_screen.dart';

class ShopDetailPage extends StatefulWidget {
  const ShopDetailPage({Key? key}) : super(key: key);

  @override
  State<ShopDetailPage> createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Image.network(
                "https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvY2VyeXxlbnwwfHwwfHw%3D&w=1000&q=80"),
            Positioned(
              top: 0,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 5),
                                  ]),
                              child: Center(
                                child: Icon(
                                  Icons.chevron_left,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    title: Text(
                                      "Arabic Ginger",
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.visible,
                                    ),
                                    subtitle: Text(
                                      "Grocery & Supermarket",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/favourites.png",
                                  scale: 0.4,
                                ),
                                Flexible(
                                  child: ListTile(
                                    title: RichText(
                                      text: TextSpan(
                                        text: '${4.8} ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.green,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '(${256})',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    subtitle: const Text(
                                      'Reviews',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <RichText>[
                                    RichText(
                                      text: TextSpan(
                                        text: 'Delivery Time: ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "42 mins",
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Minimum Order: ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Rs. 400",
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Timings: ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "9 AM to 10:30 PM",
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade100,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade100,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.call_rounded,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.green,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  hintText: "Search this store",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 175, 80, 1)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 175, 80, 1)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 175, 80, 1)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 175, 80, 1)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 175, 80, 1)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 175, 80, 1)),
                                    borderRadius: BorderRadius.circular(100),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                            ),
                            child: Text(
                              'Offers',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(width: 12),
                                ...[1, 2, 3].map(
                                  (e) => Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    width: 253,
                                    height: 162,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                            ),
                            child: Text(
                              'Products',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    ...[1, 2, 3].map((e) => Container(
                                          width: 78,
                                          height: 98,
                                          margin: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                        ))
                                  ],
                                ),
                                Expanded(
                                  flex: 2,
                                  child: GridView.builder(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 17,
                                              crossAxisSpacing: 10,
                                              crossAxisCount: 2,
                                              childAspectRatio: 122 / 161),
                                      itemCount: 8,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailsScreen()));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                            ),
                            child: Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          ...[1, 2, 3].map((e) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 15),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Arabic Ginger",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(height: 7),
                                            RatingBar.builder(
                                              itemPadding: EdgeInsets.zero,
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 15,
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Shop No. 3, Tirupati Apartment, Shahar Road, East Mumbai Maharastra, 402928",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ))),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 191,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                  ),
                                  child: Text(
                                    'Store Details',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                  ),
                                  child: Text(
                                    "Shop No. 3, Tirupati Apartment, Shahar Road, East Mumbai Maharastra, 402928",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
