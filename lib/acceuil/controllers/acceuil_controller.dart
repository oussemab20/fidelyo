import 'package:flutter/material.dart';
import '../models/acceuil_models.dart';

class AcceuilController with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  SearchBarModel model = SearchBarModel();

  void onSearchChanged(String query) {
    model.searchQuery = query;
    notifyListeners();
  }

  List<ButtonModel> getButtons() {
    // Define your buttons here
    return [
      ButtonModel(title: 'Scannez',discription: 'Votre QR code ici', icon: Icons.qr_code_scanner, route: '/scan'),
      ButtonModel(title: 'Ma carte',discription: 'Fidélité', icon: Icons.credit_card, route: '/card'),
      ButtonModel(title: 'Mon profil',discription: '', icon: Icons.person, route: '/profile'),
      ButtonModel(title: 'Aide & support',discription: '', icon: Icons.help, route: '/support'),
    ];
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
