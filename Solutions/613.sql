select min(abs(A.x - B.x)) from point A join point B on A.x != B.x;
