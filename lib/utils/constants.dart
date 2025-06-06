class ConstAssert {
  const ConstAssert({required bool valid, String? message})
    : assert(valid, message);
}

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');

const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
