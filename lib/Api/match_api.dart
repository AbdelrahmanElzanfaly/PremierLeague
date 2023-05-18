import 'package:premier_league/Models/match_model.dart';
import '../Utilities/shared_preferances_helper.dart';
import '../Utilities/toast_helper.dart';
import 'api_helper.dart';
import 'package:premier_league/Utilities/extensions.dart';

class MatchApi {
  /// get Matches from Api
  static Future<List<MatchModel>> getMatchesApi() async {
    var response = await APIHelper.getRequest(
      url: APIHelper.matchApi,
    );
    if (response == null) return [];
    if (response['matches'] != []) {

      List<MatchModel> matches = await List.from(response["matches"].map((e) => MatchModel.fromJson(e)));
       /// save matches to local storage
       SharedPref.saveMatchesObj(matchModel: matches);
      return matches;
    } else {
      ToastHelper.showError(message: 'response_error'.tr);
      return [];
    }
  }
}
