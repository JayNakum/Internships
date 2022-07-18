import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: FloatingActionButton(
          elevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -530,
            child: Container(
              height: 900,
              width: 900,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 245, 247, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                Image.network(
                  "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png",
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  children: [
                    Text(
                      "Red Capsicum",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          color: Colors.grey[100], shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "4",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "Rs. 60/kg",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.green),
                ),
                Text(
                  "Arabic Ginger",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                SizedBox(height: 40),
                GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            crossAxisCount: 2,
                            childAspectRatio: 163 / 73),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.withOpacity(0.5))),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.circle,
                                color: Colors.grey.withOpacity(0.3),
                                size: 60,
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "100%",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Organic",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Expanded(child: SizedBox()),
                Container(
                  width: MediaQuery.of(context).size.height,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
