import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/idea_categories/idea_categories_cubit.dart';
import '../../../application/idea_text_fields_helpers/idea_text_fields_helpers_cubit.dart';
import '../../../application/rate_idea/rate_idea_cubit.dart';
import '../../../constants.dart';
import '../../../idea_rating_questions.dart';
import '../../../repository/idea_category/idea_category_repository.dart';
import '../../widgets/adaptive_alert_dialog.dart';
import '../../widgets/idea_full_description_expanded.dart';
import 'widgets/add_idea_all_fields.dart';

class AddIdeaPage extends StatefulWidget {
  const AddIdeaPage({Key? key}) : super(key: key);

  @override
  State<AddIdeaPage> createState() => _AddIdeaPageState();
}

class _AddIdeaPageState extends State<AddIdeaPage> with TickerProviderStateMixin {
  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _fullDescriptionController;
  late TextEditingController _statusController;
  late TextEditingController _ratingController;
  late TextEditingController _revenueController;
  late TextEditingController _differentiationController;
  late TextEditingController _speedController;
  late TextEditingController _capitalController;
  final FocusNode _descriptionFullScreenFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _summaryController = TextEditingController();
    _fullDescriptionController = TextEditingController();
    _statusController = TextEditingController(text: kIdeaStatusToDo);
    _ratingController = TextEditingController(text: kIdeaTextFieldRatingInitialValue);
    _revenueController = TextEditingController();
    _differentiationController = TextEditingController();
    _speedController = TextEditingController();
    _capitalController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    _fullDescriptionController.dispose();
    _statusController.dispose();
    _ratingController.dispose();
    _revenueController.dispose();
    _differentiationController.dispose();
    _speedController.dispose();
    _capitalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<IdeaTextFieldsHelpersCubit>(
            create: (context) => IdeaTextFieldsHelpersCubit(),
          ),
          BlocProvider<RateIdeaCubit>(
            create: (context) => RateIdeaCubit()
              ..ratingsLoaded(
                questionRatings: initialIdeaRatingQuestions,
                ratingsSum: 50,
              ),
          ),
          BlocProvider<IdeaCategoriesCubit>(
            create: (context) => IdeaCategoriesCubit(
              context.read<IdeaCategoryRepository>(),
            ),
          ),
        ],
        child: WillPopScope(
          onWillPop: () async {
            bool shouldPop = false;
            await showOkCancelAlertDialog(
              context: context,
              builder: (_, __) => AdaptiveAlertDialog(
                title: kAlertDialogConfirmationTitle,
                content: kDiscardCreateIdeaDialogContent,
                leftButtonText: kAlertDialogLeftButtonText,
                rightButtonText: kAlertDialogRightButtonText,
                onLeftButtonPressed: () {
                  shouldPop = false;
                  Navigator.of(context).pop();
                },
                onRightButtonPressed: () {
                  shouldPop = true;
                  Navigator.of(context).pop();
                },
              ),
            );
            return shouldPop;
          },
          child: GestureDetector(
            //Dismiss keyboard when user taps somewhere outside a TextField
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: BlocBuilder<IdeaTextFieldsHelpersCubit, IdeaTextFieldsHelpersState>(
                  builder: (context, state) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    switchInCurve: Curves.fastOutSlowIn,
                    switchOutCurve: Curves.fastOutSlowIn,
                    //Default animation is FadeTransition, changed type to Scale for smoother feel
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      alignment: Alignment.bottomRight,
                      child: child,
                    ),
                    child: state.isDescriptionExpanded
                        ? IdeaFullDescriptionExpanded(
                            //A key is needed here so that AnimatedSwitcher can know the difference between children and animate them
                            key: const ValueKey<int>(0),
                            fullDescriptionController: _fullDescriptionController,
                            descriptionFullScreenFocusNode: _descriptionFullScreenFocusNode,
                          )
                        : AddIdeaAllFields(
                            key: const ValueKey<int>(1),
                            titleController: _titleController,
                            summaryController: _summaryController,
                            fullDescriptionController: _fullDescriptionController,
                            statusController: _statusController,
                            ratingController: _ratingController,
                            descriptionFullScreenFocusNode: _descriptionFullScreenFocusNode,
                            revenueController: _revenueController,
                            differentiationController: _differentiationController,
                            speedController: _speedController,
                            capitalController: _capitalController,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
