import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ═══════════════════════════════
//  PALETTE VIOLET + BLANC
// ═══════════════════════════════
const kPurple      = Color(0xFF6B3FA0);
const kPurpleDark  = Color(0xFF3D1A6E);
const kPurpleLight = Color(0xFFEDE4F7);
const kPurpleMid   = Color(0xFF9B6BC8);
const kGold        = Color(0xFFD4A017);
const kGoldLight   = Color(0xFFFBF3DC);
const kWhite       = Color(0xFFFFFFFF);
const kBg          = Color(0xFFF8F5FF);
const kDark        = Color(0xFF1A0A2E);
const kGray        = Color(0xFF7B6B9A);
const kGrayLight   = Color(0xFFF0EBF8);
const kGreen       = Color(0xFF2E7D52);
const kGreenLight  = Color(0xFFE8F5EE);
const kRed         = Color(0xFFB00020);
const kRedLight    = Color(0xFFFFEBEE);

void main() {
  runApp(const WariSidjiApp());
}

class WariSidjiApp extends StatelessWidget {
  const WariSidjiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WariSidji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPurple),
        scaffoldBackgroundColor: kBg,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

// ═══════════════════════════════
//  ÉCRAN ONBOARDING
// ═══════════════════════════════
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 81, 39, 140),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 88, height: 88,
                decoration: BoxDecoration(
                  color: kPurple,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [BoxShadow(color: kGold.withOpacity(0.3), blurRadius: 24, offset: const Offset(0, 8))],
                  border: Border.all(color: kGold.withOpacity(0.4), width: 2),
                ),
                child: const Center(child: Text('🪙', style: TextStyle(fontSize: 44))),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: 'Wari', style: GoogleFonts.sora(fontSize: 40, fontWeight: FontWeight.w800, color: kWhite)),
                  TextSpan(text: 'Sidji', style: GoogleFonts.sora(fontSize: 40, fontWeight: FontWeight.w800, color: kGold)),
                ]),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: kGold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kGold.withOpacity(0.3)),
                ),
                child: Text('Plateforme AVEC Digitale', style: GoogleFonts.dmSans(fontSize: 12, color: kGold, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 12),
              Text(
                'La confiance ne devrait pas suffire\nquand il s\'agit d\'argent.',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(fontSize: 14, color: Colors.white54, fontStyle: FontStyle.italic, height: 1.6),
              ),
              const SizedBox(height: 36),

              // DESCRIPTION AVEC
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A1450),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kPurple.withOpacity(0.4)),
                ),
                child: Column(children: [
                  Text('QU\'EST-CE QU\'UNE AVEC ?', style: GoogleFonts.dmSans(fontSize: 10, fontWeight: FontWeight.w700, color: kGold, letterSpacing: 1.5)),
                  const SizedBox(height: 14),
                  Row(children: [
                    Expanded(child: _AvecFeature(emoji: '🪙', label: 'Acheter des parts chaque réunion')),
                    const SizedBox(width: 10),
                    Expanded(child: _AvecFeature(emoji: '💳', label: 'Emprunter dans la caisse commune')),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    Expanded(child: _AvecFeature(emoji: '📈', label: 'Intérêts qui grossissent la caisse')),
                    const SizedBox(width: 10),
                    Expanded(child: _AvecFeature(emoji: '🎁', label: 'Partage des bénéfices en fin de cycle')),
                  ]),
                ]),
              ),
              const SizedBox(height: 36),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGold, foregroundColor: kDark,
                    padding: const EdgeInsets.symmetric(vertical: 16), elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Text('Creer un compte', style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kWhite,
                    side: BorderSide(color: kWhite.withOpacity(0.3), width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Text("J'ai deja un compte", style: GoogleFonts.sora(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvecFeature extends StatelessWidget {
  final String emoji;
  final String label;
  const _AvecFeature({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 123, 76, 181).withOpacity(0.3), borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 6),
        Text(label, style: GoogleFonts.dmSans(fontSize: 11, color: Colors.white70, height: 1.4)),
      ]),
    );
  }
}

// ═══════════════════════════════
//  INSCRIPTION
// ═══════════════════════════════
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _BackButton(),
            const SizedBox(height: 24),
            Text('Creer mon compte', style: GoogleFonts.sora(fontSize: 26, fontWeight: FontWeight.w800, color: kDark)),
            const SizedBox(height: 6),
            Text('Etape 1 sur 3', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
            const SizedBox(height: 16),
            const _ProgressBar(step: 1, total: 3),
            const SizedBox(height: 32),
            Center(child: Container(width: 80, height: 80, decoration: BoxDecoration(color: kPurpleLight, shape: BoxShape.circle, border: Border.all(color: kPurple, width: 2)), child: const Icon(Icons.camera_alt, color: kPurple, size: 32))),
            const SizedBox(height: 28),
            const _FieldLabel(label: 'Prenom et Nom'),
            const SizedBox(height: 8),
            const _InputField(hint: 'Ex: Kouadio Affoué', icon: Icons.person_outline),
            const SizedBox(height: 18),
            const _FieldLabel(label: 'Numero de telephone'),
            const SizedBox(height: 8),
            const _InputField(hint: '+225 XX XX XX XX XX', icon: Icons.phone_outlined),
            const SizedBox(height: 18),
            const _FieldLabel(label: 'Ville / Quartier'),
            const SizedBox(height: 8),
            const _InputField(hint: 'Ex: Abidjan, Yopougon', icon: Icons.location_on_outlined),
            const SizedBox(height: 18),
            const _FieldLabel(label: "Nom d'utilisateur"),
            const SizedBox(height: 8),
            const _InputField(hint: 'Ex: affoue_kouadio', icon: Icons.alternate_email),
            const SizedBox(height: 18),
            const _FieldLabel(label: 'Mot de passe'),
            const SizedBox(height: 8),
            const _InputField(hint: 'Minimum 8 caracteres', icon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 18),
            const _FieldLabel(label: 'Confirmer le mot de passe'),
            const SizedBox(height: 8),
            const _InputField(hint: 'Repetez votre mot de passe', icon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 18),
            const _FieldLabel(label: 'Recto de la CNI'),
            const SizedBox(height: 8),
            const _UploadBox(label: 'Appuyer pour ajouter le recto'),
            const SizedBox(height: 18),
            const _FieldLabel(label: 'Verso de la CNI'),
            const SizedBox(height: 8),
            const _UploadBox(label: 'Appuyer pour ajouter le verso'),
            const SizedBox(height: 36),
            _PrimaryButton(label: 'Continuer ->', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CharterScreen()))),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}

// ═══════════════════════════════
//  CHARTE + SIGNATURE
// ═══════════════════════════════
class CharterScreen extends StatefulWidget {
  const CharterScreen({super.key});
  @override
  State<CharterScreen> createState() => _CharterScreenState();
}

class _CharterScreenState extends State<CharterScreen> {
  bool _r1 = false, _r2 = false, _r3 = false, _r4 = false, _r5 = false, _signed = false;
  bool get _all => _r1 && _r2 && _r3 && _r4 && _r5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _BackButton(),
              const SizedBox(height: 20),
              Text('Charte et Engagement', style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.w800, color: kDark)),
              const SizedBox(height: 6),
              Text('Etape 2 sur 3', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
              const SizedBox(height: 16),
              const _ProgressBar(step: 2, total: 3),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: kGoldLight, borderRadius: BorderRadius.circular(14), border: Border.all(color: kGold.withOpacity(0.4))),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('📜', style: TextStyle(fontSize: 22)),
                    const SizedBox(width: 12),
                    Expanded(child: Text('Dans la tradition africaine, la parole donnee est sacree. Votre engagement numerique a la meme valeur. Cochez et signez pour confirmer.', style: GoogleFonts.dmSans(fontSize: 13, color: kDark, height: 1.5))),
                  ]),
                ),
                const SizedBox(height: 20),
                _RuleCheckbox(checked: _r1, emoji: '💸', title: 'Ponctualite', description: "Je m'engage a payer mes parts dans les delais fixes.", onChanged: (v) => setState(() => _r1 = v!)),
                _RuleCheckbox(checked: _r2, emoji: '🔒', title: 'Caution obligatoire', description: "J'accepte de verser une caution equivalente a 2 cotisations.", onChanged: (v) => setState(() => _r2 = v!)),
                _RuleCheckbox(checked: _r3, emoji: '🤝', title: 'Respect du groupe', description: "Je m'engage a respecter tous les membres.", onChanged: (v) => setState(() => _r3 = v!)),
                _RuleCheckbox(checked: _r4, emoji: '📱', title: 'Informations exactes', description: "Je certifie que toutes mes informations sont vraies.", onChanged: (v) => setState(() => _r4 = v!)),
                _RuleCheckbox(checked: _r5, emoji: '⚖️', title: 'Acceptation des penalites', description: "J'accepte les amendes automatiques en cas de retard.", onChanged: (v) => setState(() => _r5 = v!)),
                if (_all) ...[
                  const SizedBox(height: 20),
                  Text('SIGNATURE DIGITALE', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => setState(() => _signed = !_signed),
                    child: Container(
                      width: double.infinity, padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: _signed ? kPurpleLight : kWhite,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: _signed ? kPurple : kGray.withOpacity(0.3), width: _signed ? 2 : 1),
                      ),
                      child: Column(children: [
                        Icon(_signed ? Icons.verified : Icons.draw_outlined, color: _signed ? kPurple : kGray, size: 36),
                        const SizedBox(height: 8),
                        Text(_signed ? 'Signe numeriquement affoue Kouadio' : 'Appuyez pour signer', style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w600, color: _signed ? kPurple : kGray)),
                        if (_signed) ...[
                          const SizedBox(height: 4),
                          Text('Signature enregistree le ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                        ],
                      ]),
                    ),
                  ),
                ],
                if (!_all) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: kGoldLight, borderRadius: BorderRadius.circular(10), border: Border.all(color: kGold.withOpacity(0.5))),
                    child: Row(children: [
                      const Text('⚠️', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 10),
                      Expanded(child: Text('Veuillez cocher toutes les cases pour continuer.', style: GoogleFonts.dmSans(fontSize: 12, color: kDark))),
                    ]),
                  ),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (_all && _signed) ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen())) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple, disabledBackgroundColor: kGrayLight,
                      foregroundColor: kWhite, disabledForegroundColor: kGray,
                      padding: const EdgeInsets.symmetric(vertical: 16), elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text("J'accepte et je signe ->", style: GoogleFonts.sora(fontSize: 15, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

// ═══════════════════════════════
//  OTP
// ═══════════════════════════════
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _c = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _f = List.generate(4, (_) => FocusNode());
  bool get _ok => _c.every((c) => c.text.isNotEmpty);

  @override
  void dispose() { for (final c in _c) c.dispose(); for (final f in _f) f.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _BackButton(),
            const SizedBox(height: 24),
            Text('Verification', style: GoogleFonts.sora(fontSize: 26, fontWeight: FontWeight.w800, color: kDark)),
            const SizedBox(height: 6),
            Text('Etape 3 sur 3', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
            const SizedBox(height: 16),
            const _ProgressBar(step: 3, total: 3),
            const SizedBox(height: 40),
            Center(child: Container(width: 90, height: 90, decoration: const BoxDecoration(color: kPurpleLight, shape: BoxShape.circle), child: const Center(child: Text('📱', style: TextStyle(fontSize: 44))))),
            const SizedBox(height: 24),
            Center(child: Text('Code envoye par SMS', style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w700, color: kDark))),
            const SizedBox(height: 8),
            Center(child: Text('+225 07 12 34 56 78', style: GoogleFonts.dmSans(fontSize: 14, color: kPurple, fontWeight: FontWeight.bold))),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (i) => SizedBox(
                width: 60, height: 65,
                child: TextField(
                  controller: _c[i], focusNode: _f[i],
                  textAlign: TextAlign.center, keyboardType: TextInputType.number, maxLength: 1,
                  style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.w800, color: kDark),
                  decoration: InputDecoration(
                    counterText: '', filled: true, fillColor: kGrayLight,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: kPurple, width: 2)),
                  ),
                  onChanged: (v) { if (v.isNotEmpty && i < 3) _f[i + 1].requestFocus(); setState(() {}); },
                ),
              )),
            ),
            const SizedBox(height: 32),
            Center(child: GestureDetector(onTap: () {}, child: RichText(text: TextSpan(style: GoogleFonts.dmSans(fontSize: 13, color: kGray), children: [const TextSpan(text: "Pas recu le code ? "), TextSpan(text: 'Renvoyer', style: TextStyle(color: kPurple, fontWeight: FontWeight.bold))])))),
            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _ok ? () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPurple, disabledBackgroundColor: kGrayLight,
                  foregroundColor: kWhite, disabledForegroundColor: kGray,
                  padding: const EdgeInsets.symmetric(vertical: 16), elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text('Valider mon numero', style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}

// ═══════════════════════════════
//  LOGIN
// ═══════════════════════════════
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _BackButton(),
            const SizedBox(height: 32),
            Center(child: Container(width: 70, height: 70, decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(22)), child: const Center(child: Text('🪙', style: TextStyle(fontSize: 34))))),
            const SizedBox(height: 16),
            Center(child: RichText(text: TextSpan(children: [
              TextSpan(text: 'Wari', style: GoogleFonts.sora(fontSize: 28, fontWeight: FontWeight.w800, color: kDark)),
              TextSpan(text: 'Sidji', style: GoogleFonts.sora(fontSize: 28, fontWeight: FontWeight.w800, color: kGold)),
            ]))),
            const SizedBox(height: 6),
            Center(child: Text('Bon retour parmi nous 👋', style: GoogleFonts.dmSans(fontSize: 14, color: kGray, fontStyle: FontStyle.italic))),
            const SizedBox(height: 40),
            const _FieldLabel(label: "Nom d'utilisateur ou telephone"),
            const SizedBox(height: 8),
            const _InputField(hint: 'Ex: affoue_kouadio', icon: Icons.person_outline),
            const SizedBox(height: 18),
            const _FieldLabel(label: 'Mot de passe'),
            const SizedBox(height: 8),
            const _InputField(hint: 'Votre mot de passe', icon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 12),
            Align(alignment: Alignment.centerRight, child: GestureDetector(onTap: () {}, child: Text('Mot de passe oublie ?', style: GoogleFonts.dmSans(fontSize: 13, color: kPurple, fontWeight: FontWeight.w600)))),
            const SizedBox(height: 32),
            _PrimaryButton(label: 'Se connecter', onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))),
            const SizedBox(height: 16),
            Row(children: [const Expanded(child: Divider()), Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Text('ou', style: GoogleFonts.dmSans(fontSize: 13, color: kGray))), const Expanded(child: Divider())]),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())),
                style: OutlinedButton.styleFrom(foregroundColor: kPurple, side: const BorderSide(color: kPurple, width: 1.5), padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                child: Text('Creer un compte', style: GoogleFonts.sora(fontSize: 15, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}

// ═══════════════════════════════
//  HOME
// ═══════════════════════════════
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;
  final List<Widget> _pages = [_AccueilTab(), _GroupesTab(), _PaiementsTab(), _ProfilTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: _pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        selectedItemColor: kPurple,
        unselectedItemColor: kGray,
        backgroundColor: kWhite,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), activeIcon: Icon(Icons.group), label: 'Groupes'),
          BottomNavigationBarItem(icon: Icon(Icons.payments_outlined), activeIcon: Icon(Icons.payments), label: 'Paiements'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ═══════════════════════════════
//  ONGLET ACCUEIL
// ═══════════════════════════════
class _AccueilTab extends StatelessWidget {
  _AccueilTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Bonjour 👋', style: GoogleFonts.dmSans(fontSize: 14, color: kGray)),
              Text('Amoin', style: GoogleFonts.sora(fontSize: 22, fontWeight: FontWeight.w800, color: kDark)),
            ]),
            Container(width: 46, height: 46, decoration: const BoxDecoration(color: kPurpleLight, shape: BoxShape.circle), child: const Center(child: Text('👩🏿', style: TextStyle(fontSize: 24)))),
          ]),
          const SizedBox(height: 24),

          // CARTE SOLDE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [kPurpleDark, kPurple], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [BoxShadow(color: kPurple.withOpacity(0.35), blurRadius: 20, offset: const Offset(0, 8))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Epargne totale (parts)', style: GoogleFonts.dmSans(fontSize: 13, color: Colors.white60)),
              const SizedBox(height: 6),
              Text('47 500 FCFA', style: GoogleFonts.sora(fontSize: 30, fontWeight: FontWeight.w800, color: kWhite)),
              const SizedBox(height: 12),
              Row(children: [
                _MiniStat(label: 'Parts achetees', value: '94', icon: '🪙'),
                const SizedBox(width: 10),
                _MiniStat(label: 'Gain prevu', value: '+12%', icon: '📈'),
                const SizedBox(width: 10),
                _MiniStat(label: 'Score', value: '87⭐', icon: ''),
              ]),
            ]),
          ),
          const SizedBox(height: 24),

          // 3 CAISSES
          Text('LES 3 CAISSES', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _CaisseCard(label: "Caisse d'epargne", amount: '320 000', icon: '🏦', color: kPurple)),
            const SizedBox(width: 10),
            Expanded(child: _CaisseCard(label: 'Caisse de credit', amount: '85 000', icon: '💳', color: kGreen)),
            const SizedBox(width: 10),
            Expanded(child: _CaisseCard(label: 'Fonds social', amount: '12 000', icon: '🤝', color: kGold)),
          ]),
          const SizedBox(height: 24),

          Text('ACTIONS', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CreateGroupScreen())),
              child: _ActionCard(emoji: '➕', label: 'Creer un groupe', color: kPurple, light: kPurpleLight),
            )),
            const SizedBox(width: 12),
            Expanded(child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => JoinGroupScreen())),
              child: _ActionCard(emoji: '🔗', label: 'Rejoindre', color: kPurple, light: kPurpleLight, outlined: true),
            )),
          ]),
          const SizedBox(height: 24),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('MES AVEC', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
            Text('Tout voir', style: GoogleFonts.dmSans(fontSize: 12, color: kPurple, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 12),
          _AvecCard(name: 'AVEC Marche Adjame', members: 20, parts: 94, cycle: '4/52', status: 'Actif', statusColor: kGreen),
          _AvecCard(name: 'AVEC Soeurs Unies', members: 15, parts: 45, cycle: '12/52', status: 'A payer', statusColor: const Color(0xFFD97706)),
        ]),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final String icon;
  const _MiniStat({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text('$icon $value', style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w700, color: kWhite)),
        Text(label, style: GoogleFonts.dmSans(fontSize: 9, color: Colors.white60)),
      ]),
    );
  }
}

class _CaisseCard extends StatelessWidget {
  final String label;
  final String amount;
  final String icon;
  final Color color;
  const _CaisseCard({required this.label, required this.amount, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: color.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 3))], border: Border.all(color: color.withOpacity(0.2))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 6),
        Text('$amount F', style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w800, color: color)),
        const SizedBox(height: 2),
        Text(label, style: GoogleFonts.dmSans(fontSize: 9, color: kGray, height: 1.3)),
      ]),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String emoji;
  final String label;
  final Color color;
  final Color light;
  final bool outlined;
  const _ActionCard({required this.emoji, required this.label, required this.color, required this.light, this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: outlined ? kWhite : color,
        borderRadius: BorderRadius.circular(16),
        border: outlined ? Border.all(color: color, width: 1.5) : null,
        boxShadow: [BoxShadow(color: color.withOpacity(outlined ? 0.08 : 0.2), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(emoji, style: const TextStyle(fontSize: 26)),
        const SizedBox(height: 10),
        Text(label, style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w700, color: outlined ? kDark : kWhite)),
      ]),
    );
  }
}

class _AvecCard extends StatelessWidget {
  final String name;
  final int members;
  final int parts;
  final String cycle;
  final String status;
  final Color statusColor;
  const _AvecCard({required this.name, required this.members, required this.parts, required this.cycle, required this.status, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: kPurple.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Row(children: [
        Container(width: 44, height: 44, decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(12)), child: const Center(child: Text('👥', style: TextStyle(fontSize: 22)))),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w700, color: kDark)),
          const SizedBox(height: 4),
          Text('$members membres · $parts parts · Semaine $cycle', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
          child: Text(status, style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: statusColor)),
        ),
      ]),
    );
  }
}

// ═══════════════════════════════
//  ONGLET GROUPES
// ═══════════════════════════════
class _GroupesTab extends StatelessWidget {
  _GroupesTab();

  final List<Map<String, dynamic>> _groupes = const [
    {'nom': 'AVEC Marche Adjame', 'membres': 20, 'partVal': 500, 'semaine': 4, 'total': 52, 'caisse': 320000, 'credit': 85000, 'social': 12000, 'status': 'Actif', 'statusColor': Color(0xFF2E7D52), 'payes': 17},
    {'nom': 'AVEC Soeurs Unies', 'membres': 15, 'partVal': 1000, 'semaine': 12, 'total': 52, 'caisse': 180000, 'credit': 45000, 'social': 8000, 'status': 'A payer', 'statusColor': Color(0xFFD97706), 'payes': 10},
    {'nom': 'AVEC Yop-City', 'membres': 18, 'partVal': 750, 'semaine': 1, 'total': 52, 'caisse': 27000, 'credit': 0, 'social': 1800, 'status': 'Nouveau', 'statusColor': Color(0xFF6B3FA0), 'payes': 18},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
          child: Text('Mes Groupes AVEC', style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.w800, color: kDark)),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: _groupes.length,
            itemBuilder: (context, i) {
              final g = _groupes[i];
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GroupDetailScreen(groupe: g))),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: kPurple.withOpacity(0.07), blurRadius: 10, offset: const Offset(0, 4))]),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Expanded(child: Text(g['nom'], style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w700, color: kDark))),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: (g['statusColor'] as Color).withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                        child: Text(g['status'], style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: g['statusColor'] as Color)),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    // 3 CAISSES MINI
                    Row(children: [
                      _StatChip(icon: '🏦', label: '${g['caisse']} F'),
                      const SizedBox(width: 6),
                      _StatChip(icon: '💳', label: '${g['credit']} F'),
                      const SizedBox(width: 6),
                      _StatChip(icon: '🤝', label: '${g['social']} F'),
                    ]),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(value: (g['payes'] as int) / (g['membres'] as int), backgroundColor: kGrayLight, color: kPurple, minHeight: 6),
                    ),
                    const SizedBox(height: 6),
                    Text('${g['payes']}/${g['membres']} ont paye · Semaine ${g['semaine']}/${g['total']}', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                  ]),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

// ═══════════════════════════════
//  ONGLET PAIEMENTS
// ═══════════════════════════════
class _PaiementsTab extends StatelessWidget {
  _PaiementsTab();

  final List<Map<String, dynamic>> _paiements = const [
    {'groupe': 'AVEC Marche Adjame', 'montant': '1 500', 'date': 'Mer. 12 mars', 'type': 'Achat de parts (3)', 'sens': 'sortie'},
    {'groupe': 'AVEC Soeurs Unies', 'montant': '50 000', 'date': 'Lun. 3 mars', 'type': 'Emprunt recu', 'sens': 'entree'},
    {'groupe': 'AVEC Marche Adjame', 'montant': '55 000', 'date': 'Mer. 5 fev', 'type': 'Remboursement emprunt', 'sens': 'sortie'},
    {'groupe': 'AVEC Yop-City', 'montant': '750', 'date': 'Lun. 1 mars', 'type': 'Achat de parts (1)', 'sens': 'sortie'},
    {'groupe': 'AVEC Marche Adjame', 'montant': '120 000', 'date': 'Dec. 2024', 'type': 'Partage fin de cycle', 'sens': 'entree'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(padding: const EdgeInsets.fromLTRB(24, 28, 24, 8), child: Text('Mes Paiements', style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.w800, color: kDark))),
        Padding(padding: const EdgeInsets.fromLTRB(24, 0, 24, 16), child: Text('Toutes vos transactions AVEC', style: GoogleFonts.dmSans(fontSize: 13, color: kGray))),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: _paiements.length,
            itemBuilder: (context, i) {
              final p = _paiements[i];
              final isSortie = p['sens'] == 'sortie';
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: kPurple.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3))]),
                child: Row(children: [
                  Container(width: 44, height: 44, decoration: BoxDecoration(color: isSortie ? kPurpleLight : kGreenLight, borderRadius: BorderRadius.circular(12)), child: Center(child: Text(isSortie ? '💸' : '💰', style: const TextStyle(fontSize: 20)))),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(p['type'], style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w700, color: kDark)),
                    const SizedBox(height: 3),
                    Text(p['groupe'], style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                    Text(p['date'], style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                  ])),
                  Text('${isSortie ? '-' : '+'}${p['montant']} F', style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w800, color: isSortie ? kPurple : kGreen)),
                ]),
              );
            },
          ),
        ),
      ]),
    );
  }
}

// ═══════════════════════════════
//  ONGLET PROFIL + SCORE
// ═══════════════════════════════
class _ProfilTab extends StatelessWidget {
  _ProfilTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(children: [
          Container(
            width: double.infinity, padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [kPurpleDark, kPurple], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(children: [
              Container(width: 80, height: 80, decoration: BoxDecoration(color: Colors.white24, shape: BoxShape.circle, border: Border.all(color: kWhite, width: 2)), child: const Center(child: Text('👩🏿', style: TextStyle(fontSize: 40)))),
              const SizedBox(height: 12),
              Text('Amoin Kouadio', style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w800, color: kWhite)),
              Text('Amoin_kouadio', style: GoogleFonts.dmSans(fontSize: 13, color: Colors.white60)),
              const SizedBox(height: 8),
              Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)), child: Text('Orange Money - Verifie ✅', style: GoogleFonts.dmSans(fontSize: 12, color: Colors.white))),
            ]),
          ),
          const SizedBox(height: 20),

          // SCORE DETAILLE
          Container(
            width: double.infinity, padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: kPurple.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))]),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Score de Confiance', style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w700, color: kDark)),
                GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScoreDetailScreen())), child: Text('Voir detail ->', style: GoogleFonts.dmSans(fontSize: 12, color: kPurple, fontWeight: FontWeight.w600))),
              ]),
              const SizedBox(height: 16),
              Row(children: [
                Stack(alignment: Alignment.center, children: [
                  SizedBox(width: 80, height: 80, child: CircularProgressIndicator(value: 0.87, strokeWidth: 8, backgroundColor: kGrayLight, valueColor: const AlwaysStoppedAnimation<Color>(kPurple))),
                  Column(children: [
                    Text('87', style: GoogleFonts.sora(fontSize: 20, fontWeight: FontWeight.w800, color: kPurple)),
                    Text('/100', style: GoogleFonts.dmSans(fontSize: 10, color: kGray)),
                  ]),
                ]),
                const SizedBox(width: 20),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Tres fiable', style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w700, color: kDark)),
                  const SizedBox(height: 4),
                  Text('Vous payez toujours a temps. Les groupes vous font confiance !', style: GoogleFonts.dmSans(fontSize: 12, color: kGray, height: 1.4)),
                  const SizedBox(height: 6),
                  const Text('⭐⭐⭐⭐☆', style: TextStyle(fontSize: 14)),
                ])),
              ]),
              const SizedBox(height: 16),
              _ScoreBar(label: 'Ponctualite', value: 0.92, color: kGreen),
              const SizedBox(height: 8),
              _ScoreBar(label: 'Regularite', value: 0.85, color: kPurple),
              const SizedBox(height: 8),
              _ScoreBar(label: 'Anciennete', value: 0.78, color: kGold),
            ]),
          ),
          const SizedBox(height: 16),

          Row(children: [
            _ProfilStat(valeur: '3', label: 'Groupes'),
            _ProfilStat(valeur: '12', label: 'Reunions'),
            _ProfilStat(valeur: '0', label: 'Retards'),
          ]),
          const SizedBox(height: 16),

          _ProfilItem(icon: Icons.phone_outlined, label: 'Telephone', valeur: '+225 07 12 34 56 78'),
          _ProfilItem(icon: Icons.location_on_outlined, label: 'Ville', valeur: 'Abidjan, Yopougon'),
          _ProfilItem(icon: Icons.calendar_today_outlined, label: 'Membre depuis', valeur: 'Janvier 2025'),
          _ProfilItem(icon: Icons.badge_outlined, label: 'CNI', valeur: 'Verifiee ✅'),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const OnboardingScreen()), (r) => false),
              icon: const Icon(Icons.logout, size: 18),
              label: Text('Se deconnecter', style: GoogleFonts.sora(fontSize: 15, fontWeight: FontWeight.w600)),
              style: OutlinedButton.styleFrom(foregroundColor: kPurple, side: const BorderSide(color: kPurple), padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
            ),
          ),
        ]),
      ),
    );
  }
}

// ═══════════════════════════════
//  DETAIL GROUPE AVEC
// ═══════════════════════════════
class GroupDetailScreen extends StatelessWidget {
  final Map<String, dynamic> groupe;
  const GroupDetailScreen({super.key, required this.groupe});

  final List<Map<String, dynamic>> membres = const [
    {'nom': 'Amoin K.', 'emoji': '👩🏿', 'parts': 3, 'statut': 'paye', 'score': 87, 'emprunt': 0},
    {'nom': 'Fatou D.', 'emoji': '👩🏾', 'parts': 5, 'statut': 'paye', 'score': 92, 'emprunt': 0},
    {'nom': 'Marie K.', 'emoji': '👩🏽', 'parts': 2, 'statut': 'paye', 'score': 78, 'emprunt': 25000},
    {'nom': 'Kadja B.', 'emoji': '👩🏿', 'parts': 1, 'statut': 'paye', 'score': 65, 'emprunt': 0},
    {'nom': 'Rose G.', 'emoji': '👩🏾', 'parts': 4, 'statut': 'retard', 'score': 45, 'emprunt': 10000},
    {'nom': 'Aiche S.', 'emoji': '👩🏽', 'parts': 2, 'statut': 'paye', 'score': 88, 'emprunt': 0},
  ];

  @override
  Widget build(BuildContext context) {
    final int caisse = groupe['caisse'] as int;
    final int credit = groupe['credit'] as int;
    final int social = groupe['social'] as int;
    final int partVal = groupe['partVal'] as int;
    final int members = groupe['membres'] as int;
    final int semaine = groupe['semaine'] as int;
    final int total = groupe['total'] as int;

    // Calcul partage final estimé
    final int totalParts = membres.fold(0, (sum, m) => sum + (m['parts'] as int));
    final double gainEstime = caisse * 1.12 / members;

    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // EN-TETE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [kPurpleDark, kPurple], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.arrow_back, color: kWhite)),
                ),
                const SizedBox(height: 16),
                Text(groupe['nom'], style: GoogleFonts.sora(fontSize: 20, fontWeight: FontWeight.w800, color: kWhite)),
                Text('Semaine $semaine / $total · $members membres', style: GoogleFonts.dmSans(fontSize: 13, color: Colors.white60)),
                const SizedBox(height: 16),
                // 3 CAISSES EN TEMPS REEL
                Row(children: [
                  _LiveStat(label: 'Epargne', valeur: '$caisse F', emoji: '🏦'),
                  const SizedBox(width: 10),
                  _LiveStat(label: 'Credit', valeur: '$credit F', emoji: '💳'),
                  const SizedBox(width: 10),
                  _LiveStat(label: 'Social', valeur: '$social F', emoji: '🤝'),
                ]),
              ]),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                // TABLEAU DE BORD PARTAGE FINAL
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [kGoldLight, kWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: kGold.withOpacity(0.4)),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      const Text('🎁', style: TextStyle(fontSize: 22)),
                      const SizedBox(width: 8),
                      Text('Partage fin de cycle estimé', style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w700, color: kDark)),
                    ]),
                    const SizedBox(height: 12),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Votre gain estimé', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                        Text('${gainEstime.toStringAsFixed(0)} FCFA', style: GoogleFonts.sora(fontSize: 22, fontWeight: FontWeight.w800, color: kGold)),
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text('Vos parts', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                        Text('$totalParts parts totales', style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w700, color: kPurple)),
                      ]),
                    ]),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(value: semaine / total, backgroundColor: kGrayLight, color: kGold, minHeight: 8),
                    ),
                    const SizedBox(height: 6),
                    Text('Cycle a ${((semaine / total) * 100).toInt()}% · Encore ${total - semaine} semaines', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                  ]),
                ),

                const SizedBox(height: 20),

                // ACHAT DE PARTS
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(14), border: Border.all(color: kPurple.withOpacity(0.2))),
                  child: Row(children: [
                    const Text('🪙', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Valeur d\'une part', style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w700, color: kPurpleDark)),
                      Text('$partVal FCFA · Max 5 parts par reunion', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                    ])),
                    ElevatedButton(
                      onPressed: () => _showAchatParts(context, partVal),
                      style: ElevatedButton.styleFrom(backgroundColor: kPurple, foregroundColor: kWhite, elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      child: Text('Acheter', style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w700)),
                    ),
                  ]),
                ),

                const SizedBox(height: 20),

                // GESTION EMPRUNTS
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('EMPRUNTS EN COURS', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
                  GestureDetector(onTap: () => _showEmprunt(context), child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5), decoration: BoxDecoration(color: kPurple, borderRadius: BorderRadius.circular(20)), child: Text('Demander un prêt', style: GoogleFonts.dmSans(fontSize: 10, color: kWhite, fontWeight: FontWeight.w700)))),
                ]),
                const SizedBox(height: 10),
                _EmpruntItem(nom: 'Marie K.', montant: 25000, interet: 10, reste: 27500, emoji: '👩🏽'),
                _EmpruntItem(nom: 'Rose G.', montant: 10000, interet: 10, reste: 11000, emoji: '👩🏾'),

                const SizedBox(height: 20),

                Text('STATUT DES MEMBRES', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
                const SizedBox(height: 12),

                ...membres.map((m) {
                  final statut = m['statut'];
                  Color couleur; String icone; String label;
                  if (statut == 'paye') { couleur = kGreen; icone = '✅'; label = 'Paye'; }
                  else if (statut == 'attente') { couleur = const Color(0xFFD97706); icone = '⏳'; label = 'En attente'; }
                  else { couleur = kRed; icone = '🚨'; label = 'Retard'; }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: kPurple.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))]),
                    child: Column(children: [
                      Row(children: [
                        Container(width: 40, height: 40, decoration: const BoxDecoration(color: kPurpleLight, shape: BoxShape.circle), child: Center(child: Text(m['emoji'], style: const TextStyle(fontSize: 20)))),
                        const SizedBox(width: 12),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(m['nom'], style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w600, color: kDark)),
                          Text('${m['parts']} parts · Score: ${m['score']}/100', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                        ])),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: couleur.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                          child: Row(children: [Text(icone, style: const TextStyle(fontSize: 12)), const SizedBox(width: 4), Text(label, style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: couleur))]),
                        ),
                      ]),
                      if (statut == 'retard') ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: kRedLight, borderRadius: BorderRadius.circular(10), border: Border.all(color: kRed.withOpacity(0.2))),
                          child: Row(children: [
                            const Text('🔔', style: TextStyle(fontSize: 14)),
                            const SizedBox(width: 8),
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('Garante notifiee', style: GoogleFonts.sora(fontSize: 11, fontWeight: FontWeight.w700, color: kRed)),
                              Text('Koua Marie alertee. 24h pour intervenir.', style: GoogleFonts.dmSans(fontSize: 10, color: kGray)),
                            ])),
                          ]),
                        ),
                      ],
                    ]),
                  );
                }).toList(),

                const SizedBox(height: 24),
                _PrimaryButton(label: 'Payer mes parts - ${partVal * 2} FCFA', onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Paiement de ${partVal * 2} FCFA en cours...', style: GoogleFonts.dmSans(color: kWhite)),
                    backgroundColor: kPurple, behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ));
                }),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  void _showAchatParts(BuildContext context, int partVal) {
    int nb = 1;
    showModalBottomSheet(
      context: context,
      backgroundColor: kWhite,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setS) => Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: kGrayLight, borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 20),
            Text('Acheter des parts', style: GoogleFonts.sora(fontSize: 20, fontWeight: FontWeight.w800, color: kDark)),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Nombre de parts (max 5)', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
              Row(children: [
                GestureDetector(onTap: () { if (nb > 1) setS(() => nb--); }, child: Container(width: 32, height: 32, decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.remove, color: kPurple, size: 16))),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text('$nb', style: GoogleFonts.sora(fontSize: 20, fontWeight: FontWeight.w800, color: kDark))),
                GestureDetector(onTap: () { if (nb < 5) setS(() => nb++); }, child: Container(width: 32, height: 32, decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.add, color: kPurple, size: 16))),
              ]),
            ]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(12)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Total a payer', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
                Text('${nb * partVal} FCFA', style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w800, color: kPurple)),
              ]),
            ),
            const SizedBox(height: 20),
            _PrimaryButton(label: 'Confirmer l\'achat', onPressed: () { Navigator.pop(ctx); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$nb parts achetees avec succes !', style: GoogleFonts.dmSans(color: kWhite)), backgroundColor: kPurple, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))); }),
          ]),
        ),
      ),
    );
  }

  void _showEmprunt(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: kWhite,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(left: 28, right: 28, top: 28, bottom: MediaQuery.of(ctx).viewInsets.bottom + 28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: kGrayLight, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 20),
          Text('Demander un pret', style: GoogleFonts.sora(fontSize: 20, fontWeight: FontWeight.w800, color: kDark)),
          const SizedBox(height: 8),
          Text('Taux d\'interet : 10% par mois', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
          const SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Montant souhaite (FCFA)',
              labelStyle: GoogleFonts.dmSans(color: kGray),
              prefixIcon: const Icon(Icons.payments_outlined, color: kPurple),
              filled: true, fillColor: kGrayLight,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: kPurple, width: 1.5)),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Motif du pret',
              labelStyle: GoogleFonts.dmSans(color: kGray),
              prefixIcon: const Icon(Icons.edit_note, color: kPurple),
              filled: true, fillColor: kGrayLight,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: kPurple, width: 1.5)),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: kGoldLight, borderRadius: BorderRadius.circular(10), border: Border.all(color: kGold.withOpacity(0.4))),
            child: Text('Le groupe votera pour approuver ou refuser votre demande dans les 24h.', style: GoogleFonts.dmSans(fontSize: 12, color: kDark)),
          ),
          const SizedBox(height: 20),
          _PrimaryButton(label: 'Soumettre la demande', onPressed: () { Navigator.pop(ctx); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Demande soumise au vote du groupe !', style: GoogleFonts.dmSans(color: kWhite)), backgroundColor: kGreen, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))); }),
        ]),
      ),
    );
  }
}

class _EmpruntItem extends StatelessWidget {
  final String nom;
  final int montant;
  final int interet;
  final int reste;
  final String emoji;
  const _EmpruntItem({required this.nom, required this.montant, required this.interet, required this.reste, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(12), border: Border.all(color: kPurple.withOpacity(0.1))),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(nom, style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w600, color: kDark)),
          Text('Emprunt: $montant FCFA · $interet%/mois', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
        ])),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('$reste FCFA', style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w700, color: kPurple)),
          Text('a rembourser', style: GoogleFonts.dmSans(fontSize: 10, color: kGray)),
        ]),
      ]),
    );
  }
}

// ═══════════════════════════════
//  SCORE DETAIL
// ═══════════════════════════════
class ScoreDetailScreen extends StatelessWidget {
  const ScoreDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _BackButton(),
            const SizedBox(height: 24),
            Text('Score de Confiance', style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.w800, color: kDark)),
            const SizedBox(height: 6),
            Text('Votre reputation sur toute la plateforme', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
            const SizedBox(height: 28),
            Center(
              child: Container(
                width: 160, height: 160,
                decoration: BoxDecoration(shape: BoxShape.circle, color: kWhite, boxShadow: [BoxShadow(color: kPurple.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 8))]),
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(width: 140, height: 140, child: CircularProgressIndicator(value: 0.87, strokeWidth: 12, backgroundColor: kGrayLight, valueColor: const AlwaysStoppedAnimation<Color>(kPurple))),
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('87', style: GoogleFonts.sora(fontSize: 40, fontWeight: FontWeight.w800, color: kPurple)),
                    Text('/100', style: GoogleFonts.dmSans(fontSize: 14, color: kGray)),
                    Text('Tres fiable', style: GoogleFonts.dmSans(fontSize: 12, color: kGreen, fontWeight: FontWeight.w600)),
                  ]),
                ]),
              ),
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(14)),
              child: Column(children: [
                Text('NIVEAUX', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
                const SizedBox(height: 12),
                _NiveauItem(label: '90-100', titre: 'Exemplaire', emoji: '🏆', actif: false),
                _NiveauItem(label: '75-89', titre: 'Tres fiable', emoji: '⭐', actif: true),
                _NiveauItem(label: '50-74', titre: 'Fiable', emoji: '👍', actif: false),
                _NiveauItem(label: '0-49', titre: 'A ameliorer', emoji: '⚠️', actif: false),
              ]),
            ),
            const SizedBox(height: 20),
            Text('DETAIL PAR CRITERE', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(14)),
              child: Column(children: [
                _ScoreBarDetail(label: 'Ponctualite', value: 0.92, score: '92/100', color: kGreen),
                const SizedBox(height: 12),
                _ScoreBarDetail(label: 'Regularite', value: 0.85, score: '85/100', color: kPurple),
                const SizedBox(height: 12),
                _ScoreBarDetail(label: 'Anciennete', value: 0.78, score: '78/100', color: kGold),
                const SizedBox(height: 12),
                _ScoreBarDetail(label: 'Respect charte', value: 1.0, score: '100/100', color: kGreen),
              ]),
            ),
            const SizedBox(height: 20),
            Text('HISTORIQUE DES POINTS', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
            const SizedBox(height: 12),
            ...[
              {'action': 'Parts payees - AVEC Adjame', 'date': 'Mer. 12 mars', 'points': '+2', 'positif': true},
              {'action': 'Reunion presente - Soeurs Unies', 'date': 'Lun. 3 mars', 'points': '+1', 'positif': true},
              {'action': 'Remboursement emprunt', 'date': 'Mer. 5 mars', 'points': '+3', 'positif': true},
              {'action': 'Retard 12h - Yop-City', 'date': 'Dim. 24 fev', 'points': '-1', 'positif': false},
            ].map((h) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(12)),
              child: Row(children: [
                Container(width: 36, height: 36, decoration: BoxDecoration(color: h['positif'] as bool ? kGreenLight : kRedLight, borderRadius: BorderRadius.circular(10)), child: Center(child: Text(h['positif'] as bool ? '✅' : '⚠️', style: const TextStyle(fontSize: 16)))),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(h['action'] as String, style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w600, color: kDark)),
                  Text(h['date'] as String, style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                ])),
                Text(h['points'] as String, style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w800, color: h['positif'] as bool ? kGreen : kRed)),
              ]),
            )).toList(),
          ]),
        ),
      ),
    );
  }
}

// ═══════════════════════════════
//  CRÉER GROUPE
// ═══════════════════════════════
class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});
  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  int _membres = 15;
  int _partVal = 500;
  int _maxParts = 5;
  String _frequence = 'Hebdomadaire';
  bool _cree = false;
  final List<String> _frequences = ['Hebdomadaire', 'Bi-mensuel', 'Mensuel'];

  @override
  Widget build(BuildContext context) {
    final caution = _partVal * 2;
    const String code = 'WSIDJ7';
    const String lien = 'https://warisidji.app/avec/WSIDJ7';

    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _BackButton(),
            const SizedBox(height: 24),
            Text('Creer une AVEC', style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.w800, color: kDark)),
            const SizedBox(height: 6),
            Text('Definissez les regles de votre groupe', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
            const SizedBox(height: 28),
            const _FieldLabel(label: 'Nom du groupe'),
            const SizedBox(height: 8),
            const _InputField(hint: 'Ex: AVEC Marche Adjame', icon: Icons.group_outlined),
            const SizedBox(height: 20),
            const _FieldLabel(label: 'Nombre de membres (recommande 15-25)'),
            const SizedBox(height: 8),
            _CounterWidget(value: _membres, label: 'membres', onDecrement: () { if (_membres > 5) setState(() => _membres--); }, onIncrement: () { if (_membres < 30) setState(() => _membres++); }),
            const SizedBox(height: 20),
            const _FieldLabel(label: 'Valeur d\'une part (FCFA)'),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (v) { final p = int.tryParse(v); if (p != null) setState(() => _partVal = p); },
              decoration: InputDecoration(
                hintText: 'Ex: 500',
                hintStyle: GoogleFonts.dmSans(color: kGray, fontSize: 14),
                prefixIcon: const Icon(Icons.payments_outlined, color: kPurple, size: 20),
                suffixText: 'FCFA / part',
                suffixStyle: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w600, color: kPurple),
                filled: true, fillColor: kGrayLight,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: kPurple, width: 1.5)),
              ),
            ),
            const SizedBox(height: 20),
            const _FieldLabel(label: 'Nombre max de parts par reunion'),
            const SizedBox(height: 8),
            _CounterWidget(value: _maxParts, label: 'parts max', onDecrement: () { if (_maxParts > 1) setState(() => _maxParts--); }, onIncrement: () { if (_maxParts < 10) setState(() => _maxParts++); }),
            const SizedBox(height: 20),
            const _FieldLabel(label: 'Frequence des reunions'),
            const SizedBox(height: 8),
            Row(
              children: _frequences.map((f) {
                final sel = f == _frequence;
                return Expanded(child: GestureDetector(
                  onTap: () => setState(() => _frequence = f),
                  child: Container(
                    margin: EdgeInsets.only(right: f != _frequences.last ? 8 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: sel ? kPurple : kGrayLight, borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text(f, style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w600, color: sel ? kWhite : kGray))),
                  ),
                ));
              }).toList(),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: kGoldLight, borderRadius: BorderRadius.circular(12), border: Border.all(color: kGold.withOpacity(0.4))),
              child: Row(children: [
                const Text('🔒', style: TextStyle(fontSize: 20)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Caution automatique', style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w700, color: kDark)),
                  Text('Chaque membre versera $caution FCFA a l\'entree', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
                ])),
              ]),
            ),
            const SizedBox(height: 28),
            if (!_cree)
              _PrimaryButton(label: 'Creer l\'AVEC 🚀', onPressed: () => setState(() => _cree = true)),
            if (_cree) ...[
              Container(
                width: double.infinity, padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(16), border: Border.all(color: kPurple, width: 1.5)),
                child: Column(children: [
                  const Text('🎉', style: TextStyle(fontSize: 36)),
                  const SizedBox(height: 10),
                  Text('AVEC creee avec succes !', style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w700, color: kDark)),
                  const SizedBox(height: 20),
                  Text('CODE D\'INVITATION', style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w700, color: kGray, letterSpacing: 1.2)),
                  const SizedBox(height: 8),
                  Text(code, style: GoogleFonts.sora(fontSize: 36, fontWeight: FontWeight.w800, color: kPurple, letterSpacing: 8)),
                  const SizedBox(height: 16),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(10)), child: Text(lien, style: GoogleFonts.dmSans(fontSize: 12, color: kPurple), textAlign: TextAlign.center)),
                  const SizedBox(height: 16),
                  Row(children: [
                    Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.copy, size: 16), label: Text('Copier', style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w600)), style: ElevatedButton.styleFrom(backgroundColor: kPurple, foregroundColor: kWhite, elevation: 0, padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),
                    const SizedBox(width: 10),
                    Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.share, size: 16), label: Text('Partager', style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w600)), style: OutlinedButton.styleFrom(foregroundColor: kPurple, side: const BorderSide(color: kPurple), padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))))),
                  ]),
                ]),
              ),
            ],
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}

// ═══════════════════════════════
//  REJOINDRE
// ═══════════════════════════════
class JoinGroupScreen extends StatelessWidget {
  const JoinGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _BackButton(),
            const SizedBox(height: 28),
            Text('Rejoindre une AVEC', style: GoogleFonts.sora(fontSize: 24, fontWeight: FontWeight.w800, color: kDark)),
            const SizedBox(height: 6),
            Text('Entre le code ou le lien recu', style: GoogleFonts.dmSans(fontSize: 13, color: kGray)),
            const SizedBox(height: 36),
            Center(child: Container(width: 90, height: 90, decoration: const BoxDecoration(color: kPurpleLight, shape: BoxShape.circle), child: const Center(child: Text('🔗', style: TextStyle(fontSize: 44))))),
            const SizedBox(height: 32),
            const _FieldLabel(label: "Code d'invitation"),
            const SizedBox(height: 8),
            TextField(
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.characters,
              maxLength: 6,
              style: GoogleFonts.sora(fontSize: 28, fontWeight: FontWeight.w800, color: kDark, letterSpacing: 8),
              decoration: InputDecoration(
                hintText: 'XXXXXX',
                hintStyle: GoogleFonts.sora(fontSize: 28, fontWeight: FontWeight.w800, color: kGrayLight, letterSpacing: 8),
                counterText: '', filled: true, fillColor: kPurpleLight,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: kPurple, width: 2)),
              ),
            ),
            const SizedBox(height: 20),
            Row(children: [const Expanded(child: Divider()), Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Text('ou', style: GoogleFonts.dmSans(color: kGray))), const Expanded(child: Divider())]),
            const SizedBox(height: 20),
            const _FieldLabel(label: "Coller un lien d'invitation"),
            const SizedBox(height: 8),
            const _InputField(hint: 'https://warisidji.app/avec/...', icon: Icons.link),
            const SizedBox(height: 36),
            _PrimaryButton(label: 'Rejoindre cette AVEC ->', onPressed: () {}),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}

// ═══════════════════════════════
//  WIDGETS RÉUTILISABLES
// ═══════════════════════════════
class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(width: 40, height: 40, decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.arrow_back, color: kPurple)),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: kPurple, foregroundColor: kWhite, padding: const EdgeInsets.symmetric(vertical: 16), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
        child: Text(label, style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int step;
  final int total;
  const _ProgressBar({required this.step, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(total, (i) => Expanded(child: Container(height: 4, margin: EdgeInsets.only(right: i < total - 1 ? 6 : 0), decoration: BoxDecoration(color: i < step ? kPurple : kGrayLight, borderRadius: BorderRadius.circular(2))))));
  }
}

class _RuleCheckbox extends StatelessWidget {
  final bool checked;
  final String emoji;
  final String title;
  final String description;
  final ValueChanged<bool?> onChanged;
  const _RuleCheckbox({required this.checked, required this.emoji, required this.title, required this.description, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!checked),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: checked ? kPurpleLight : kGrayLight, borderRadius: BorderRadius.circular(14), border: Border.all(color: checked ? kPurple : Colors.transparent, width: 1.5)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w700, color: kDark)),
            const SizedBox(height: 4),
            Text(description, style: GoogleFonts.dmSans(fontSize: 12, color: kGray, height: 1.4)),
          ])),
          const SizedBox(width: 8),
          Checkbox(value: checked, onChanged: onChanged, activeColor: kPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        ]),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});
  @override
  Widget build(BuildContext context) => Text(label.toUpperCase(), style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w600, color: kGray, letterSpacing: 0.8));
}

class _InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  const _InputField({required this.hint, required this.icon, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint, hintStyle: GoogleFonts.dmSans(color: kGray, fontSize: 14),
        prefixIcon: Icon(icon, color: kPurple, size: 20),
        suffixIcon: isPassword ? const Icon(Icons.visibility_outlined, color: kGray, size: 20) : null,
        filled: true, fillColor: kGrayLight,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: kPurple, width: 1.5)),
      ),
    );
  }
}

class _UploadBox extends StatelessWidget {
  final String label;
  const _UploadBox({required this.label});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity, height: 100,
        decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(12), border: Border.all(color: kPurple, width: 1.5)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.upload_file_outlined, color: kPurple, size: 32),
          const SizedBox(height: 8),
          Text(label, style: GoogleFonts.dmSans(fontSize: 13, color: kPurple, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text('JPG, PNG, PDF - Max 5MB', style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
        ]),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String icon;
  final String label;
  const _StatChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(8)),
      child: Row(children: [Text(icon, style: const TextStyle(fontSize: 12)), const SizedBox(width: 4), Text(label, style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.w600, color: kPurple))]),
    );
  }
}

class _LiveStat extends StatelessWidget {
  final String label;
  final String valeur;
  final String emoji;
  const _LiveStat({required this.label, required this.valeur, required this.emoji});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 4),
        Text(valeur, style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w700, color: kWhite)),
        Text(label, style: GoogleFonts.dmSans(fontSize: 10, color: Colors.white60)),
      ]),
    ));
  }
}

class _ProfilStat extends StatelessWidget {
  final String valeur;
  final String label;
  const _ProfilStat({required this.valeur, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(14)),
      child: Column(children: [
        Text(valeur, style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w800, color: kPurple)),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.dmSans(fontSize: 11, color: kGray)),
      ]),
    ));
  }
}

class _ProfilItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String valeur;
  const _ProfilItem({required this.icon, required this.label, required this.valeur});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Icon(icon, color: kPurple, size: 20), const SizedBox(width: 14),
        Expanded(child: Text(label, style: GoogleFonts.dmSans(fontSize: 13, color: kGray))),
        Text(valeur, style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w600, color: kDark)),
      ]),
    );
  }
}

class _ScoreBar extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  const _ScoreBar({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: 90, child: Text(label, style: GoogleFonts.dmSans(fontSize: 11, color: kGray))),
      Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(4), child: LinearProgressIndicator(value: value, backgroundColor: kGrayLight, color: color, minHeight: 6))),
      const SizedBox(width: 8),
      Text('${(value * 100).toInt()}', style: GoogleFonts.sora(fontSize: 11, fontWeight: FontWeight.w700, color: kDark)),
    ]);
  }
}

class _ScoreBarDetail extends StatelessWidget {
  final String label;
  final double value;
  final String score;
  final Color color;
  const _ScoreBarDetail({required this.label, required this.value, required this.score, required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w600, color: kDark)),
        Text(score, style: GoogleFonts.sora(fontSize: 12, fontWeight: FontWeight.w700, color: color)),
      ]),
      const SizedBox(height: 6),
      ClipRRect(borderRadius: BorderRadius.circular(4), child: LinearProgressIndicator(value: value, backgroundColor: kGrayLight, color: color, minHeight: 8)),
    ]);
  }
}

class _NiveauItem extends StatelessWidget {
  final String label;
  final String titre;
  final String emoji;
  final bool actif;
  const _NiveauItem({required this.label, required this.titre, required this.emoji, required this.actif});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: actif ? kPurpleLight : kBg, borderRadius: BorderRadius.circular(10), border: Border.all(color: actif ? kPurple : Colors.transparent, width: 1.5)),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 18)), const SizedBox(width: 12),
        Text(label, style: GoogleFonts.dmSans(fontSize: 12, color: kGray)), const SizedBox(width: 8),
        Text(titre, style: GoogleFonts.sora(fontSize: 13, fontWeight: FontWeight.w700, color: actif ? kPurple : kGray)),
        if (actif) ...[const Spacer(), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: kPurple, borderRadius: BorderRadius.circular(20)), child: Text('Votre niveau', style: GoogleFonts.dmSans(fontSize: 10, color: kWhite, fontWeight: FontWeight.w600)))],
      ]),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  final int value;
  final String label;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  const _CounterWidget({required this.value, required this.label, required this.onDecrement, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: kPurpleLight, borderRadius: BorderRadius.circular(12), border: Border.all(color: kPurple, width: 1.5)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(onTap: onDecrement, child: Container(width: 34, height: 34, decoration: BoxDecoration(color: kPurple, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.remove, color: kWhite, size: 18))),
        Text('$value $label', style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w700, color: kDark)),
        GestureDetector(onTap: onIncrement, child: Container(width: 34, height: 34, decoration: BoxDecoration(color: kPurple, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.add, color: kWhite, size: 18))),
      ]),
    );
  }
}