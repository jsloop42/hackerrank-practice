//
//  1_hello_world.c
//  hackerrank
//
//  Created by Jaseem V V on 25.03.2024.
//

#include <stdio.h>
#include <stdlib.h>

/*
 Print "Hello, World!" in first line. Then read a line from input and print it.
 */
int hello_world(void) {
    printf("Hello, World!\n");
    char *str = NULL;
    size_t len = 0;
    size_t ret = getline(&str, &len, stdin);
    if (ret != -1) {
        puts(str);
    } else {
        puts("No input");
    }
    free(str);
    return 0;
}
