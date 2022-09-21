# TRITON-MSR verification cases for M E 377K

## Removal/Addition (A -> 0 / 0 -> A)
- One isotope (U-235) from A
- One isotope to A

## Linear (A -> B)
- One isotope in A and B, verify it moves as expected
- One isotope, different volume for A and B, verify
- Different density for A and B, verify
- Different volume/density, same mass, verify

## Linear + Removal/Addition (A -> B -> 0 / 0 -> A -> B)
- One isotope in A and B and removed from B, verify B remains constant if flow fraction adjusted accordingly
- One isotope in A and B and added to A, verify A remains constant if flow fraction adjusted accordingly
- Same cases as linear with addition/removal add, verify A/B remains constant

## Loop (A -> B -> A)
- Same cases as linear, verify no net mass change in A or B
- Add to A and remove from B at same rate, verify constant mass in both

## Multi-Isotope
- All of the above for two isotopes (2nd is stable, Pb-210)
- All of the above with 6 more stable isotopes, 8 total (H-1, He-4, Li-7, Be-9, B-11, C-12)
- All of the above for two isotopes (2nd is radioactive with short half life, Xe-140 (13.6s))
- Depleted fuel (no analysis, just demonstration)

## Challange Cases
- 3 regions (A -> B -> C -> A) with samll B volume: if mass of B/mass flow rate < 1, some would pass from A through B to C in one second
  - Can you have loss of 200%/second from B, with no removal? Does it behave correctly
  - If there is a removal in B, does the stuff from A that skipped it get removed or miss the B removal?
  - Goal: Do we require a minimum volume/mass per physical region to allow the modeling to be accurate or guide ORNL to adjust, e.g. option to set time step to something smaller than default 1s?
- Order: for loop, switch order of A and B and verify results don't change
- Understand what initial heavy metal mass means when adding heavy metal: set mass basis manually or evaluate how it does it internally

## Physics Demonstrations
- MSRR normal operation: compare with straight TRITON
  - Off-gas, fuel feed, solid filtering, flow
- MSRR off-gas content: core + off-gas series of charcoal canisters
- 3D flow through core: modify the power distribution input
- Salt spill accident (MHA)
