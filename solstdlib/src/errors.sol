
// TODO here we get "cannot redefine built-in errors".
// We should only create this error outside of the stdlib.
// It would also be nice if we could still compile this file
// when it is read from disk and not only when it is
// part of the solidity binary.
// We could add an "error-override" annotation here to allow this.

error Error(string);
error Panic(uint);

function panic(uint code)
{
  bytes memory data = abi.encodeCall(Panic, code);
  assembly "evmasm" ("memory-safe") {
    revert(data, mload(data))
  }
}

function revert() pure
{
  assembly "evmasm" ("memory-safe") {
    revert(0, 0)
  }
}

function revert(string memory reason) pure
{
  // TODO would be nice if we could prepend the error selector here instead of copying the error data.
  // This is possible if we know that "data" is larger than the initial free memory pointer by a certain amount.
  // TODO the current codegen has a separate code path for string literals at least,
  // which removes one copy operation.

  bytes memory data = bytes.concat(error_selector, bytes32(uint(0x20)), bytes32(bytes(reason).length), bytes(reason));
  assembly "evmasm" ("memory-safe") {
    revert(data, mload(data))
  }
}