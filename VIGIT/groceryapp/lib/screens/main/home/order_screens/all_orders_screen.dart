import 'package:flutter/material.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'All Orders',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Text(
                      "Sort By: Alphabetical",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <ListTile>[
                    const ListTile(
                      title: Text(
                        "Arabic Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        "#749347 (3 items)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        "Processing",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <ListTile>[
                    ListTile(
                      title: const Text(
                        "Arabic Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: const Text(
                        "#749347 (3 items)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "Rs. 180",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "29-03-2020",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Image.network(
                          "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                      title: const Text(
                        "Ginger",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'Quantity: ${4}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
