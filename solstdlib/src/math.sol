// TODO if we implement this in the stdlib, we will lose the compile-time analysis of reporting
// div by zero when using a zero literal for m

// TODO Would be nice to have internal imports / explicit exports now.
import panic from "./errors.sol";
import "./panic_codes.sol" as PanicCodes;

function addmod(uint x, uint y, uint m) pure returns (uint ret) {
  if (m == 0) { panic(PanicCodes.DIVISION_BY_ZERO); }
  assembly "evmasm" ("memory-safe") {
    ret := addmod(x, y, m)
  }
}

function mulmod(uint x, uint y, uint m) pure returns (uint ret) {
  assembly "evmasm" ("memory-safe") {
    ret := mulmod(x, y, m)
  }
}