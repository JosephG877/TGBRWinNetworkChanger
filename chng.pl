use strict;
use warnings;
use utf8;

print" _____ _____ _____ _____          _____               _       _     \n";
print"|_   _|   __| __  | __  |        |   __|_ _ ___  __ _| |_____|_|___ \n";
print"  | | |  |  | __ -|    -|        |__   | | |_ -||. | . |     | |   |\n";
print"  |_| |_____|_____|__|__|        |_____|_  |___|___|___|_|_|_|_|_|_|\n";
print"                                       |___|                        \n";
print "SYSADMIN TOOLS -> (perl 5, version 32, subversion 1 (v5.32.1))::TechGuardian BR\n\n";
print "<<ONDE ESTOU?>> \n1) Empresa\n2) Casa\n";
# COMPILAÇÃO ->> POWERSHELL COMO ADMIN: pp -o IPCtgbr.exe chng.pl
my $choice = <STDIN>;

my $ip;
my $subnet;
my $gateway;
my $dns_server;
my $interface_name = "MODIFIQUE_COM_INTERFACE";
my $command_set_static;
my $command_set_dns;
my $command_set_dhcp;
my $command_reset_dns;

if ($choice == 1) {
    # CONFIGURAR IP FIXO RECORRENTE
    $ip = "xx.xx.xx.xx";
    $subnet = "xx.xx.xx.xx";
    $gateway = "xx.xx.xx.xx";
    $dns_server = "xx.xx.xx.xx";

    # SETAR IP FIXO NA INTERFACE
    $command_set_static = "netsh interface ip set address name=\"$interface_name\" static $ip $subnet $gateway";

    # SETAR DNS SERVER
    $command_set_dns = "netsh interface ip set dns name=\"$interface_name\" static $dns_server primary";
} elsif ($choice == 2) {
    # ALTERNAR PARA DHCP
    $command_set_dhcp = "netsh interface ip set address name=\"$interface_name\" source=dhcp";
    $command_reset_dns = "netsh interface ip set dns name=\"$interface_name\" source=dhcp";
} else {
    print "Escolha inválida. Nenhuma ação realizada.\n";
    exit;  
}

# DEFINIR CONFIGS DE IP FIXO
if ($command_set_static) {
    system($command_set_static);
    system($command_set_dns);
}

# ANTERNAR PARA DHCP
if ($command_set_dhcp) {
    system($command_set_dhcp);
    system($command_reset_dns);
}


print "Pressione Enter para sair...";
<STDIN>;
