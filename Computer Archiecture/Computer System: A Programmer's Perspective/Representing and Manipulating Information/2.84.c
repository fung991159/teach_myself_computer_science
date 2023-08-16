int float_le(float x, float y)
{
    unsigned ux = f2u(x);
    unsigned uy = f2u(y);
    /* Get the sign bits */
    unsigned sx = ux >> 31;
    unsigned sy = uy >> 31;

    return (
        // 1. check if both x & y is zero
        (ux << 1 == 0) && (uy << 1 == 0) ||
        // 2. if x & y is different sign, return 1 if x is negative
        ((sx != sy) && sx) ||
        // 3. if x & y is same sign, check if x is smaller than y
        ((sx == sy) && ux <= uy));
};
