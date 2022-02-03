// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import {AccessRoles} from "../../universal/access/AccessRoles.sol";
import {AccessControl} from "@openzeppelin/contracts-solc8/access/AccessControl.sol";

abstract contract SynapseAccessControl is
    AccessRoles,
    AccessControl
{
    constructor()
    {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    modifier adminOnly() {
        require(
            hasRole(DEFAULT_ADMIN_ROLE, msg.sender),
            "Caller is not Admin"
        );

        _;
    }

    modifier governanceOnly() {
        require(
            hasRole(GOVERNANCE_ROLE, msg.sender),
            "Caller is not Governance"
        );

        _;
    }

    modifier nodegroupOnly() {
        require(
            hasRole(NODEGROUP_ROLE, msg.sender),
            "Caller is not Nodegroup"
        );

        _;
    }
}
