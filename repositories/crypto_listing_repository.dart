import 'package:crypto/models/crypto_listing_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// classe che funge da namespace per chiamare il metodo
class CryptoListingRepository {
  static Future<List<CryptoListingModel>> all() async {
    final url = Uri.parse(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

    // la chiamata http è fatta inserendo la chiave API nel header
    final response = await http.get(url,
        headers: {"X-CMC_PRO_API_KEY": "0be7002a-d82a-4872-8e11-c7ebd12a056e"});

    // jsonData è un Map<String, dynamic>
    final jsonData = jsonDecode(response.body);

    final cryptoListings =
        (jsonData["data"] as List<dynamic>).map((cryptoData) {
      return CryptoListingModel.fromJson(cryptoData);
    });

    return cryptoListings.toList();
  }
}
