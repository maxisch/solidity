function keccak256(bytes memory input) pure returns (bytes32 ret) {
  assembly "evmasm" ("memory-safe") {
    ret := keccak256(add(input, 0x20), mload(input))
  }
}