function dx = LogisticEquation(t, x, r, K)
    dx = r * x * (1 - x / K);
end