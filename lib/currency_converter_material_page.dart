import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => 
      _CurrencyConverterMaterialPageState(); 
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> with TickerProviderStateMixin {

    double result = 0;
    final TextEditingController textEditingController = TextEditingController();
    late AnimationController _animationController;
    late Animation<double> _fadeAnimation;
    late Animation<Offset> _slideAnimation;
    bool _isLoading = false;
    String _errorMessage = '';

    @override
    void initState() {
      super.initState();
      _animationController = AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
      _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      );
      _slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0.5),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));
      
      _animationController.forward();
    }

    void convert() async {
      if (textEditingController.text.isEmpty) {
        setState(() {
          _errorMessage = 'Please enter an amount';
        });
        return;
      }

      try {
        double inputValue = double.parse(textEditingController.text);
        if (inputValue <= 0) {
          setState(() {
            _errorMessage = 'Please enter a valid amount';
          });
          return;
        }

        setState(() {
          _isLoading = true;
          _errorMessage = '';
        });

        // Simulate API call delay for better UX
        await Future.delayed(const Duration(milliseconds: 500));

        setState(() {
          result = inputValue * 86.69;
          _isLoading = false;
        });

        // Haptic feedback
        HapticFeedback.lightImpact();
      } catch (e) {
        setState(() {
          _errorMessage = 'Please enter a valid number';
          _isLoading = false;
        });
      }
    }

  @override
  void dispose() {
    _animationController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    const SizedBox(height: 40),
                    Text(
                      'Currency Converter',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'USD to INR',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const Spacer(),
                    
                    // Result Card
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF667eea),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.currency_rupee,
                                  color: Color(0xFF667eea),
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Indian Rupee',
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                    AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 300),
                                      child: Text(
                                        result != 0 
                                          ? '₹${result.toStringAsFixed(2)}'
                                          : '₹0.00',
                                        key: ValueKey(result),
                                        style: theme.textTheme.headlineLarge?.copyWith(
                                          color: const Color(0xFF2d3748),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 36,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Input Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Amount',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: textEditingController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: const Color(0xFF2d3748),
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              hintText: '0.00',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 24,
                              ),
                              prefixIcon: Container(
                                margin: const EdgeInsets.all(12),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF667eea),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.attach_money,
                                  color: Color(0xFF667eea),
                                  size: 20,
                                ),
                              ),
                              suffixText: 'USD',
                              suffixStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                            ),
                            onChanged: (value) {
                              if (_errorMessage.isNotEmpty) {
                                setState(() {
                                  _errorMessage = '';
                                });
                              }
                            },
                          ),
                          if (_errorMessage.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(
                              _errorMessage,
                              style: TextStyle(
                                color: Colors.red[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Convert Button
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : convert,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF667eea),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.swap_horiz, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'Convert Currency',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Exchange Rate Info
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white70,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '1 USD = 86.69 INR',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

  


