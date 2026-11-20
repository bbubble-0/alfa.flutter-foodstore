import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/profile/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is Failure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load profile'),
                  const SizedBox(height: 8),
                  Text(
                    state.error['message']?.toString() ??
                        'An error occurred',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProfileBloc>()
                          .add(const ProfileEvent.loadProfile());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is LoadedProfile) {
            final profile = state.profile;

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          profile.image != null && profile.image!.isNotEmpty
                              ? NetworkImage(profile.image!)
                              : null,
                      child: profile.image == null ||
                              profile.image!.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 60,
                            )
                          : null,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      profile.name ?? 'No Name',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(profile.email ?? 'No Email'),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: Text('Profile not loaded'),
          );
        },
      ),
    );
  }
}