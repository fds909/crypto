import 'package:crypto/components/crypto_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:crypto/themes/colors.dart';
import 'package:crypto/components/body_header.dart';
import 'package:crypto/models/crypto_listing_model.dart';
import 'package:crypto/repositories/crypto_listing_repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<CryptoListingModel>> cryptoListingFuture;

  @override
  void initState() {
    super.initState();

    cryptoListingFuture = CryptoListingRepository.all();
  }

  void refreshData() {
    setState(() {
      cryptoListingFuture = CryptoListingRepository.all();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeColors.cardBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: refreshData,
        ),
        title: Text(
          'BINANCE',
          style: TextStyle(
            letterSpacing: 5,
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
              ),
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          // l'Expanded serve a far si che il Container occupi tutto lo
          // spazio disponibile; in più centra verticalmente il testo
          child: Expanded(
            child: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Il mio saldo",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "€ 7320.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: ThemeColors.cardBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(children: [
          BodyHeader(),
          Divider(
            color: Colors.white24,
          ),
          bodyContent(),
        ]),
      ),
    );
  }

  Widget bodyContent() {
    // la ListView dà eccezione se non è chiusa in un Expanded perché non sa
    // quanto spazio occupare
    return Expanded(
      child: FutureBuilder(
        future: cryptoListingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CryptoListTile(
                symbol: snapshot.data![index].symbol,
                name: snapshot.data![index].name,
                price: snapshot.data![index].price,
                percentChange24h: snapshot.data![index].variation,
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.white24,
              ),
            );
          }
        },
      ),
    );
  }
}
