import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_qinspecting/providers/providers.dart';
import 'package:app_qinspecting/screens/screens.dart';
import 'package:app_qinspecting/services/services.dart';
import 'package:app_qinspecting/widgets/widgets.dart';

class LoadHomeScreen extends StatelessWidget {
  const LoadHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Al instanciar el servicio, hace la petición al servidor
    final inspeccionService = Provider.of<InspeccionService>(context);

    if (inspeccionService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: const CustomAppBar().createAppBar(),
      drawer: const CustomDrawer(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: _HomePageBody(),
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
    final inspeccionProvider =
        Provider.of<InspeccionProvider>(context, listen: false);
    final inspeccionService = Provider.of<InspeccionService>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        inspeccionService.resumePreoperacional.ciuId = 0;
        inspeccionService.resumePreoperacional.resuPreKilometraje = 0;
        inspeccionService.resumePreoperacional.vehId = 0;
        inspeccionProvider.vehiculoSelected = null;
        inspeccionProvider.remolqueSelected = null;
        inspeccionProvider.pathFileKilometraje = null;
        inspeccionProvider.pathFileGuia = null;
        inspeccionProvider.realizoTanqueo = false;
        inspeccionProvider.tieneRemolque = false;
        inspeccionProvider.tieneGuia = false;
        inspeccionProvider.itemsInspeccion.clear();
        inspeccionProvider.itemsInspeccionRemolque.clear();
        return const DesktopScreen();
      case 1:
        inspeccionProvider.listarDepartamentos();
        inspeccionProvider.listarVehiculos();
        return AlertDialogValidate();
      default:
        return const DesktopScreen();
    }
  }
}
