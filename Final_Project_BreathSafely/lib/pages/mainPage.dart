import 'package:flutter/material.dart';
import 'package:flutter_application_13/content.dart';
import 'package:flutter_application_13/main.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Breath Safely - تنفس بأمان",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainApp()),
            );
          },
          icon: Icon(Icons.home),
        ),
        backgroundColor: Color.fromARGB(255, 3, 92, 22),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => PopupClassDialog(),
              );
            },
            icon: Icon(Icons.question_mark),
          ),
          ElevatedButton(
            child: const Text("إنضم إلى الفريق الأخضر"),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 1, 49, 3))),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Login"),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Name",
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Email",
                                icon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Message",
                                icon: Icon(Icons.message),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        child: const Text("submit"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 1, 49, 3))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_titleList[index]),
            leading: Hero(
              tag: index,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  color: Color.fromARGB(255, 163, 241, 183),
                  child: _images[index], // Use _images[index] directly
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(
                      heroTag: index,
                      text: _textList[index],
                      linkUrl: _buttonList[index])));
            },
          );
        },
      ),
    );
  }
}

class ClickableLinkText extends StatelessWidget {
  final String text;
  final String linkUrl;

  ClickableLinkText({required this.text, required this.linkUrl});

  _launchURL() async {
    if (await canLaunch(linkUrl)) {
      await launch(linkUrl);
    } else {
      throw 'Could not launch $linkUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Text(
        text,
        style: TextStyle(
          color:
              Colors.green.shade500, // Change the text color to blue for links
          decoration: TextDecoration.underline, // Add an underline for links
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final heroTag;
  final String text;
  final Widget linkUrl;

  const SecondPage(
      {required this.heroTag, required this.text, required this.linkUrl});

  @override
  Widget build(BuildContext context) {
    Widget buildLinks() {
      if (text == "مواقع لحماة البيئه") {
        return Column(
          children: _buttonList,
        );
      } else {
        return SizedBox(); // Return an empty widget if the condition is not met
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Breath Safely - تنفس بأمان"),
        backgroundColor: Color.fromARGB(255, 45, 158, 54),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: _images[heroTag],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: <Widget>[
                        Text(
                          text,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 20),
                        buildLinks(),
                      ]))))
        ],
      ),
    );
  }
}

final List<Image> _images = [
  Image.asset(
    "../images/pic1.jpg",
  ),
  Image.asset(
    "../images/pic2.jpg",
  ),
  Image.asset(
    "../images/pic3.jpg",
  ),
  Image.asset(
    "../images/pic4.jpg",
  ),
];
final List<String> _textList = [
  "قلل من استهلاك الكهرباء\n"
      "1- استبدل اللمبات العادية بمصابيح LED التي تستهلك كميات أقل من الكهرباء.\n"
      "2- افصل الأجهزة الكهربائية عن الكهرباء عند عدم استخدامها، وذلك باستخدام مقابس قابلة للفصل أو شرائط طاقة.\n"
      "3- قم بضبط درجة حرارة المكيفات والتدفئة على مستويات معقولة وتجنب تشغيلها بزيادة.\n"
      "4- اشحن الأجهزة الإلكترونية مثل الهواتف المحمولة في الوقت الصحيح ولا تتركها مشحونة أطول من اللازم.\n"
      "قلل من النفايات\n"
      "   - قم بفصل النفايات وإعادة تدوير المواد القابلة لإعادة التدوير مثل الورق، والزجاج، والبلاستيك.\n"
      "   - استخدم حاويات مناسبة للتخلص من النفايات العضوية والمواد الخضراء عبر عملية تخمير لإنتاج سماد عضوي.\n"
      "   - قم بإصلاح التسريبات في الأنابيب والصنابير لتوفير المياه والحفاظ على الموارد.\n"
      "7. دعم المبادرات البيئية:\n"
      "   - شارك في حملات التوعية بالبيئة ودعم المشاريع البيئية المحلية.\n"
      "  - انضم إلى منظمات بيئية أو اعتمد أساليب حياة صديقة للبيئة وشجع الآخرين على القيام بذلك أيضًا.\n",
  'مواقع لحماة البيئه',
  'Coming Soon',
  'قصتي مع الأخضر تعبر عن حبي العميق للطبيعة والبيئة في الكويت. لقد اخترت اللون الأخضر كرمز لهذا الحب لأنني أرغب في رؤية وطني مزدهرًا بالشجر والأعشاب. إن هذا البيئة الخضراء تساهم في جعل الهواء نقيًا وصحيًا للتنفس. من أجل تحقيق هذا الهدف، أعمل على زيادة الوعي البيئي في المجتمع والمشاركة في الجهود المحلية لزراعة الأشجار والحفاظ على جمال البيئة في الكويت.',
];
final List<String> _titleList = [
  'Love Earth: Act Now -  احافظ على البيئه',
  'Earth Keepers Unite - حماة البيئه',
  'Green Awards - نظام مكافئات',
  'Our Green Story - قصتي مع الاخضر',
];

final List<Widget> _buttonList = [
  ListTile(
    leading: Icon(Icons.link),
    title: ClickableLinkText(
      text: "  الهيئة العامة للبيئة",
      linkUrl: "https://epa.gov.kw/",
    ),
  ),
  ListTile(
    leading: Icon(Icons.link),
    title: ClickableLinkText(
      text: "إزرع وساعد على التخضير\n"
          "تابه هيئة الزراعة من أجل توزيع شتلات بالمجان\n",
      linkUrl:
          "https://www.instagram.com/reel/CjLgYSEoSsS/?utm_source=ig_web_copy_link&igshid=MzRlODBiNWFlZA==",
    ),
  ),
  ListTile(
      leading: Icon(Icons.link),
      title: ClickableLinkText(
        text: "تسوق بمواد صديقة للبيئة",
        linkUrl: "https://www.instagram.com/eco8.store/",
      )),
  ListTile(
      leading: Icon(Icons.link),
      title: ClickableLinkText(
        text: "إعادة تدوير\n"
            "شركة بيئتنا لإعادة التدوير Beatouna Recycling Factory\n",
        linkUrl: "https://beatouna.com/",
      )),
  ListTile(
      leading: Icon(Icons.link),
      title: ClickableLinkText(
        text: "الشركة المتحدة للصناعات الورقية United Paper Industries Company",
        linkUrl: "http://upi.com.kw/",
      )),
  ListTile(
      leading: Icon(Icons.link),
      title: ClickableLinkText(
        text: "شركة الخليج لصناعة الورق Gulf Paper Manufacturing",
        linkUrl: "http://www.gulfpaper.com/",
      )),
  ListTile(
      leading: Icon(Icons.link),
      title: ClickableLinkText(
        text:
            "مصنع سيزرباك انترناشونال لانتاج صناديق الكرتون و تدوير مخلفات الكرتون\n"
            "Caesar Pack Holding Group\n",
        linkUrl: "https://www.cpgholding.com/",
      ))
];
