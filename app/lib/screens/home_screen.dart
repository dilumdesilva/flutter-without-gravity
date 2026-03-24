import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import '../services/mock_data_service.dart';
import '../widgets/event_card.dart';
import '../widgets/speaker_avatar.dart';
import '../widgets/topic_chip.dart';
import '../widgets/shimmer_loading.dart';
import '../widgets/community_pulse.dart';
import '../main.dart'; // To access themeNotifier

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Event>? allEvents;
  List<Event>? filteredEvents;
  List<Speaker>? speakers;
  List<Topic>? topics;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    if (allEvents != null) {
      if (query.isEmpty) {
        setState(() => filteredEvents = allEvents);
      } else {
        setState(() {
          filteredEvents = allEvents!.where((e) {
            final titleMatch = e.title.toLowerCase().contains(query);
            final categoryMatch = e.category.toLowerCase().contains(query);
            return titleMatch || categoryMatch;
          }).toList();
        });
      }
    }
  }

  Future<void> _loadData() async {
    final futures = await Future.wait([
      MockDataService.getEvents(),
      MockDataService.getSpeakers(),
      MockDataService.getTopics(),
    ]);

    if (mounted) {
      setState(() {
        allEvents = futures[0] as List<Event>;
        filteredEvents = allEvents;
        speakers = futures[1] as List<Speaker>;
        topics = futures[2] as List<Topic>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors
          .transparent, // Uses parent main_layout background or custom scroll
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              secondary: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: AppTheme.electricBlue,
              ),
              value: isDark,
              onChanged: (bool value) {
                themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.only(
            top: 40,
            left: 24,
            right: 24,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).appBarTheme.backgroundColor?.withValues(alpha: 0.9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppTheme.electricBlue),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "What's happening in AKL",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.electricBlue,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.search, color: AppTheme.electricBlue),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 96),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search and Topics
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextField(
                      controller: _searchController,
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: InputDecoration(
                        hintText: 'Search events, speakers, or topics...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Wrap style topics
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Wrap(
                      children: topics == null
                          ? List.generate(3, (i) => const TopicChipShimmer())
                          : topics!
                                .asMap()
                                .entries
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      final text = e.key == 0
                                          ? ''
                                          : e.value.title;
                                      _searchController.text = text;
                                    },
                                    child: TopicChip(
                                      topic: e.value,
                                      isActive:
                                          _searchController.text
                                                  .toLowerCase() ==
                                              e.value.title.toLowerCase() ||
                                          (e.key == 0 &&
                                              _searchController.text.isEmpty),
                                    ),
                                  ),
                                )
                                .toList(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Upcoming Events
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upcoming events',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month, size: 16),
                          label: const Text('View Calendar'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.electricBlue,
                            side: BorderSide(
                              color: AppTheme.electricBlue.withValues(
                                alpha: 0.3,
                              ),
                            ),
                            backgroundColor: AppTheme.electricBlue.withValues(
                              alpha: 0.1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: _buildEventsSection(isDark),
                  ),
                  const SizedBox(height: 48),

                  // Speakers Grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Speakers in town',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: speakers == null
                        ? const Wrap(
                            spacing: 24,
                            runSpacing: 24,
                            children: [
                              SpeakerAvatarShimmer(),
                              SpeakerAvatarShimmer(),
                            ],
                          )
                        : GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.85,
                                  crossAxisSpacing: 24,
                                  mainAxisSpacing: 32,
                                ),
                            itemCount: speakers!.take(4).length,
                            itemBuilder: (context, index) {
                              return SpeakerAvatar(speaker: speakers![index]);
                            },
                          ),
                  ),
                  const SizedBox(height: 48),

                  // Community Pulse
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Community pulse',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CommunityPulse(),

                  const SizedBox(
                    height: 128,
                  ), // pb-32 Bottom padding for global NavBar
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsSection(bool isDark) {
    if (filteredEvents == null) {
      return SizedBox(
        key: const ValueKey('loading_events'),
        height: 380,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => const EventCardShimmer(),
        ),
      );
    }

    if (filteredEvents!.isEmpty) {
      return Container(
        key: const ValueKey('empty_events'),
        height: 380,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 80,
              color: AppTheme.electricBlue.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No events found',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyLarge?.color?.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search term',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      key: const ValueKey('events_list'),
      height: 380,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: allEvents!.map((event) {
            final isVisible = filteredEvents!.contains(event);
            return AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isVisible ? 1.0 : 0.0,
                child: isVisible
                    ? EventCard(event: event)
                    : const SizedBox.shrink(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
