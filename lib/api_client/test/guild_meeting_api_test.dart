import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for GuildMeetingApi
void main() {
  final instance = ApiClient().getGuildMeetingApi();

  group(GuildMeetingApi, () {
    // Get Guild Meeting
    //
    //Future<GuildMeetingRead> guildMeetingGetGuildMeeting() async
    test('test guildMeetingGetGuildMeeting', () async {
      // TODO
    });

    // Update Guild Meeting
    //
    //Future<GuildMeetingRead> guildMeetingUpdateGuildMeeting(GuildMeetingUpdate guildMeetingUpdate) async
    test('test guildMeetingUpdateGuildMeeting', () async {
      // TODO
    });

  });
}
