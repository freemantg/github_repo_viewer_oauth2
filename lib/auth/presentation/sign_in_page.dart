import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_repo_viewer_oauth2/core/presentation/app_router.gr.dart';

import '../application/auth_bloc/auth_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Icon(
                  FontAwesomeIcons.githubAlt,
                  size: 64.0,
                ),
                Spacer(),
                Text(
                  'Sign in with your GitHub Account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 14.0),
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        fillColor: MaterialStateProperty.all(Color(0xFF0fc5b5)),
                        value: true,
                        onChanged: (_) {},
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      'Stay signed in',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
                Spacer(flex: 2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthEvent.signIn(
                        (authorizationUrl) {
                          final completer = Completer<Uri>();
                          AutoRouter.of(context).push(
                            AuthorizationRoute(
                              authorizationUrl: authorizationUrl,
                              onAuthorizationCodeRedirectAttempt:
                                  (redirectedUrl) {
                                //Completer allows us to grab the redirectUrl and return it in the parent function.
                                completer.complete(redirectedUrl);
                              },
                            ),
                          );
                          return completer.future;
                        },
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF0fc5b5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18.0,
                      ),
                      child: Icon(FontAwesomeIcons.arrowRight),
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
