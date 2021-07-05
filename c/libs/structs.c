#include "structs.h"
#include <stdlib.h>
#include <stdio.h>

void new_vec(vec *v) { return new_vec_with_size(v, 0); }
void new_vec_with_size(vec *v, unsigned int n) {
  v->capacity = n;
  v->total = 0;
  v->items = malloc(sizeof(int) * n);
}

void vec_push_back(vec *v, int item) {
  if (v->capacity == v->total){
    vec_resize(v, v->capacity + 1);
  }
  v->items[v->total++] = item;
}

void vec_resize(vec *v, unsigned int n) {
  v->items = realloc(v->items, sizeof(int) * n);
  v->capacity = n;
}

void vec_free(vec *v) {
  free(v->items);
  v->total = 0;
}
