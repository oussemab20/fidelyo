
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../controllers/acceuil_controller.dart';
import '../models/acceuil_models.dart';

class AcceuilPage extends StatefulWidget {
  @override
  _AcceuilPageState createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AcceuilController(), // Provide your controller
      child: Scaffold(
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
            'Acceuil',
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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

              SizedBox(height: 16), // Space below the search bar
              Container(
                width: 385,
                height: 139,
                decoration: BoxDecoration(
                  color: Colors.black,

                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Recherchez Votre Boutique',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 238,
                      height: 139,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/rech boutique.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16), // Space between the container and buttons
              Consumer<AcceuilController>(
                builder: (context, controller, child) {
                  final buttons = controller.getButtons();
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: buttons.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, buttons.elementAt(index).route ?? ''); // Navigate to the specified route
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF047857)), // Border color
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 15, bottom: 15
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      buttons.elementAt(index).title ?? '',
                                      style: TextStyle(
                                        color: Colors.black, // Text color
                                        fontSize: 25, // Font size
                                        fontWeight: FontWeight.bold, // Bold text
                                      ),
                                    ),
                                    Text(
                                      buttons.elementAt(index).discription ?? '',
                                      style: TextStyle(
                                        color: Colors.black, // Text color
                                        fontSize: 18, // Font size
                                        fontWeight: FontWeight.normal, // Bold text
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Color(0xFF047857),
                                height: MediaQuery.of(context).size.height * 0.11,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12
                                ),
                                child: Icon(buttons.elementAt(index).icon,color: Colors.white,size: 35,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),

            ],
          ),
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
      ),
    );
  }

  // Helper method to build navigation buttons
}

