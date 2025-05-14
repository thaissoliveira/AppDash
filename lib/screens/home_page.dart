import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 350,
            color: Color(0xffe3f5f5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                CircleAvatar(
                  radius: 136,
                  backgroundColor: Colors.green.shade100,
                  child: CircleAvatar(
                    radius: 128,
                    backgroundImage: AssetImage('assets/images/homem.webp'),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Zé da Manga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.green.shade900,
                  ),
                ),
                Divider(),
                InfoButton(
                  selected: index == 1,
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
                InfoButton(
                  selected: index == 2,
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
                InfoButton(
                  selected: index == 3,
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  for (int i = 0; i < 15; i++) InfoCard(title: '${10 * i}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final bool selected;
  final VoidCallback? onTap;
  const InfoButton({super.key, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: selected ? Colors.green.shade200 : null,
        height: 68,
        child: Row(
          spacing: 16,
          children: [
            if (selected)
              Container(
                height: double.maxFinite,
                width: 6,
                color: Colors.green.shade800,
              )
            else
              SizedBox(width: 6),
            Text('data', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const InfoCard({
    super.key,
    this.subTitle = 'Someente Teste',
    this.title = '0',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 250,
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xffe3f5f5),
              minRadius: 32,
              child: Icon(
                Icons.mail_outline_rounded,
                size: 32,
                color: Color(0xff479f9b),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              subTitle,
              style: const TextStyle(color: Colors.black54),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
