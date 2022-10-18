import 'package:trivia_educativa/core/app_routes.dart';
import 'package:trivia_educativa/data/models/nivel_model.dart';
import 'package:trivia_educativa/core/routers/routers.dart';
import 'package:trivia_educativa/data/models/nota_prov_model.dart';
import 'package:trivia_educativa/presentation/home/home_controller.dart';
import 'package:trivia_educativa/presentation/nivel/widgets/nivel_card/nivel_card_widget.dart';
import 'package:trivia_educativa/presentation/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/app_colors.dart';
import '../../core/app_gradients.dart';
import '../../core/app_text_styles.dart';
import '../shared/widgets/gradient_app_bar_widget.dart';

class NivelPage extends StatefulWidget {
  const NivelPage({
    Key? key,
    required this.niveles,
    required this.idTema,
    required this.idAsignatura,
    required this.idCurso,
  }) : super(key: key);
  final List<Nivel> niveles;
  final String idTema;
  final String idAsignatura;
  final String idCurso;

  @override
  _NivelPageState createState() => _NivelPageState();
}

class _NivelPageState extends State<NivelPage> {
  final controller = HomeController();
  // final cont

  void _loadData() async {
    await controller.getNotasProv();
  }

  @override
  initState() {
    _loadData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  //TODO ver metodo para checkear q este o no hecho el nivel
  bool doneLevel(String idNivel, List<NotaProv> notasProv) {
    bool isDone = false;
    if ((notasProv
        .where((notaProv) =>
            notaProv.nivel?.where((nivel) => nivel.id == idNivel).isNotEmpty ??
            false)
        .isNotEmpty)) isDone = true;

    return isDone;
  }

  @override
  Widget build(BuildContext context) {
    // log(controller.toString());
    SettingsController settingsController =
        Provider.of<SettingsController>(context);

    return Scaffold(
        backgroundColor:
            settingsController.currentAppTheme.scaffoldBackgroundColor,
        appBar: PreferredSize(
          child: GradientAppBarWidget(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        alignment: Alignment.centerLeft,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.all(0),
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: settingsController
                              .currentAppTheme.iconTheme.color,
                        )),
                    Text(
                      I10n.of(context).levels,
                      style: AppTextStyles.titleBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(56),
        ),

        //  NewGradientAppBar(
        //   gradient: AppGradients.linear,
        //   //toolbarHeight: kToolbarHeight,

        //   title: Text(
        //     I10n.of(context).levels,
        //     style: AppTextStyles.title,
        //   ),
        // ),

        //  PreferredSize(
        //   child: GradientAppBarWidget(
        //     child: SizedBox(
        //       height: 100,
        //       child: Container(
        //         height: 60,
        //         width: MediaQuery.of(context).size.width,
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: 20,
        //         ),
        //         decoration: const BoxDecoration(
        //           gradient: AppGradients.linear,
        //         ),
        //         child: Align(
        //           alignment: Alignment.centerLeft,
        //           child: Text(
        //             I10n.of(context).levels,
        //             style: AppTextStyles.title,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        //   preferredSize: const Size.fromHeight(250),
        // ),
//TODO make validation for data to all pages like asignatura(home)
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child:

              //TODO make a list view
              Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: GridView.count(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: widget.niveles.map((nivel) {
                  if (doneLevel(nivel.id, controller.notasProv ?? [])) {
                    return NivelCardWidget(
                      isDone: true,
                      nombre: nivel.descripcion,
                      preguntas: nivel.preguntas,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.challengeRoute,
                          arguments: ChallengePageArgs(
                              preguntas: nivel.preguntas,
                              rango3: nivel.rango3,
                              rango4: nivel.rango4,
                              rango5: nivel.rango5,
                              quizTitle: nivel.descripcion,
                              idAsignatura: widget.idAsignatura,
                              idCurso: widget.idCurso,
                              idTema: widget.idTema,
                              idNivel: nivel.id),
                        );
                      },
                    );
                  } else {
                    return NivelCardWidget(
                        isDone: false,
                        nombre: nivel.descripcion,
                        preguntas: nivel.preguntas,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.challengeRoute,
                            arguments: ChallengePageArgs(
                                preguntas: nivel.preguntas,
                                rango3: nivel.rango3,
                                rango4: nivel.rango4,
                                rango5: nivel.rango5,
                                quizTitle: nivel.descripcion,
                                idAsignatura: widget.idAsignatura,
                                idCurso: widget.idCurso,
                                idTema: widget.idTema,
                                idNivel: nivel.id),
                          );
                        });
                  }
                }).toList()),
          ),
        ));
  }
}
