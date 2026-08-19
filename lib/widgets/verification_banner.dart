import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

// Banner shown above the navbar when the user has not verified their email.
class VerificationBanner extends StatefulWidget {
  const VerificationBanner({Key? key}) : super(key: key);

  @override
  _VerificationBannerState createState() => _VerificationBannerState();
}

class _VerificationBannerState extends State<VerificationBanner>
    with WidgetsBindingObserver {
  AdminUserRead? user;
  bool sending = false;
  bool sent = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadUser();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Re-check when coming back to the app
    if (state == AppLifecycleState.resumed) {
      _loadUser();
    }
  }

  Future<void> _loadUser() async {
    try {
      final response = await ApiService.apiClient.getUsersApi().usersGetMe();
      if (!mounted) return;
      setState(() {
        user = response.data;
      });
    } catch (error) {
      // If we can't fetch the user we simply don't show the banner
    }
  }

  Future<void> _requestVerification() async {
    final email = user?.email;
    if (email == null || sending) return;
    setState(() {
      sending = true;
    });
    var t = AppLocalizations.of(context)!;
    try {
      await ApiService.apiClient.getAuthApi().authVerifyRequestToken(
        bodyAuthVerifyRequestToken: BodyAuthVerifyRequestToken(
          (b) => b..email = email,
        ),
      );
      if (!mounted) return;
      setState(() {
        sending = false;
        sent = true;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.verifyEmailSent)));
    } catch (error) {
      if (!mounted) return;
      setState(() {
        sending = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.verifyEmailFailed)));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only show the banner once we know the user isn't verified
    if (user == null || user!.isVerified != false) {
      return SizedBox.shrink();
    }

    var t = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.errorContainer,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: colors.onErrorContainer,
              size: 22,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                t.verifyEmailBanner,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.onErrorContainer,
                ),
              ),
            ),
            SizedBox(width: 8),
            TextButton(
              onPressed: (sending || sent) ? null : _requestVerification,
              style: TextButton.styleFrom(
                foregroundColor: colors.onPrimary,
                padding: EdgeInsets.symmetric(horizontal: 8),
                minimumSize: Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: sending
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.onErrorContainer,
                      ),
                    )
                  : Text(sent ? t.verifyEmailSentShort : t.verifyEmailAction),
            ),
          ],
        ),
      ),
    );
  }
}
