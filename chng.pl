use strict;
use warnings;
use utf8;

# Solicitar entrada do usuário
print" _____ _____ _____ _____          _____               _       _     \n";
print"|_   _|   __| __  | __  |        |   __|_ _ ___  __ _| |_____|_|___ \n";
print"  | | |  |  | __ -|    -|        |__   | | |_ -||. | . |     | |   |\n";
print"  |_| |_____|_____|__|__|        |_____|_  |___|___|___|_|_|_|_|_|_|\n";
print"                                       |___|                        \n";
print "SYSADMIN TOOLS -> (perl 5, version 32, subversion 1 (v5.32.1))::TechGuardian BR\n\n";
print "<<ONDE ESTOU?>> \n1) Empresa\n2) Casa\n";
# Para compilar o código ->> Powershell como admin: pp -o IPCtgbr.exe chngIP_editar.pl
my $choice = <STDIN>;

my $ip;
my $subnet;
my $gateway;
my $dns_server;
my $interface_name = "Ethernet";
my $command_set_static;
my $command_set_dns;
my $command_set_dhcp;
my $command_reset_dns;

if ($choice == 1) {
    # Configurar IP fixo
    $ip = "xx.xx.xx.xx";
    $subnet = "xx.xx.xx.xx";
    $gateway = "xx.xx.xx.xx";
    $dns_server = "xx.xx.xx.xx";

    # Comando para configurar o IP fixo
    $command_set_static = "netsh interface ip set address name=\"$interface_name\" static $ip $subnet $gateway";

    # Comando para configurar o servidor DNS
    $command_set_dns = "netsh interface ip set dns name=\"$interface_name\" static $dns_server primary";
} elsif ($choice == 2) {
    # Configurar DHCP
    # Comando para alternar para DHCP
    $command_set_dhcp = "netsh interface ip set address name=\"$interface_name\" source=dhcp";
    $command_reset_dns = "netsh interface ip set dns name=\"$interface_name\" source=dhcp";
} else {
    print "Escolha inválida. Nenhuma ação realizada.\n";
    exit;  # Encerra o script se a escolha for inválida.
}

# Para definir as configurações de IP fixo
if ($command_set_static) {
    system($command_set_static);
    system($command_set_dns);
}

# Para alternar para DHCP
if ($command_set_dhcp) {
    system($command_set_dhcp);
    system($command_reset_dns);
}

# Aguarde uma tecla para sair
print "Obrigado por utilizar o programa! Pressione Enter para sair...";
<STDIN>;
