#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "perl_math_int64.h"

MODULE = Data::AMQP::XS	PACKAGE = Data::AMQP::XS PREFIX = data_amqp_xs_

REQUIRE:        1.9505
PROTOTYPES:     DISABLE

BOOT:
    PERL_MATH_INT64_LOAD_OR_CROAK;

void
data_amqp_xs_test()
    CODE:
        printf("hello world\n");
