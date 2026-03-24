import '../models/models.dart';

class MockDataService {
  static Future<List<Event>> getEvents() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return [
      Event(
        id: '1',
        title: 'Auckland Cloud Summit',
        date: 'Oct 12',
        time: '9:00 AM',
        category: 'Tech Focus',
        format: 'Conference',
        venue: 'SkyCity Convention Centre',
        address: '',
      ),
      Event(
        id: '2',
        title: 'DevOps Days NZ',
        date: 'Oct 15',
        time: '8:30 AM',
        category: 'Culture',
        format: 'Meetup',
        venue: 'Shed 10, Quay Street',
        address: '',
      ),
      Event(
        id: '3',
        title: 'Flutter Forward AKL',
        date: 'Oct 18',
        time: '6:30 PM',
        category: 'Mobile Dev',
        format: 'In-person',
        venue: 'GridAKL',
        address: '101 Pakenham St W, Wynyard Quarter',
      ),
      Event(
        id: '4',
        title: 'GraphQL API Design',
        date: 'Oct 22',
        time: '6:00 PM',
        category: 'Backend',
        format: 'Online',
        venue: 'Online',
        address: '',
      ),
      Event(
        id: '5',
        title: 'Cybersecurity for Mobile',
        date: 'Oct 28',
        time: '5:30 PM',
        category: 'Security',
        format: 'Hybrid',
        venue: 'Trade Me Auckland',
        address: '60 Wall Rd, Penrose',
      ),
    ];
  }

  static Future<List<Speaker>> getSpeakers() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    return [
      Speaker(
        id: 's1',
        name: 'Marcus Chen',
        role: 'Principal Engineer',
        company: 'Netflix',
        avatarUrl: 'https://i.pravatar.cc/150?u=marcuschen',
        talkTitle: 'Scaling K8s at Netflix',
        bio:
            'Marcus has spent the last decade building robust distributed systems. In this talk, he dives deep into the Kubernetes architecture scaling challenges at Netflix and how they maintain 99.99% uptime during peak hours.',
      ),
      Speaker(
        id: 's2',
        name: 'Sarah Jenkins',
        role: 'Tech Lead',
        company: 'Vercel',
        avatarUrl: 'https://i.pravatar.cc/150?u=sarahj',
        talkTitle: 'Future of WebAssembly',
        bio:
            'Sarah is a core contributor to several WebAssembly tooling projects. She will explore how Wasm is transforming edge computing and allowing complex Rust/C++ apps to run seamlessly in the browser.',
      ),
      Speaker(
        id: 's3',
        name: 'David Park',
        role: 'Security Engineer',
        company: 'Google',
        avatarUrl: 'https://i.pravatar.cc/150?u=davidpark',
        talkTitle: 'Security First Flutter',
        bio:
            'David leads the mobile security team. Learn how to implement bulletproof cryptography, secure local storage, and strict network policies in your Flutter applications.',
      ),
      Speaker(
        id: 's4',
        name: 'Elena Rossi',
        role: 'Research Scientist',
        company: 'IBM Quantum',
        avatarUrl: 'https://i.pravatar.cc/150?u=elenarossi',
        talkTitle: 'Quantum Computing 101',
        bio:
            'Elena breaks down the complex world of quantum gates and qubits into understandable concepts for traditional software developers, previewing what the next 10 years of computing looks like.',
      ),
      Speaker(
        id: 's5',
        name: 'Liam Tuhi',
        role: 'Lead Designer',
        company: 'Air New Zealand',
        avatarUrl: 'https://i.pravatar.cc/150?u=liam',
        talkTitle: 'Designing for the Skies',
        bio:
            'Liam shares the design system journey behind Air New Zealand’s award-winning mobile application, focusing on accessibility and premium user experiences under stressful travel scenarios.',
      ),
      Speaker(
        id: 's6',
        name: 'Priya Sharma',
        role: 'Backend Architect',
        company: 'Stripe',
        avatarUrl: 'https://i.pravatar.cc/150?u=priya',
        talkTitle: 'High-Throughput Node.js',
        bio:
            'Priya will walk through profiling and optimizing Node.js backend services to handle thousands of requests per second, managing event loop lag and memory leaks.',
      ),
    ];
  }

  static Future<List<Topic>> getTopics() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      Topic(id: 't1', title: 'AI'),
      Topic(id: 't2', title: 'Flutter'),
      Topic(id: 't3', title: 'Cloud'),
      Topic(id: 't4', title: 'DevOps'),
      Topic(id: 't5', title: 'UI / UX'),
      Topic(id: 't6', title: 'Cybersecurity'),
      Topic(id: 't7', title: 'Web3'),
    ];
  }
}
