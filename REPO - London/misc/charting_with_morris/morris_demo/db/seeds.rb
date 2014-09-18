Migration.destroy_all
NatInsurance.destroy_all


NatInsurance.create([
{year_taken: "2002", london: 11.3, uk: 17.7, london_as_percent: 64.2},
{year_taken: "2003", london: 18.8, uk: 28.7, london_as_percent:  65.5},
{year_taken: "2004", london: 38.0, uk: 116.8, london_as_percent: 32.5},
{year_taken: "2005", london: 63.7, uk: 276.7, london_as_percent: 23.0},
{year_taken: "2006", london: 68.9, uk: 317.5, london_as_percent: 21.7},
{year_taken: "2007", london: 87.7, uk: 332.4, london_as_percent: 26.4},
{year_taken: "2008", london: 74.4, uk: 257.0, london_as_percent: 28.9}
])


Migration.create([
{year_taken: "2001", pop_in: 36.8,  pop_out: 31.1,  net_pop: 47.4},
{year_taken: "2002", pop_in: 35.1,  pop_out: 29.8,  net_pop: 48.4},
{year_taken: "2003", pop_in: 34.1,  pop_out: 28.4,  net_pop: 48.0},
{year_taken: "2004", pop_in: 31.6,  pop_out: 25.6,  net_pop: 40.0},
{year_taken: "2005", pop_in: 30.9,  pop_out: 26.3,  net_pop: 38.8},
{year_taken: "2006", pop_in: 28.9,  pop_out: 29.4,  net_pop: 27.8},
{year_taken: "2007", pop_in: 28.0,  pop_out: 27.0,  net_pop: 29.6},
{year_taken: "2008", pop_in: 27.6,  pop_out: 26.5,  net_pop: 30.7}
])