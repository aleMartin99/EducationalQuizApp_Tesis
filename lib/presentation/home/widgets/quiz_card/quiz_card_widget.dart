// import 'package:trivia_educativa/core/app_theme.dart';
// import 'package:trivia_educativa/core/core.dart';
// import 'package:trivia_educativa/presentation/settings/settings_controller.dart';
// import 'package:trivia_educativa/presentation/shared/widgets/progress_indicator_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class QuizCardWidget extends StatelessWidget {
//   final String title;
//   final int completed;
//   final int totalQuestions;
//   final VoidCallback onTap;

//   const QuizCardWidget({
//     Key? key,
//     required this.title,
//     required this.completed,
//     required this.totalQuestions,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SettingsController settingsController =
//         Provider.of<SettingsController>(context);

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: const Border.fromBorderSide(
//             BorderSide(
//               color: AppColors.border,
//             ),
//           ),
//           color: AppTheme.backgroundColors(
//               settingsController.currentAppTheme.brightness),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //todo QUItar image block
//             SizedBox(
//               width: 40,
//               height: 40,
//               child: Image.asset(
//                 AppImages.blocks,
//               ),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             Expanded(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: AppTextStyles.heading15.copyWith(
//                         color: settingsController.currentAppTheme.primaryColor,
//                       ),
//                     ),
//                   ]),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "$completed ${I10n.of(context).of_} $totalQuestions",
//                     style: AppTextStyles.body11.copyWith(
//                       color: settingsController.currentAppTheme.primaryColor,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: ProgressIndicatorWidget(
//                     value: completed / totalQuestions,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
