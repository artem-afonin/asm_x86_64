# Linked List implementation

#### Using coordinate structure:
```C
/* 24 bytes in x86_64 gcc 7.5.0 */
struct CoordNode
{
    long long x;
    long long y;
    struct CoordNode *next;
};
```

### and Linked List structure:
```C
/* 16 bytes in x86_64 gcc 7.5.0 */
struct LinkedList
{
    struct CoordNode *head;
    struct CoordNode *tail;
};
```
