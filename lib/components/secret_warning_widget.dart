import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecretWarningWidget extends StatefulWidget {
  const SecretWarningWidget({
    Key? key,
    this.cadyCode,
    this.rewardKey,
  }) : super(key: key);

  final String? cadyCode;
  final String? rewardKey;

  @override
  _SecretWarningWidgetState createState() => _SecretWarningWidgetState();
}

class _SecretWarningWidgetState extends State<SecretWarningWidget> {
  ApiCallResponse? redeemReward;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 600,
      decoration: BoxDecoration(
        color: Color(0x62090F13),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x25090F13),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Text(
                'WARNING',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: FlutterFlowTheme.of(context).title3Family,
                      color: Color(0xFFFF0000),
                      fontSize: 26,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title3Family),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 25),
              child: Text(
                'You\'re about to know a secret about a Ca.dance story before anyone else.\n\nYou can only see it once.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText2Family),
                    ),
              ),
            ),
            Divider(
              height: 24,
              thickness: 2,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
              child: Text(
                'Are you sure you\'re ready?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      redeemReward = await RewardsGroup.redeemRewardCall.call(
                        circleToken: FFAppState().circletoken,
                        rewardKey: widget.rewardKey,
                      );
                      _shouldSetState = true;
                      if (RewardsGroup.redeemRewardCall.isRedeemed(
                        (redeemReward?.jsonBody ?? ''),
                      )) {
                        context.goNamed(
                          'Content-Audio',
                          queryParams: {
                            'experienceUrl': serializeParam(
                              RewardsGroup.redeemRewardCall.experienceUrl(
                                (redeemReward?.jsonBody ?? ''),
                              ),
                              ParamType.String,
                            ),
                            'title': serializeParam(
                              RewardsGroup.redeemRewardCall
                                  .title(
                                    (redeemReward?.jsonBody ?? ''),
                                  )
                                  .toString(),
                              ParamType.String,
                            ),
                            'subTitle': serializeParam(
                              RewardsGroup.redeemRewardCall
                                  .subTitle(
                                    (redeemReward?.jsonBody ?? ''),
                                  )
                                  .toString(),
                              ParamType.String,
                            ),
                            'authors': serializeParam(
                              RewardsGroup.redeemRewardCall
                                  .authors(
                                    (redeemReward?.jsonBody ?? ''),
                                  )
                                  .toString(),
                              ParamType.String,
                            ),
                            'heroUrl': serializeParam(
                              RewardsGroup.redeemRewardCall.heroImageUrl(
                                (redeemReward?.jsonBody ?? ''),
                              ),
                              ParamType.String,
                            ),
                            'description': serializeParam(
                              RewardsGroup.redeemRewardCall
                                  .description(
                                    (redeemReward?.jsonBody ?? ''),
                                  )
                                  .toString(),
                              ParamType.String,
                            ),
                            'experienceType': serializeParam(
                              RewardsGroup.redeemRewardCall
                                  .experienceType(
                                    (redeemReward?.jsonBody ?? ''),
                                  )
                                  .toString(),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                            ),
                          },
                        );

                        if (_shouldSetState) setState(() {});
                        return;
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Ruh-roh!'),
                              content: Text(RewardsGroup.redeemRewardCall
                                  .message(
                                    (redeemReward?.jsonBody ?? ''),
                                  )
                                  .toString()),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        if (_shouldSetState) setState(() {});
                        return;
                      }

                      if (_shouldSetState) setState(() {});
                    },
                    text: 'Let\'s go!',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
