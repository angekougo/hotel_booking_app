import 'package:hotel_booking_app/data/models/room.dart';

class MockData {

  static List<Room> getInkWellCarrouselData(){
    return [
      Room(
        id: '1',
        title: 'Abidjan',
        description: "Cette chambre a pour particularité de représenter Abidjan ville de la Côte d'Ivoire.",
        price: 90000,
        imageUrl: 'assets/images/rooms/c1.jpg',
        
      ),
      Room(
        id: '2',
        title: 'Les montagnes',
        description: "Cette chambre a pour particularité de représenter Man ville de la Côte d'Ivoire.",
        price: 70000,
        imageUrl: 'assets/images/rooms/c2.jpg',
        
      ),
      Room(
        id: '3',
        title: 'Marahoué',
        description: "Cette chambre a pour particularité de représenter la région de la Marahoué de la Côte d'Ivoire.",
        price: 30000,
        imageUrl: 'assets/images/rooms/c3.jpg',
      ),
      Room(
        id: '4',
        title: 'Paris',
        description: "Cette chambre a pour particularité de représenter Paris ville de la France.",
        price: 50000,
        imageUrl: 'assets/images/rooms/c4.jpg',
      ),
      Room(
        id: '4',
        title: 'Rome',
        description: "Cette chambre a pour particularité de de de  représenter Rome ville de l'Italie.",
        price: 40000,
        imageUrl: 'assets/images/rooms/c5.jpg',
      ),
      Room(
        id: '4',
        title: 'Venise',
        description: "Cette chambre a pour particularité de représenter la ville de Vénise.",
        price: 60000,
        imageUrl: 'assets/images/rooms/c6.jpg',
      ),
    ];
    
  }
}