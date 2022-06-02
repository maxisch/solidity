function uintSuffix(uint) pure returns (uint) { return 1; }
function uint8Suffix(uint8) pure returns (uint) { return 1; }
function addressSuffix(address) pure returns (uint) { return 1; }
function decimalSuffix(uint, uint) pure returns (uint) { return 1; }
function stringSuffix(string memory) pure returns (uint) { return 1; }
function bytesSuffix(bytes memory) pure returns (uint) { return 1; }

contract C {
    function f() public pure {
        1 uintSuffix;       // allowed
        1 uint8Suffix;      // allowed
        1 addressSuffix;
        1 decimalSuffix;    // allowed
        1 stringSuffix;
        1 bytesSuffix;

        1024 uintSuffix;    // allowed
        1024 uint8Suffix;
        1024 addressSuffix;
        1024 decimalSuffix; // allowed
        1024 stringSuffix;
        1024 bytesSuffix;

        0x1234567890123456789012345678901234567890 uintSuffix;
        0x1234567890123456789012345678901234567890 uint8Suffix;
        0x1234567890123456789012345678901234567890 addressSuffix; // allowed
        0x1234567890123456789012345678901234567890 decimalSuffix;
        0x1234567890123456789012345678901234567890 stringSuffix;
        0x1234567890123456789012345678901234567890 bytesSuffix;

        1.1 uintSuffix;
        1.1 uint8Suffix;
        1.1 addressSuffix;
        1.1 decimalSuffix; // allowed
        1.1 stringSuffix;
        1.1 bytesSuffix;

        "a" uintSuffix;
        "a" uint8Suffix;
        "a" addressSuffix;
        "a" decimalSuffix;
        "a" stringSuffix;  // allowed
        "a" bytesSuffix;   // allowed

        hex"abcd" uintSuffix;
        hex"abcd" uint8Suffix;
        hex"abcd" addressSuffix;
        hex"abcd" decimalSuffix;
        hex"abcd" stringSuffix;
        hex"abcd" bytesSuffix;   // allowed
    }
}
// ----
// TypeError 8838: (528-543): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (592-606): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (616-629): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (679-695): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (705-723): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (772-789): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (799-815): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (826-879): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (889-943): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 4778: (1030-1086): Functions that take 2 arguments can only be used as literal suffixes for rational numbers.
// TypeError 8838: (1096-1151): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1161-1215): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1226-1240): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1250-1265): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1275-1292): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1340-1356): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1366-1381): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1392-1406): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1416-1431): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1441-1458): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 4778: (1468-1485): Functions that take 2 arguments can only be used as literal suffixes for rational numbers.
// TypeError 8838: (1572-1592): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1602-1623): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 8838: (1633-1656): The type of the literal cannot be converted to the parameter of the suffix function.
// TypeError 4778: (1666-1689): Functions that take 2 arguments can only be used as literal suffixes for rational numbers.
// TypeError 8838: (1699-1721): The type of the literal cannot be converted to the parameter of the suffix function.
