import 'package:flutter/material.dart';
import 'package:kalkulator_luas/Api/DeleteDataApi/DeleteLuasPersegiPanjangApi.dart';
import 'package:kalkulator_luas/Api/GetDataApi/GetLuasPersegiPanjangApi.dart';

class HistoryLuasPersegiPanjang extends StatefulWidget {
  const HistoryLuasPersegiPanjang({super.key});

  @override
  State<HistoryLuasPersegiPanjang> createState() => _HistoryLuasPersegiPanjangState();
}

class _HistoryLuasPersegiPanjangState extends State<HistoryLuasPersegiPanjang> {
  late Future<List<PersegiPanjang>> futurePersegiPanjangHistory;

  @override
  void initState() {
    super.initState();
    futurePersegiPanjangHistory = getPersegiPanjangHistory();
  }

  Future<void> refresh() async {
    futurePersegiPanjangHistory = getPersegiPanjangHistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF152744),
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(
              color: Color(0xFF4BA3A3),
              width: 2,
            )),
        elevation: 4,
        backgroundColor: Color(0xFF367591),
        centerTitle: true,
        title: Text(
          'History Luas Persegi Panjang',
          style:
          TextStyle(color: Color(0xFF9DFDC7), fontFamily: 'IBM_Plex_Mono'),
        ),
      ),
      body: MyListView(futurePersegiPanjangHistory, refresh),
    );
  }
}

Widget MyListView(Future<List<PersegiPanjang>> futurePersegiPanjangHistory, Function refresh) {
  return FutureBuilder<List<PersegiPanjang>>(
      future: futurePersegiPanjangHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator( color: Colors.white,));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data', style: TextStyle(color: Colors.white,fontSize: 30)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available', style: TextStyle(color: Colors.white,fontSize: 30)));
        } else {
          final persegipanjangHistory =
          snapshot.data!;
          return ListView.builder(
              itemCount: persegipanjangHistory.length,
              itemBuilder: (context, index) {
                final segiHistory = persegipanjangHistory[index];
                return Container(
                    margin: EdgeInsets.only(
                        top: 8, left: 8, right: 8, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                      border: Border.all(
                        color: Color(0xFF61D2B4),
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        "History Calculate Persegi Panjang",
                        style: TextStyle(color: Color(0xFFECE9EC),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 5),
                                Text(
                                  'Panjang: ${segiHistory.panjang}',
                                  style: TextStyle(color: Color(0xFFECE9EC)),
                                ),
                                Text(
                                  'Lebar: ${segiHistory.lebar}',
                                  style: TextStyle(color: Color(0xFFFF0000)),
                                ),
                                Text(
                                  'Luas: ${segiHistory.luas.toStringAsFixed(2)}',
                                  style: TextStyle(color: Color(0xFFFFFF00)),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              var id = '${segiHistory.id}';
                              await DeletePersegiPanjangHistory().deletePersegiPanjangHistory(id).catchError((err) {});
                              refresh();
                            },
                            child: SizedBox(
                                width: 30,
                                child: Icon(Icons.delete, size: 30,)
                            ),
                          )
                        ],
                      ),
                    )
                );
              }
          );
        }
      }
  );
}
