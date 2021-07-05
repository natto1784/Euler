#ifndef STRUCTS_H
#define STRUCTS_H

// A weak implementation of a C++ vector with functions that will only every be
// used
struct Vector {
  int *items;
  unsigned int capacity;
  unsigned int total;
};
typedef struct Vector vec;
void new_vec(vec *);
void new_vec_with_size(vec *, unsigned int);
void vec_resize(vec *, unsigned int);
void vec_push_back(vec *, int);
void vec_free(vec *);

#endif
