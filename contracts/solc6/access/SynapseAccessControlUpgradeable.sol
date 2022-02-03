// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import {AccessRoles} from "../../universal/access/AccessRoles.sol";

import {Initializable} from "@openzeppelin/contracts-upgradeable-solc6/proxy/Initializable.sol";
import {AccessControlUpgradeable} from "@openzeppelin/contracts-upgradeable-solc6/access/AccessControlUpgradeable.sol";

abstract contract SynapseAccessControlUpgradeable is
    AccessRoles,
    Initializable,
    AccessControlUpgradeable
{
    function __SynapseAccessControl_init()
        internal
        initializer
    {
        __AccessControl_init();
        __SynapseAccessControl_init_unchained();
    }

    function __SynapseAccessControl_init_unchained()
        internal
        initializer
    {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    modifier adminOnly() {
        require(
            hasRole(DEFAULT_ADMIN_ROLE, msg.sender),
            "Not admin"
        );

        _;
    }

    modifier governanceOnly() {
        require(
            hasRole(GOVERNANCE_ROLE, msg.sender),
            "Not governance"
        );

        _;
    }

    modifier nodegroupOnly() {
        require(
            hasRole(NODEGROUP_ROLE, msg.sender),
            "Not Nodegroup"
        );

        _;
    }

    uint256[50] private __gap;
}
