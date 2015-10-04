#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "amqp.h"

#include "perl_math_int64.h"

typedef struct {
} Data__AMQP__XS_t;

typedef Data__AMQP__XS_t* Data__AMQP__XS;

amqp_pool_t memory_pool;

static const uint8_t protocol_header[8] = {
    'A', 'M', 'Q', 'P', 0,
    AMQP_PROTOCOL_VERSION_MAJOR,
    AMQP_PROTOCOL_VERSION_MINOR,
    AMQP_PROTOCOL_VERSION_REVISION
};

MODULE = Data::AMQP::XS	PACKAGE = Data::AMQP::XS PREFIX = data_amqp_xs_

REQUIRE:        1.9505
PROTOTYPES:     DISABLE

BOOT:
    PERL_MATH_INT64_LOAD_OR_CROAK;

Data::AMQP::XS
data_amqp_xs_new(class)
    char* class
    CODE:
        Data__AMQP__XS self;
        self = (Data__AMQP__XS) calloc(1, sizeof(Data__AMQP__XS_t));
        RETVAL = self;
    OUTPUT:
        RETVAL

void
data_amqp_xs_DESTROY(self)
    Data::AMQP::XS self
    CODE:
        free(self);

SV*
data_amqp_xs_amqp_version(...)
    CODE:
        const char* version = amqp_version();
        RETVAL = newSVpv(version, strlen(version));
    OUTPUT:
        RETVAL

SV*
data_amqp_xs_get_protocol_header(...)
    CODE:
        RETVAL = newSVpv( (char*)protocol_header, sizeof(protocol_header) );
    OUTPUT:
        RETVAL
