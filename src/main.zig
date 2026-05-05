const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 152;
const risk_penalty: i32 = 4;
const latency_penalty: i32 = 4;
const weight_bonus: i32 = 3;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 56, .capacity = 104, .latency = 25, .risk = 22, .weight = 4 };
    try std.testing.expectEqual(@as(i32, 40), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "review"));
    const signal_case_2 = Signal{ .demand = 61, .capacity = 78, .latency = 21, .risk = 21, .weight = 7 };
    try std.testing.expectEqual(@as(i32, 53), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 98, .capacity = 79, .latency = 18, .risk = 21, .weight = 11 };
    try std.testing.expectEqual(@as(i32, 152), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}
