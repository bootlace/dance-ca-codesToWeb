import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PinCheckWidget extends StatefulWidget {
  const PinCheckWidget({
    Key? key,
    this.email,
    this.challengeID,
  }) : super(key: key);

  final String? email;
  final String? challengeID;

  @override
  _PinCheckWidgetState createState() => _PinCheckWidgetState();
}

class _PinCheckWidgetState extends State<PinCheckWidget> {
  ApiCallResponse? capiResult;
  TextEditingController? pinCodeController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    pinCodeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'PinCheck',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Drawer(
            elevation: 16,
            child: Text(
              'HELP MENU',
              style: FlutterFlowTheme.of(context).title1,
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'PIN Login',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            actions: [],
            centerTitle: true,
            elevation: 1,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Keeping your data safe.',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                      Text(
                        '(Without passwords :)',
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(44, 25, 44, 0),
                        child: Text(
                          'Please enter the PIN we just emailed you.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText2Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText2Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 32, 15, 10),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 6,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                          mainAxisAlignment: MainAxisAlignment.center,
                          enableActiveFill: false,
                          autoFocus: true,
                          showCursor: true,
                          cursorColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          obscureText: false,
                          hintCharacter: '●',
                          pinTheme: PinTheme(
                            fieldHeight: 60,
                            fieldWidth: 60,
                            borderWidth: 2,
                            borderRadius: BorderRadius.circular(12),
                            shape: PinCodeFieldShape.circle,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            inactiveColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            selectedColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            activeFillColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            inactiveFillColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            selectedFillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          controller: pinCodeController,
                          onChanged: (_) => {},
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Text(
                          'Need help?',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/security_badge_cbmon_faded.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      capiResult = await AuthGroup.validatePinCall.call(
                        pin: int.tryParse(pinCodeController!.text),
                        login: widget.email,
                        method: 'email',
                        challengeID: widget.challengeID,
                      );
                      _shouldSetState = true;
                      if (AuthGroup.validatePinCall.pinIsValid(
                            (capiResult?.jsonBody ?? ''),
                          ) ==
                          true) {
                        FFAppState().update(() {
                          FFAppState().memberid = AuthGroup.validatePinCall
                              .memberID(
                                (capiResult?.jsonBody ?? ''),
                              )
                              .toString();
                          FFAppState().circletoken = AuthGroup.validatePinCall
                              .sessionToken(
                                (capiResult?.jsonBody ?? ''),
                              )
                              .toString();
                        });

                        context.goNamed('Landing');
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Doh!'),
                              content: Text('That\'s not right. Try again?'),
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
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: 270,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
