use strict;
use warnings;
use 5.010;

use ExtUtils::MakeMaker;
use Config;
use FindBin qw($Bin);

my $ofiles = '';
for ( <$Bin/*.c> ) {
    $_ =~ s/.c$/.o/;
    $ofiles .= "$_ ";
}

WriteMakefile(
    NAME          => 'Data::AMQP::XS',
    VERSION_FROM  => 'lib/Data/AMQP/XS.pm',
    ABSTRACT_FROM => 'lib/Data/AMQP/XS.pm',
    AUTHOR        => 'David Kovacs <davs@cpan.org>',
    OPTIMIZE      => $ENV{'OPTIMIZE'},
    LIBS          => [''],

    CCFLAGS         => "$Config{ccflags} -I${Bin}",

    OBJECT        => "XS.o $ofiles",
    DEFINE        => "-DAMQ_PLATFORM='\"Perl_$^O_$^V\"'",
    INC           => '-I.',
    PREREQ_PM     => {
        'Math::Int64' => 0.34,
    },
);
