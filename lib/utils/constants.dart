class ConstAssert {
  const ConstAssert({required bool valid, String? message})
    : assert(valid, message);
}

@ConstAssert(
  valid: supabaseUrl != '',
  message: 'SUPABASE_URL is not set',
)
const supabaseUrl = String.fromEnvironment('SUPABASE_URL');

@ConstAssert(
  valid: supabaseAnonKey != '',
  message: 'SUPABASE_ANON_KEY is not set',
)
const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
