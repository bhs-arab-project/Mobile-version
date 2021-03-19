import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Splash Screen",
    home: SphScreen(),
  ));
}

// import 'package:bahasa_arab/package/flushbar/flushbar.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Kamus(),
//     );
//   }
// }

// class Kamus extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new _KamusState();
//   }
// }

// List<Kesehatan> kesehatans = [
//   Kesehatan(
//       istilah: 'AAA',
//       kepanjangan: 'Aneurisma Aorta Abdominalis',
//       detailnya:
//           "kondisi melebarnya aorta di bagian perut/abdominal, secara abnormal."),
//   Kesehatan(
//       istilah: 'AAD',
//       kepanjangan: 'Antibiotic-Associated Diarrhea',
//       detailnya: "diare yang disebabkan oleh antibiotik"),
//   Kesehatan(
//       istilah: 'Ab',
//       kepanjangan: 'Antibodi',
//       detailnya:
//           "sejenis protein berukuran kecil yang beredar di aliran darah yang berfungsi sebagai kekebalan tubuh (imunitas)"),
//   Kesehatan(
//       istilah: 'ACV',
//       kepanjangan: 'Assist Controlled Ventilation',
//       detailnya:
//           "(ventilasi bantuan terkontrol) adalah salah satu mode ventilasi mekanik (ventilator)"),
//   Kesehatan(
//       istilah: 'ADH ',
//       kepanjangan: 'Antidiuretic hormone',
//       detailnya:
//           "hormon yang mengatur kadar air dalam tubuh melalui proses di dalam ginjal."),
//   Kesehatan(
//       istilah: 'BCP',
//       kepanjangan: 'Birth Control Pill ',
//       detailnya:
//           " (pil pengontrol kelahiran) di Indonesia dikenal dengan PIL KB"),
//   Kesehatan(
//       istilah: 'BUN',
//       kepanjangan: 'Blood Urea Nitrogen',
//       detailnya:
//           "(nitrogen urea darah) ureum adalah produk limbah hasil metabolisme protein yang bersifat racun bagi tubuh. Nilai normal ureum berdasarkan usia; 0-5 tahun 5-18 mg/dL, 5-15 tahun 7-18 mg/dL dan >15 tahun 6-23 mg/dL"),
//   Kesehatan(
//       istilah: 'CAD',
//       kepanjangan: '	Coronary Artery Disease',
//       detailnya:
//           "(penyakit arteri koroner) dimana plak menumpuk di dalam dinding arteri (pembuluh darah utama jantung)."),
//   Kesehatan(
//       istilah: 'CHF',
//       kepanjangan: 'Congestive Heart Failure ',
//       detailnya:
//           "(gagal jantung kongesti) adalah kegagalan jantung dalam memompa pasokan darah yang dibutuhkan tubuh."),
//   Kesehatan(
//       istilah: 'CO',
//       kepanjangan: 'Cardiac Output',
//       detailnya:
//           "(curah jantung) adalah volume darah yang dipompa oleh tiap-tiap ventrikel permenit. Normal darah yang dipompa dalam semenit adalah sekitar 5 liter."),
//   Kesehatan(
//       istilah: 'CPIS',
//       kepanjangan: 'Clinical Pulmonary Infection Score',
//       detailnya:
//           "(skor infeksi paru klini) adalah instrumen yang membantu dalam mendiagnosisi pneumonia terkait ventilator (VAP)"),
//   Kesehatan(
//       istilah: 'CPR',
//       kepanjangan: 'Cardio-Pulmonary Resucitation',
//       detailnya:
//           "(resusitas jantung paru/RJP adalah langkah pertolongan medis untuk mengembalikan fungsi napas atau sirkulasi darah yang berhenti. RJP bertujuan untuk menjaga oksigen tetap beredar ke seluruh tubuh."),
//   Kesehatan(
//       istilah: 'DVT',
//       kepanjangan: 'Deep Vein Thrombosis',
//       detailnya:
//           "(trombosis vena dalam) adalah kondisi ketika terjadi penggumpalan darah pada satu atau lebih pembuluh darah vena dalam."),
//   Kesehatan(
//       istilah: 'ICP',
//       kepanjangan: 'Intracranial Pressure',
//       detailnya:
//           "Tekanan Intrakranial adalah tekanan di dalam ruang tengkorak yang dinamis dan fluktiatif yang dipengaruhi oleh cairan serebrospinal, jaringan otak dan darah."),
//   Kesehatan(
//       istilah: 'LED',
//       kepanjangan: 'Laju Endap Darah',
//       detailnya:
//           "Laju Endap Darah (erytrocyte sedimentation rate, ESR) Tes LED yaitu tes untuk mengukur berapa lama waktu yang dibutuhkan untuk sel darah merah jatuh atau mengedap ke dasar tabung reaksi kaca. tes LED digunakan untuk menilai kondisi peradangan atau infeksi di tubuh."),
//   Kesehatan(
//       istilah: 'PEA',
//       kepanjangan: 'Pulseless electrical activity',
//       detailnya:
//           "(aktivitas listrik tanda nadi) adalah henti jantung di mana elektrokardiogram menunjukkan irama jantung yang seharusnya menghasilkan denyut nadi, tetapi tidak."),
// ];

// class _KamusState extends State<Kamus> {
//   TextEditingController searchController = new TextEditingController();
//   String filter;

//   @override
//   initState() {
//     searchController.addListener(() {
//       setState(() {
//         filter = searchController.text;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text('Health Terms',
//                 style: TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30)),
//           ),
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//         body: new Column(
//           children: <Widget>[
//             new Padding(
//               padding: new EdgeInsets.all(8.0),
//               child: new TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                     hintText: 'Search',
//                     contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.0)),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide:
//                           BorderSide(color: Colors.lightGreen, width: 2.5),
//                     )),
//               ),
//             ),
//             new Expanded(
//               child: new ListView.builder(
//                 itemCount: kesehatans.length,
//                 itemBuilder: (context, index) {
//                   return filter == null || filter == ""
//                       ? Card(
//                           child: ListTile(
//                             title: Text(
//                               '${kesehatans[index].istilah}',
//                             ),
//                             subtitle: Text('${kesehatans[index].kepanjangan}'),
//                             onTap: () =>
//                                 _openDialog(context, kesehatans[index]),
//                           ),
//                         )
//                       : '${kesehatans[index].istilah}'
//                               .toLowerCase()
//                               .contains(filter.toLowerCase())
//                           ? Card(
//                               child: ListTile(
//                                 title: Text(
//                                   '${kesehatans[index].istilah}',
//                                 ),
//                                 subtitle:
//                                     Text('${kesehatans[index].kepanjangan}'),
//                                 onTap: () =>
//                                     _openDialog(context, kesehatans[index]),
//                               ),
//                             )
//                           : new Container();
//                 },
//               ),
//             ),
//           ],
//         ));
//   }
// }

// class Kesehatan {
//   final String istilah;
//   final String kepanjangan;
//   final String detailnya;

//   const Kesehatan({this.istilah, this.kepanjangan, this.detailnya});
// }

// void _openDialog(BuildContext context, Kesehatan post) {
//   Flushbar(
//     margin: EdgeInsets.all(8),
//     borderRadius: 8,
//     title: post.istilah,
//     message: post.kepanjangan,
//     backgroundColor: Colors.orange,
//     duration: Duration(seconds: 4),
//   )..show(context);
// }
