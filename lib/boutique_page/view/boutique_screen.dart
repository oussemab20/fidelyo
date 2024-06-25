import 'package:flutter/material.dart';

class BoutiqueScreen extends StatefulWidget {
  const BoutiqueScreen({Key? key}) : super(key: key);

  @override
  State<BoutiqueScreen> createState() => _BoutiqueScreenState();
}

class _BoutiqueScreenState extends State<BoutiqueScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // Custom smaller height
        child: AppBar(
          backgroundColor: Color(0xFF047857), // Custom app bar color
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 14,
            ), // iOS style back arrow icon
            onPressed: () {
              Navigator.of(context).pop(); // Handle back navigation
            },
          ),
          title: Text(
            'Boutique',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ), // Title next to back arrow
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_on,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle notification action
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 34,
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                    decoration: InputDecoration(
                      hintText: 'Recherche ici',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.format_list_bulleted_sharp, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Retrouvez Votre Boutique"),
          ), // Small space under app bar
          SizedBox(height: 16.0), // Space under search bar
          Container(
            child: Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  // Placeholder data for each grid item
                  return GridItem(
                    imageUrl:
                    'https://ween.tn/media/cache/my_Logothumb/rc/6neXTaYc/uploads/image/22786/22784/avatar/avatar.jpg', // Replace with actual image path
                    title: 'Item $index', // Replace with actual title
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 0
                    ? Color(0xFF047857)
                    : Colors.transparent, // Active background color
                border: Border.all(
                  color: Color(0xFF047857), // Green border
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(Icons.home,
                  color: _currentIndex == 0
                      ? Colors.white
                      : Colors.black, // Icon color
                  size: 28), // Home icon
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 1
                    ? Color(0xFF047857)
                    : Colors.white, // Active background color
                border: Border.all(
                  color: Color(0xFF047857), // Green border
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(Icons.qr_code,
                  color: _currentIndex == 1
                      ? Colors.white
                      : Colors.black, // Icon color
                  size: 28), // QR code icon
            ),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 2
                    ? Color(0xFF047857)
                    : Colors.white, // Active background color
                border: Border.all(
                  color: Color(0xFF047857), // Green border
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(Icons.credit_card,
                  color: _currentIndex == 2
                      ? Colors.white
                      : Colors.black, // Icon color
                  size: 28), // Card icon
            ),
            label: 'Carte',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 3
                    ? Color(0xFF047857)
                    : Colors.white, // Active background color
                border: Border.all(
                  color: Color(0xFF047857), // Green border
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(Icons.person,
                  color: _currentIndex == 3
                      ? Colors.white
                      : Colors.black, // Icon color
                  size: 28), // Profile icon
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black, // Selected item label color
        unselectedItemColor: Colors.black, // Unselected item label color
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const GridItem({required this.imageUrl, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
        Border.all(color: Colors.grey), // Border around the whole container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: Colors.grey), // Gray border for title separation
              ),
            ),
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}