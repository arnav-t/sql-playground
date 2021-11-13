select DISTINCT(C1.seat_id) from cinema C1 join cinema C2 on C1.seat_id + 1 = C2.seat_id or C1.seat_id - 1 = C2.seat_id where C1.free = 1 and C2.free = 1;
