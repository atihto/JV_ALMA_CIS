// lib/widgets/website_chat_widget.dart
// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'website_chat_service.dart';

// ─── Colours ───────────────────────────────────────────────────────────────
const Color _brandDark   = Color(0xFF1E293B);   // Deep navy
const Color _brandAccent = Color(0xFF0F766E);   // Teal (used in header & accents)
const Color _brandLight  = Color(0xFFF1F5F9);

const Color _bubbleUser  = Color(0xFF1E293B);   // Dark user bubble
const Color _bubbleBot   = Color(0xFFF8FAFC);   // Light bot bubble
const Color _textUser    = Colors.white;
const Color _textBot     = Color(0xFF1E293B);

// FAB specific
const Color _fabBackground = Colors.white;
const Color _fabTextColor  = Color(0xFF1E293B);
const Color _fabBorderColor = Color(0xFFE2E8F0);

// ═══════════════════════════════════════════════════════════════════════════
//  WebsiteChatFab — White "Chat with us" design
// ═══════════════════════════════════════════════════════════════════════════
// ═══════════════════════════════════════════════════════════════════════════
//  WebsiteChatFab — Corrected Final Version
// ═══════════════════════════════════════════════════════════════════════════

class WebsiteChatFab extends StatefulWidget {
  const WebsiteChatFab({super.key});

  @override
  State<WebsiteChatFab> createState() => _WebsiteChatFabState();
}

class _WebsiteChatFabState extends State<WebsiteChatFab>
    with SingleTickerProviderStateMixin {
  bool _chatOpen = false;
  OverlayEntry? _overlayEntry;
  late final AnimationController _pulseCtrl;
  bool _hasPulsed = false;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && !_hasPulsed) {
        _pulseCtrl.repeat(reverse: true);
        Future.delayed(const Duration(seconds: 4), () {
          if (mounted) {
            _pulseCtrl.stop();
            setState(() => _hasPulsed = true);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _removeOverlay();
    _pulseCtrl.dispose();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _toggleChat() {
    if (_chatOpen) {
      _removeOverlay();
      setState(() => _chatOpen = false);
    } else {
      _showOverlay();
      setState(() => _chatOpen = true);
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (ctx) => _ChatOverlay(
        onClose: () {
          _removeOverlay();
          if (mounted) setState(() => _chatOpen = false);
        },
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    // We use a custom Material button instead of FloatingActionButton.extended
    // so that the speech-bubble icon can float above the FAB pill with no
    // border line ever intersecting it.
    return AnimatedBuilder(
      animation: _pulseCtrl,
      builder: (context, child) {
        final pulse = _pulseCtrl.value;
        return Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            // Pulse ring
            if (!_hasPulsed && pulse > 0)
              Positioned(
                bottom: 0,
                child: Container(
                  width: 70 + pulse * 18,
                  height: 70 + pulse * 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _brandAccent.withOpacity((1 - pulse) * 0.22),
                  ),
                ),
              ),

            // ── The FAB pill + icon group, stacked as siblings ──────────
            // The pill is the BOTTOM layer; the icon is ABOVE it in the
            // Stack, so no border can ever cut through the icon.
            child!,
          ],
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // ── FAB pill ─────────────────────────────────────────────────
          Material(
            color: _fabBackground,
            elevation: 5,
            shadowColor: Colors.black26,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: _toggleChat,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: _fabBorderColor, width: 1.5),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Space on left so text is centred under icon
                    SizedBox(width: 4),
                    Text(
                      "Chat with us",
                      style: TextStyle(
                        fontSize: 14.8,
                        fontWeight: FontWeight.w600,
                        color: _fabTextColor,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("👋", style: TextStyle(fontSize: 16)),
                    // Space on right to balance the icon that floats above
                    SizedBox(width: 34),
                  ],
                ),
              ),
            ),
          ),

          // ── Speech-bubble icon — sits ABOVE the pill in paint order ──
          // Positioned so the ear tip aligns with "with us" text area.
          // Because it is a Stack sibling (not a child of the pill),
          // the pill border is completely irrelevant to it.
          const Positioned(
            top: -18,
            right: 10,
            child: _SpeechBubbleIcon(),
          ),
        ],
      ),
    );
  }
}
// ═══════════════════════════════════════════════════════════════════════════
//  The rest of the file remains the same (only colours fixed)
// ═══════════════════════════════════════════════════════════════════════════

// ═══════════════════════════════════════════════════════════════════════════
//  _SpeechBubbleIcon
//  Outer light ring → dark filled inner circle → small ear at bottom-left
//  → 3 white dots centred inside.
//  Fully self-contained CustomPainter — no external borders or icons.
// ═══════════════════════════════════════════════════════════════════════════

class _SpeechBubbleIcon extends StatelessWidget {
  const _SpeechBubbleIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(44, 44),
      painter: _SpeechBubblePainter(),
    );
  }
}

class _SpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w  = size.width;
    final h  = size.height;
    final cx = w / 2;
    final cy = h / 2 - 3; // shift centre up slightly to leave room for ear

    // Radii
    const outerR = 21.0; // outer ring
    const innerR = 16.0; // filled dark circle
    const earW   = 6.0;  // ear half-width
    const earH   = 7.0;  // ear height below circle

    // ── Shadow ────────────────────────────────────────────────────────────
    final shadowPath = _buildFullPath(cx, cy, innerR, earW, earH);
    canvas.drawShadow(shadowPath, Colors.black45, 4, false);

    // ── Outer ring (light border) ─────────────────────────────────────────
    final ringPaint = Paint()
      ..color = const Color(0xFFCBD5E1)   // slate-200 — subtle light ring
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, cy), outerR, ringPaint);

    // ── Inner filled dark circle + ear (merged) ───────────────────────────
    final fillPaint = Paint()
      ..color = const Color(0xFF1E293B)
      ..style = PaintingStyle.fill;
    canvas.drawPath(_buildFullPath(cx, cy, innerR, earW, earH), fillPaint);

    // ── 3 white dots centred inside the dark circle ───────────────────────
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    const dotR = 2.5;
    const gap  = 5.6;

    canvas.drawCircle(Offset(cx - gap, cy), dotR, dotPaint);
    canvas.drawCircle(Offset(cx,       cy), dotR, dotPaint);
    canvas.drawCircle(Offset(cx + gap, cy), dotR, dotPaint);
  }

  /// Builds the merged path: filled circle + small ear triangle at bottom-left.
  Path _buildFullPath(
      double cx, double cy, double r, double earW, double earH) {
    final circle = Path()..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: r));

    // Ear: a small triangle that pokes below-left of the circle
    final ear = Path()
      ..moveTo(cx - earW,          cy + r * 0.55)
      ..lineTo(cx - earW - earW * 0.4, cy + r + earH)
      ..lineTo(cx + earW * 0.2,   cy + r * 0.85)
      ..close();

    return Path.combine(PathOperation.union, circle, ear);
  }

  @override
  bool shouldRepaint(_SpeechBubblePainter old) => false;
}

class _ChatOverlay extends StatelessWidget {
  final VoidCallback onClose;
  const _ChatOverlay({required this.onClose});

  @override
  Widget build(BuildContext context) {
    final size     = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final panelW   = isMobile ? size.width - 32.0 : 360.0;
    final panelH   = isMobile ? 460.0 : 500.0;
    final right    = isMobile ? 16.0 : 24.0;
    const bottom   = 80.0 + 16.0;

    return Positioned(
      right: right,
      bottom: bottom,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: panelW,
          height: panelH,
          child: _ChatPanel(onClose: onClose),
        ),
      ),
    );
  }
}

class _ChatPanel extends StatefulWidget {
  final VoidCallback onClose;
  const _ChatPanel({required this.onClose});

  @override
  State<_ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends State<_ChatPanel>
    with SingleTickerProviderStateMixin {
  final _service    = const WebsiteChatService();
  final _inputCtrl  = TextEditingController();
  final _scrollCtrl = ScrollController();
  final _focusNode  = FocusNode();
  final List<ChatMessage> _history = [];
  bool _isTyping = false;

  late final AnimationController _slideCtrl;
  late final Animation<Offset>   _slideAnim;

  final List<String> _suggestions = [
    'What services do you offer?',
    'Tell me about your IT products',
    'How can I contact you?',
    'Are there any job openings?',
  ];
  bool _showSuggestions = true;

  @override
  void initState() {
    super.initState();
    _slideCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideCtrl, curve: Curves.easeOutCubic));
    _slideCtrl.forward();
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    _scrollCtrl.dispose();
    _focusNode.dispose();
    _slideCtrl.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _send(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _isTyping) return;

    _inputCtrl.clear();
    _focusNode.requestFocus();

    final historySnapshot = List<ChatMessage>.from(_history);

    setState(() {
      _showSuggestions = false;
      _history.add(ChatMessage(role: 'user', text: trimmed, timestamp: DateTime.now()));
      _isTyping = true;
    });
    _scrollToBottom();

    final reply = await _service.sendMessage(
      userMessage: trimmed,
      history: historySnapshot,
    );

    if (mounted) {
      setState(() {
        _isTyping = false;
        _history.add(ChatMessage(
          role: 'assistant',
          text: reply ?? "I'm having trouble connecting right now. Please email us at support@jvalmacis.co.ke.",
          timestamp: DateTime.now(),
        ));
      });
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnim,
      child: Material(
        elevation: 16,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        shadowColor: Colors.black26,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildMessages()),
              if (_showSuggestions) _buildSuggestions(),
              _buildInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_brandDark, Color(0xFF334155)],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _brandAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.support_agent_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ALMA Assistant',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  'JV ALMA C.I.S · Online',
                  style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            width: 8, height: 8,
            decoration: const BoxDecoration(color: Color(0xFF4ADE80), shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: widget.onClose,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  // ... (the rest of _buildMessages, _buildWelcome, _buildBubble, _buildTypingIndicator, 
  // _buildSuggestions, _buildInput, and _TypingDots remain exactly the same as your original file)

  // I'll keep them short here for brevity — just copy them from your previous version

  Widget _buildMessages() {
    if (_history.isEmpty) return _buildWelcome();

    return ListView.builder(
      controller: _scrollCtrl,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      itemCount: _history.length + (_isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (_isTyping && index == _history.length) return _buildTypingIndicator();
        return _buildBubble(_history[index]);
      },
    );
  }

  Widget _buildWelcome() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _brandLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.waving_hand_rounded, color: _brandAccent, size: 32),
            ),
            const SizedBox(height: 12),
            const Text(
              'Hi there! I\'m ALMA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _brandDark),
            ),
            const SizedBox(height: 6),
            Text(
              'Ask me anything about JV ALMA C.I.S — our services, products, or how to get in touch.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBubble(ChatMessage msg) {
    final isUser = msg.role == 'user';
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(color: _brandAccent, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.support_agent_rounded, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 6),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                color: isUser ? _bubbleUser : _bubbleBot,
                borderRadius: BorderRadius.only(
                  topLeft:     const Radius.circular(14),
                  topRight:    const Radius.circular(14),
                  bottomLeft:  Radius.circular(isUser ? 14 : 3),
                  bottomRight: Radius.circular(isUser ? 3 : 14),
                ),
              ),
              child: Text(
                msg.text,
                style: TextStyle(
                  fontSize: 13,
                  color: isUser ? _textUser : _textBot,
                  height: 1.45,
                ),
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(color: _brandAccent, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.support_agent_rounded, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: _bubbleBot, borderRadius: BorderRadius.circular(14)),
            child: _TypingDots(),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestions() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 4),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: _suggestions.map((s) {
          return InkWell(
            onTap: () => _send(s),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: _brandLight,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _brandAccent.withOpacity(0.35)),
              ),
              child: Text(
                s,
                style: const TextStyle(
                  fontSize: 11,
                  color: _brandAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputCtrl,
              focusNode: _focusNode,
              onSubmitted: _send,
              enabled: !_isTyping,
              textInputAction: TextInputAction.send,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Ask me anything…',
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: _brandAccent, width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _isTyping ? null : () => _send(_inputCtrl.text),
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _isTyping ? Colors.grey.shade300 : _brandAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.send_rounded,
                  color: _isTyping ? Colors.grey : Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Animated typing dots (unchanged)
class _TypingDots extends StatefulWidget {
  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots> with TickerProviderStateMixin {
  late final List<AnimationController> _ctrls;
  late final List<Animation<double>>   _anims;

  @override
  void initState() {
    super.initState();
    _ctrls = List.generate(3, (i) => AnimationController(
      vsync: this, duration: const Duration(milliseconds: 600),
    ));
    _anims = _ctrls.map((c) => Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(parent: c, curve: Curves.easeInOut),
    )).toList();
    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: i * 160), () {
        if (mounted) _ctrls[i].repeat(reverse: true);
      });
    }
  }

  @override
  void dispose() {
    for (final c in _ctrls) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) => AnimatedBuilder(
        animation: _anims[i],
        builder: (_, __) => Transform.translate(
          offset: Offset(0, _anims[i].value),
          child: Container(
            width: 6, height: 6,
            margin: EdgeInsets.only(right: i < 2 ? 4 : 0),
            decoration: const BoxDecoration(
              color: Color(0xFF94A3B8),
              shape: BoxShape.circle,
            ),
          ),
        ),
      )),
    );
  }
}