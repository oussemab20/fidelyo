
import 'package:flutter/material.dart';

class boutique_ha extends StatefulWidget {
  const boutique_ha({super.key});

  @override
  State<boutique_ha> createState() => _boutique_haState();
}

class _boutique_haState extends State<boutique_ha> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Boutique HA',
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
    body: ListView(
      padding: const EdgeInsets.all(16.0),
      children: [ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            padding: EdgeInsets.all(10),
            alignment:Alignment.center,
            child:
                Column(
                  children: <Widget>[
                   ElevatedButton(
                       onPressed: (){},
                       child: Text('Scannez votre code',style: TextStyle(color: Colors.white),),
                     style: ElevatedButton.styleFrom(
                       shape:RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(0)
                       ),
                       backgroundColor: Color(0xFF047857),

                     ),
                    ),
                    ],
                ),
          )
        ],
      ),
      ]
    ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
