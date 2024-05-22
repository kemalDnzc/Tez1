import 'package:flutter/material.dart';
import 'package:taki/components/side_bar.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> _statuTypes = [
      'Sipariş Alındı',
      'Sipariş Dökümde',
      'Sipariş Tezgahta',
      'Sipariş Cilada',
      'Sipariş Paketlemede',
      'Teslim Edildi',
    ];

    // Her sipariş durumu için hazır olma durumunu gösteren liste
    List<bool> _isReady = [true, false, false, false, false, false];
    bool _previousReady = true; // Önceki durumun hazır olup olmadığını saklar

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sipariş Durumu',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(21, 52, 72, 1),
      ),
      backgroundColor: const Color.fromRGBO(60, 91, 111, 1),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              6,
                  (index) {
                // Her durumun kontrol edilmesi
                if (_previousReady) {
                  _isReady[index] = true;
                } else {
                  _isReady[index] = false;
                }
                _previousReady = _isReady[index]; // Önceki durumu güncelle

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(148, 137, 121, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80.0,
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      margin: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 65,
                                  child: _isReady[index]
                                      ? Icon(Icons.check, size: 40, color: Colors.green) // Hazır durumu için tik işareti
                                      : Icon(Icons.close, size: 40, color: Colors.red), // Hazır olmayan durumu için çarpı işareti
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 80,
                                child: SizedBox(
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _statuTypes[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5), // Boşluk ekleyin
                    if (index != 5) // Son eleman değilse oku ekle
                      Icon(Icons.arrow_downward,
                          color: Colors.white, size: 30), // Aşağı yönlü ok
                    SizedBox(height: 5), // Boşluk ekleyin
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}