import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_2/DetailPage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Resep makanan'),
        ),
        body: _PageList());
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle =
    baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
final descTextStyle =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);
final footerTextStyle =
    baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Nasi Goreng",
    "Soto lamongan",
    "Pallubasa",
    "Pecel Lele",
    "Baso",
    "Coto",
    "Rendang",
    "Sate",
    "Ikan pari",
    "Mie Aceh",
  ];

  List<String> subJudul = [
    "Makanan enak dimakan saat suasana dingin",
    "Makanan yang enak dan bisa dibawa kemana saja",
    "Makanan enak untuk ngemil",
    "Makanan enak dimakan saat suasana dingin",
    "Makanan yang enak dan bisa dibawa kemana saja",
    "Makanan enak untuk ngemil",
    "Makanan enak dimakan saat suasana dingin",
    "Makanan yang enak dan bisa dibawa kemana saja",
    "Makanan enak untuk ngemil",
    "Makanan enak dimakan saat suasana dingin",
  ];

  List<String> gambar = [
    "assets/images/baso.jpg",
    "assets/images/coto.jpg",
    "assets/images/ikanpari.jpg",
    "assets/images/mieaceh.jpg",
    "assets/images/nasgor.jpg",
    "assets/images/pallubasa.jpg",
    "assets/images/pecellele.jpeg",
    "assets/images/rendang.jpg",
    "assets/images/sate.jpg",
    "assets/images/sotolamongan.jpg",
  ];

  List<String> jmlh = [
    "15 porsi",
    "20 porsi",
    "80 porsi"
        "20 porsi",
    "23 porsi",
    "12 porsi",
    "5 porsi",
    "50 porsi",
    "22 porsi",
    "21 porsi",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: judul.length,
          itemBuilder: (BuildContext contex, int index) {
            final title = judul[index].toString();
            final subTitle = subJudul[index].toString();
            final jumlah = jmlh[index].toString();
            final img = gambar[index].toString();
            return Container(
              height: 200.0,
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      backgroundImage(img),
                      Container(
                        child: topContent(title, subTitle, jumlah),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                itemJudul: title,
                                itemSub: subTitle,
                                qty: jumlah,
                                itemImage: img)));
                  }),
            );
          }),
    );
  }

  backgroundImage(String gambar) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.luminosity),
              image: AssetImage(gambar))),
    );
  }

  topContent(String nama, String deskripsi, String stok) {
    return new Container(
// height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            deskripsi,
            style: descTextStyle,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            stok,
            style: footerTextStyle,
          )
        ],
      ),
    );
  }
}
