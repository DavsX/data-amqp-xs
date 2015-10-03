package Data::AMQP::XS;

use v5.10;
use strict;
use warnings;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Data::AMQP::XS', $VERSION);

1;
