#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define _zero 0
#define _2_zeros _zero, _zero
#define _4_zeros _2_zeros, _2_zeros
#define _8_zeros _4_zeros, _4_zeros
#define _16_zeros _8_zeros, _8_zeros
#define _32_zeros _16_zeros, _16_zeros
#define _64_zeros _32_zeros, _32_zeros
#define _128_zeros _64_zeros, _64_zeros
#define _256_zeros _128_zeros, _128_zeros

#define _SWAP(_arr, _idx_1, _idx_2) \
    do {                                \
        byte temp = _arr[_idx_1];       \
        _arr[_idx_1] = _arr[_idx_2];    \
        _arr[_idx_2] = temp;            \
    } while(0);

#define MAX 256

typedef unsigned char byte;

typedef struct {
    int valid_bytes;
    void *mem;
} Compose_t;

void RS4_cypher(byte *input, int input_len, byte *key, int key_len) {

    byte S[MAX] = {_256_zeros};
    for (int idx = 0; idx < MAX; idx++) {
        S[idx] = idx;
    }

    byte j = 0;
    for (int idx = 0; idx < MAX; idx++) {
        j = (j + S[idx] + key[idx % key_len]) % MAX;
        _SWAP(S, idx, j)
    }

    byte i, k, *output;
    output = (byte *) malloc(sizeof(byte) * input_len);
    i = j = 0;
    for (int idx = 0; idx < input_len; idx++) {
        i = (i + 1) % MAX;
        j = (j + S[i]) % MAX;
        _SWAP(S, i, j)
        k = S[(S[i] + S[j]) % MAX];
        output[idx] = k ^ input[idx];
    }

    for (int idx = 0; idx < input_len; idx++) {
        printf("%x:", output[idx]);
    }

    goto _dummy;

_dummy:
    return;
}

int main() {

    const byte *val = NULL;

    Compose_t *compose;

    byte input[MAX] = {_256_zeros};
    byte key[MAX] = {_256_zeros};

    scanf("%s", input);
    scanf("%s", key);

    RS4_cypher(input, strlen(input), key, strlen(key));
    printf("Inside [%s]!\n", __func__);

    return 0;
}
