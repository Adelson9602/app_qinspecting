import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_qinspecting/providers/providers.dart';
import 'package:app_qinspecting/screens/screens.dart';
import 'package:app_qinspecting/services/services.dart';
import 'package:app_qinspecting/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginService = Provider.of<LoginService>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar().createAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (_) =>
                      InspeccionService(loginService.selectedEmpresa!)),
            ],
            child: const _HomePageBody(),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final inspeccionService = Provider.of<InspeccionService>(context);
    // print(inspeccionService.getDepartamentos());
    // final empresa = DBProvider.db.nuevoDepartamento(nuevoDepartamento);

    switch (currentIndex) {
      case 0:
        return const DesktopScreen();
      case 1:
        return const InspeccionForm();
      default:
        return const DesktopScreen();
    }
  }
}
