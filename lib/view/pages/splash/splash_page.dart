import 'package:desafio_frontend_wattio/view/pages/home/home_page.dart';
import 'package:desafio_frontend_wattio/view/pages/splash/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeigth = MediaQuery.of(context).size.height;

    bool isDesktop(BuildContext context) => sizeWidth >= 600;
    bool isMobile(BuildContext context) => sizeWidth < 600;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
              color: Colors.grey.shade100,
              urlImage: 'images/vantagens_1.png',
              title: 'Gostaria de pagar menos em sua energia eletrica?',
              subtitle:
                  'Conheça nossa ferramenta, e encontre o plano ideal pra voce.',
              screen: isDesktop(context) ? true : false,
              initialPage: true,
              context: context,
            ),
            buildPage(
              color: Colors.grey.shade100,
              urlImage: 'images/bg_ic_2.png',
              title: 'Conheça as cooperativas de energia',
              subtitle:
                  'As Cooperativas de Energia são empresas que compram energia excedente de usinas e outras casas/empresas com sistemas de geração; e vendem para consumidores a preços mais baixos que os das distribuidoras tradicionais.',
              screen: isDesktop(context) ? true : false,
              initialPage: true,
              context: context,
            ),
            buildPage(
              color: Colors.grey.shade100,
              urlImage: 'images/Logo-icone.png',
              title: 'Pronto para economizar?',
              subtitle: 'Faça uma simulação de desconto.',
              screen: isDesktop(context) ? true : false,
              initialPage: true,
              context: context,
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(80)),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(
                'Quero economizar',
                style: TextStyle(fontSize: 24),
              ),
            )
          : Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: isMobile(context) ? 80 : 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    child: const Text(
                      'PULAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text('PRÓXIMO',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
    );
  }
}
