#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "amqp.h"

#include "perl_math_int64.h"

typedef struct {
    int num;
} Data__AMQP__XS_t;

typedef Data__AMQP__XS_t* Data__AMQP__XS;

amqp_pool_t memory_pool;

MODULE = Data::AMQP::XS	PACKAGE = Data::AMQP::XS PREFIX = data_amqp_xs_

REQUIRE:        1.9505
PROTOTYPES:     DISABLE

BOOT:
    PERL_MATH_INT64_LOAD_OR_CROAK;

Data::AMQP::XS
data_amqp_xs_new(class, num)
    char* class
    int num
    CODE:
        Data__AMQP__XS self;
        self = (Data__AMQP__XS) calloc(1, sizeof(Data__AMQP__XS_t));
        self->num = num;
        RETVAL = self;
    OUTPUT:
        RETVAL

SV*
data_amqp_xs_get_num(self)
    Data::AMQP::XS self
    CODE:
        RETVAL = newSViv(self->num);
    OUTPUT:
        RETVAL
