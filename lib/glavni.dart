import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_first_app/suraho/suraho.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> suraho = {
  "ФОТИҲА": "1  7",
  "ЁСИН": "36  83",
  'МУЛК(ТАБОРАК)': "67  30",
  'НАБАЪ': "78  40",
  'ТОРИҚ': "86  17",
  'ИНШИРОҲ': "94  8",
  'ТИН': "95  8",
  'АЛАҚ': "96  19",
  'ҚАДР': "97  5",
  'БАЙЙИНАҲ': "98  8",
  'ЗАЛЗАЛА': "99  8",
  'ОДИЁТ': "100  11",
  'ҚОРИЪАҲ': "101  11",
  'ТАКОСУР': "102  8",
  'АСР': "103  3",
  'ҲУМАЗАҲ': "104  9",
  'ФИЛ': "105  5",
  'ҚУРАЙШ': "106  4",
  'МОЪУН': "107  7",
  'КАВСАР': "108  3",
  'КАФИРУН': "109  6",
  'НАСР': "110  3",
  'ЛАҲАБ': "111  5",
  'ИХЛОС': "112  4",
  'ФАЛАҚ': "113  5",
  'НОС': "114  6",
};

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<MapEntry<String, dynamic>> filteredSuraho = [];
  int? _counter = 2;
  ThemeMode _themeMode = ThemeMode.light;
  bool ss = false;
  @override
  void initState() {
    super.initState();
    filteredSuraho = suraho.entries.toList();
  }

  void _filterSuraho(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuraho = suraho.entries.toList();
      } else {
        filteredSuraho = suraho.entries
            .where((entry) =>
                entry.key.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 88, 4, 179),
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white, size: 34),
            );
          }),
          title: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "СУРАҲОИ ХУРД",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 88, 4, 179),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("images/photo_2024-10-31_18-31-19.jpg"),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                RadioListTile(
                  activeColor: const Color.fromARGB(255, 88, 4, 179),
                  title: Row(
                    children: [
                      Icon(Icons.bedtime_sharp),
                      SizedBox(width: 10),
                      Text(
                        "РЕЖИМИ ШАБОНА",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  value: 1,
                  groupValue: _counter,
                  onChanged: (val) {
                    setState(() {
                      _counter = val;
                      _themeMode = ThemeMode.dark;
                    });
                  },
                ),
                RadioListTile(
                  activeColor: const Color.fromARGB(255, 88, 4, 179),
                  title: Row(
                    children: [
                      Icon(Icons.sunny),
                      SizedBox(width: 10),
                      Text(
                        "РЕЖИМИ РӮЗОНА",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  value: 2,
                  groupValue: _counter,
                  onChanged: (val) {
                    setState(
                      () {
                        _counter = val;
                        _themeMode = ThemeMode.light;
                      },
                    );
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 1.5,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(ss == false
                                  ? Icons.thumb_up_alt_outlined
                                  : Icons.thumb_up_alt_rounded),
                              onPressed: () {
                                setState(() {
                                  ss = !ss;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              "БАҲО ДОДАН",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.add_to_home_screen_rounded),
                            SizedBox(width: 10),
                            Text(
                              "ДИГАР БАРНОМАҲО",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Поиск',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    _filterSuraho(value);
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 660,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: filteredSuraho.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 11,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fotiha(
                                        index: index,
                                        suraName:
                                            suraho.keys.toList()[index])));
                          },
                          title: Text(
                            "СУРАИ ${filteredSuraho[index].key}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          subtitle: Text(
                            "сураи-${filteredSuraho[index].value}-оят",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////
////////////////////////
/////////////////
//////////////

class Fotiha extends StatefulWidget {
  final int index;
  final String suraName;
  const Fotiha({super.key, required this.index, required this.suraName});

  @override
  State<Fotiha> createState() => _FotihaState();
}

class _FotihaState extends State<Fotiha> {
  List<MapEntry<String, dynamic>> filteredSuraho = [];
  @override
  void initState() {
    super.initState();
    filteredSuraho = suraho.entries.toList();
  }

  void _filterSuraho(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuraho = suraho.entries.toList();
      } else {
        filteredSuraho = suraho.entries
            .where((entry) =>
                entry.key.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  List<Map<String, dynamic>> sur = [
    {
      "Arabi":
          "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ ۝ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ ۝ الرَّحْمَٰنِ الرَّحِيمِ ۝ مَالِكِ يَوْمِ الدِّينِ ۝ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ۝ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ ۝ صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ",
      "Krilli":
          "1.Бисмиллоҳир Раҳмонир Раҳим. 2. Алҳамду лилляҳи раббил ъаламин. 3. Ар-Раҳмонир Раҳим. 4. Малики явмид-дин. 5. Ийяка наъбуду ва ийяка настаъин. 6. Иҳдинас-сиротал мустақим. 7. Сироталлазина анъамта ъалайҳим ғайрил мағзуби ъалайҳим ва ло-ззоллин.",
      "tarjuma":
          "1.Бо номи Худои Бахшандаи Меҳрубон. 2. Ҳамд (ситоиш) махсуси Худо, Парвардигори тамоми оламҳост. 3. Бахшандаи меҳрубон. 4. Соҳиби рӯзи ҷазо (Қиёмат). 5. Танҳо Туран мепарастем ва танҳо аз Ту ёрӣ металабем. 6. Моро ба роҳи рост ҳидоят кун. 7. Роҳи касоне, ки ба онҳо неъмат додӣ, на роҳи касоне, ки ба ғазаби Ту гирифтор шудаанд ва на гумроҳон.",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi":
          "تَبَارَكَ الَّذِي بِيَدِهِ الْمُلْكُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ 2. الَّذِي خَلَقَ الْمَوْتَ وَالْحَيَاةَ لِيَبْلُوَكُمْ أَيُّكُمْ أَحْسَنُ عَمَلًا وَهُوَ الْعَزِيزُ الْغَفُورُ 3. الَّذِي خَلَقَ سَبْعَ سَمَاوَاتٍ طِبَاقًا مَّا تَرَىٰ فِي خَلْقِ الرَّحْمَٰنِ مِنْ تَفَاوُتٍ 4. فَارْجِعِ الْبَصَرَ هَلْ تَرَىٰ مِنْ فُطُورٍ 5. ثُمَّ رَجِعِ الْبَصَرَ كَرَّتَيْنِ يَنقَلِبْ إِلَيْكَ الْبَصَرُ خَاسِئًا وَهُوَ حَسِيرٌ 6. وَلَقَدْ زَيَّنَّا السَّمَاءَ الدُّنْيَا بِمَصَابِحَ وَجَعَلْنَا هَا لِرُجُومٍ لِّلشَّيَاطِينِ 7. وَأَعْتَدْنَا لَهُمْ عَذَابَ السَّعِيرِ 8. وَلِلَّذِينَ كَفَرُوا بِرَبِّهِمْ عَذَابُ جَهَنَّمَ وَبِئْسَ الْمَصِيرُ 9. إِذَا أُلْقُوا فِيهَا سَمِعُوا لَهَا شَهِيقًا وَهِيَ تَفُورُ 10. تَكَادُ تَمَيَّزُ مِنَ الْغَيْظِ 11. كُلَّ مَا أُلْقِي فِيهَا فَوْجٌ سَأَلَهُمْ خَزَنَتُهَا أَلَمْ يَأْتِكُمْ نَذِيرٌ 12. قَالُوا۟ بَلَىٰ قَدْ جَآءَنَا نَذِيرٌۖ فَكَذَّبْنَا 13. وَقُلْنَا مَا نَزَّلَ اللَّهُ مِنْ شَيْءٍ إِنْ أَنتُمْ إِلَّا فِي ضَلَالٍ كَبِيرٍ 14. وَقَالُوا۟ لَوْ كُنَّا نَسْمَعُ أَوْ نَعْقِلُ مَا كُنَّا فِي أَصْحَابِ السَّعِيرِ 15. فَاعْتَرَفُوا۟ بِذَنْبِهِمْ فَسُحْقًا لِّأَصْحَابِ السَّعِيرِ 16. إِنَّ الَّذِينَ يَخْشَوْنَ رَبَّهُمْ بِالْغَيْبِ لَهُمْ مَغْفِرَةٌ وَأَجْرٌ كَبِيرٌ 17. وَأَسِرُّوا۟ قَوْلَكُمْ أَوِ اجْهَرُوا۟ بِهِۦٓ 18. إِنَّهُۥ عَلِيمٌۭ بِذَاتِ الصُّدُّرِ 19. أَلَا يَعْلَمُ مَنْ خَلَقَ وَهُوَ اللَّطِيفُ الْخَبِيرُ 20. الَّذِي جَعَلَ لَكُمُ الْأَرْضَ ذَلُولًا 21. فَامْشُوا۟ فِي مَنَاكِبِهَا وَكُلُوا۟ مِنْ رِزْقِهِۦۖ إِلَيْهِ تُحْشَرُونَ 22. أَمِنتُمْ مَنْ فِي السَّمَاءِ أَنْ يَخْسِفَ بِكُمُ الْأَرْضَ 23. فَإِذَا هِيَ تَمُورُ 24. أَمِنتُمْ مَنْ فِي السَّمَاءِ أَنْ يُرْسِلَ عَلَيْكُمْ حَاصِبًا 25. فَسَوْفَ تَعْلَمُونَ 26. وَقَالُوا۟ مَا هَٰذَا إِلَّا سِحْرٌۭ مُّبِينٌ 27. فَأَمَّارُوا۟ بِهِۦٓ وَأَتَوْا۟ بِهِۦٓ فَإِنَّ هَٰذَا لَسِحْرٌۭ مُبِينٌ 28. وَأَمَرُوا۟ بِهِۦٓ فَإِنَّ هَٰذَا لَسِحْرٌۭ مُبِينٌ 29. فَفِي ذَٰلِكَ فِي مَقْدَمِهۦ 30. وَقَصَرَتْتُمْ سَجْدَتْ سَجْدَتِه",
      "Krilli":
          "1.Табарка алладий би-йадихи ал-мулк ва хува ала кулли шейин қодир. 2. Алладий халака ал-маута ва ал-ҳаята ли-яблукум айюкум аҳсану амалан ва хува ал-азийзу-л-Ғафур. 3. Алладий халака сабъа самаватин тибақан ма тари фи халақи ар-Рахмани мин тафаутин. 4. Фарҷи'ил басара, хал тари мин футур. 5. Сумма раджи'ил басара карратайн янқалибу илайка ал-басару хасийан ва хува хасир. 6. Ва лакад зайнанас самаад-дуния би-масаабиха ва ҷаъалнахо ли-руҷумил шаяотини. 7. Ва а'тадна лаҳум 'адаб асса'ир. 8. Ва лилладийна кафару би-раббиҳим 'адабуд-жаҳаннама ва би'са ал-масир. 9. Иза улқифиха соли'у лаха шаиқан ва ҳия туфур. 10. Такаду тамаййазу мин ал-ғайзи. 11. Кулла ма улқифиха фауҷан са'алаҳум хазанатуха алам ётикум надирун. 12. Қалу балә қада ҷа'ана надирун, факаззабна. 13. Ва кулна ма нуззила Ллаху мин шайин ин анту илла фи далалин кабир. 14. Ва қалу лау кунна насма'у ав на'кулу ма кунна фи асҳаби-сса'ир. 15. Фа'тарафу би-замбиҳим фасухқан ли-асҳаби-сса'ир. 16. Инналладийна яхшавна раббахум бил ғайби лаҳум магфира ва ажрун кабир. 17. Ва асирру қавлакум авижару биҳи. 18. Иннаху алимун бидатиссудур. 19. Ала я'ламу ман халака ва хува латийфун хабир. 20. Алладий жа'ала лакумул арда залулан. 21. Фамшу фи манакибиха ва кулу мин ризкӣ, илайхи туҳшарун. 22. Аминтум ман фиссамаи ан йахсфу бикумул арда. 23. Фаиза хия тамуру. 24. Аминтум ман фиссамаи ан юрсила 'alaykum хасибан. 25. Фасовфа та'ламун. 26. Ва қалу ма ҳаза илла сихрун мубин. 27. Фааммару бихи ва атоо бихи, инна ҳаза лисиҳрун мубин. 28. Ва амару бихи, инна ҳаза лисиҳрун мубин. 29. Фи заликфи макадимиха. 30. Ва қасаратту саҷдат саҷдатихи.",
      "tarjuma": "text",
    },
    {
      "Arabi": "textqP",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
    {
      "Arabi": "text",
      "Krilli": "text",
      "tarjuma": "text",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.amber,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 88, 4, 179),
        title: Text(
          "${widget.suraName}",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 760,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Column(
                              children: [
                                Text(
                                  "АРАБИ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 88, 4, 179),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  sur[widget.index]["Arabi"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Column(
                              children: [
                                Text(
                                  "КРИЛЛИ",
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 88, 4, 179),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  sur[widget.index]["Krilli"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Column(
                              children: [
                                Text(
                                  "ТАРҶУМА",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 88, 4, 179),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  sur[widget.index]["tarjuma"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
