import 'package:flutter/material.dart';

class HeaderPageView extends StatefulWidget {
  const HeaderPageView({super.key});

  @override
  State<HeaderPageView> createState() => _HeaderPageViewState();
}

class _HeaderPageViewState extends State<HeaderPageView> {
  final _pageViewController = PageController(initialPage: 0);
  int _pageViewIndexPage = 0;

  final List<String> _temp = [
    'https://www.junglescout.com/wp-content/uploads/2021/01/product-photo-water-bottle-hero.png',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: PageView.builder(
                onPageChanged: (value) => setState(() {
                  _pageViewIndexPage = value % _temp.length;
                }),
                controller: _pageViewController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: Image.network(
                      loadingBuilder: (context, child, loadingProgress) =>
                          (loadingProgress == null)
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Container(
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: const Text(
                            'Whoops!',
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      },
                      _temp[index % _temp.length],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _temp.length,
              (int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 8,
                  width: (index == _pageViewIndexPage) ? 24 : 8,
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 4,
                    right: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: (index == _pageViewIndexPage)
                        ? Colors.orange
                        : const Color(0xFF56555B),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
