import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/api_response.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int stars = 1, like = 1;
  String feedBack = '';

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text(Consts.FEEDBACK),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.maxFinite,
              height: 24,
            ),
            UserTile(
              mainAxisSize: MainAxisSize.min,
            ),
            const SizedBox(
              width: double.maxFinite,
              height: 12,
            ),
            RatingBar.builder(
              initialRating: stars.toDouble(),
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              unratedColor: Theme.of(context).dividerColor,
              glowColor: Colors.amber,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_rounded,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                stars = rating.round();
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MTextField(
              hint: 'Write your valuable feedback...',
              minLines: 3,
              maxLines: 5,
              label: 'Feedback',
              onChanged: (d) {
                feedBack = d;
              },
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    like == 1
                        ? CupertinoIcons.hand_thumbsup_fill
                        : CupertinoIcons.hand_thumbsup,
                    color: MTheme.ICON_COLOR,
                  ),
                  onPressed: () {
                    setState(() {
                      like = like == 1 ? 0 : 1;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: OutlinedButton(
                child: const Text('Submit'),
                onPressed: () async {
                  final call =
                      Injector().apiService.get(path: 'SaveFeedback', query: {
                    'Key_id': '${LocalStorage.getUser().id}',
                    'LikeStatus': like,
                    'StarCount': stars,
                    'FeedBack': feedBack,
                    'ReviewBy_Status':
                        AppConfig.of(context)?.config == Config.patient ? 0 : 1
                  });
                  final res =
                      await ApiFacade.callApi(context: context, call: call);
                  // context.pop();

                  // if (res is ApiResponse) {
                  //   context.pop();
                  // }
                  if (res != null) {
                    context.pop();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
