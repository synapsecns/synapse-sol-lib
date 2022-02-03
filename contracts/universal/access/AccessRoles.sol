// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12;
pragma experimental ABIEncoderV2;

abstract contract AccessRoles {
    bytes32 public constant NODEGROUP_ROLE  = keccak256("NODEGROUP_ROLE");
    bytes32 public constant GOVERNANCE_ROLE = keccak256("GOVERNANCE_ROLE");
}
