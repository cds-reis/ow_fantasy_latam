import 'package:flutter/material.dart';

import '../../config/constants.dart' as constants;

class PrivacyPolicyPortuguese extends StatelessWidget {
  const PrivacyPolicyPortuguese({super.key});

  static const String routeName = '/privacy';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            const Text(
              'Política de Privacidade',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      'Last updated: 11/06/2025',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '1. Introdução',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Esta Política de Privacidade descreve como o OW Fantasy LATAM ("nós", "nosso" ou "aplicativo") coleta, usa e protege suas informações pessoais em conformidade com a Lei Geral de Proteção de Dados (LGPD - Lei nº 13.709/2018) do Brasil.',
                    ),
                    Divider(),
                    Text(
                      '2. Informações que Coletamos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '2.1. Informações da Conta:\n'
                      '• Nome de usuário\n'
                      '• Endereço de e-mail\n'
                      '• Senha (armazenada de forma segura e criptografada)\n\n'
                      '2.2. Informações de Uso:\n'
                      '• Dados de interação com o aplicativo\n'
                      '• Preferências de configuração\n'
                      '• Histórico de atividades\n\n'
                      '2.3. Informações do Dispositivo:\n'
                      '• Tipo de dispositivo\n'
                      '• Sistema operacional\n'
                      '• Identificadores únicos do dispositivo',
                    ),
                    Divider(),
                    Text(
                      '3. Como Usamos Suas Informações',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Utilizamos suas informações para:\n'
                      '• Fornecer e manter nossos serviços\n'
                      '• Personalizar sua experiência\n'
                      '• Processar suas transações\n'
                      '• Enviar atualizações importantes\n'
                      '• Melhorar nossos serviços\n'
                      '• Cumprir obrigações legais',
                    ),
                    Divider(),
                    Text(
                      '4. Compartilhamento de Dados',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Não compartilhamos suas informações pessoais com terceiros, exceto quando:\n'
                      '• Exigido por lei\n'
                      '• Necessário para proteger nossos direitos\n'
                      '• Com seu consentimento explícito',
                    ),
                    Divider(),
                    Text(
                      '5. Seus Direitos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'De acordo com a LGPD, você tem direito a:\n'
                      '• Acessar seus dados pessoais\n'
                      '• Corrigir dados incompletos ou desatualizados\n'
                      '• Solicitar a exclusão de seus dados\n'
                      '• Revogar seu consentimento\n'
                      '• Solicitar a portabilidade dos dados\n'
                      '• Obter informações sobre o compartilhamento de dados',
                    ),
                    Divider(),
                    Text(
                      '6. Segurança dos Dados',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Implementamos medidas de segurança técnicas e organizacionais para proteger suas informações pessoais, incluindo:\n'
                      '• Criptografia de dados\n'
                      '• Controles de acesso\n'
                      '• Monitoramento de segurança\n'
                      '• Treinamento de equipe',
                    ),
                    Divider(),
                    Text(
                      '7. Retenção de Dados',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mantemos suas informações pessoais apenas pelo tempo necessário para cumprir as finalidades para as quais foram coletadas, incluindo obrigações legais, contábeis ou de relatórios.',
                    ),
                    Divider(),
                    Text(
                      '8. Contato',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Para exercer seus direitos ou fazer perguntas sobre esta política, entre em contato conosco através de:\n'
                      '• E-mail: ${constants.email}',
                    ),
                    Divider(),
                    Text(
                      '9. Alterações na Política',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Reservamo-nos o direito de modificar esta política a qualquer momento. Alterações significativas serão notificadas através do aplicativo ou por e-mail.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
