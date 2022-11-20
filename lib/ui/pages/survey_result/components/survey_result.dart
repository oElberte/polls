import 'package:flutter/material.dart';

import '../survey_result.dart';
import 'components.dart';

class SurveyResult extends StatelessWidget {
  final SurveyResultViewModel viewModel;
  final void Function({@required String answer}) onSave;

  SurveyResult({
    @required this.viewModel,
    @required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return SurveyHeader(viewModel.question);
        }
        
        final indexAnswer = viewModel.answers[index - 1];
        return GestureDetector(
          onTap: () => indexAnswer.isCurrentAnswer
              ? null
              : onSave(answer: indexAnswer.answer),
          child: SurveyAnswer(indexAnswer),
        );
      },
      itemCount: viewModel.answers.length + 1,
    );
  }
}
