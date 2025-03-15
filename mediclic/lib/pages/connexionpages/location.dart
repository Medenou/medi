// pages/connexionpages/location.dart
/*import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  
   late final _location;
  Future<String?> getPlaceAndDepartment() async {
    try {
      // Vérifier si le service est activé
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) return "Service de localisation désactivé !";
      }

      // Vérifier et demander la permission
      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) return null;
      }

      // Obtenir la localisation
      LocationData locationData = await _location.getLocation();
      double latitude = locationData.latitude!;
      double longitude = locationData.longitude!;

      // Convertir en adresse
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        // Récupérer uniquement le nom de la ville et le département
        String locationName = place.locality ?? "Inconnu"; // Ville ou village
        String department =
            place.administrativeArea ?? "Inconnu"; // Département / Région

        return "$locationName, $department";
      } else {
        return "Adresse introuvable !";
      }
    } catch (e) {
      return "Erreur : $e";
    }
  }
}*/
