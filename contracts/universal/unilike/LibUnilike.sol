// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12;
pragma experimental ABIEncoderV2;

import {IUnilikeFactory} from "./IUnilikeFactory.sol";
import {IUnilikePair} from "./IUnilikePair.sol";

library LibUnilike {
    function getPair(
        address _factory,
        address _tokenA,
        address _tokenB
    )
        internal
        view
        returns (IUnilikePair)
    {
        address pair = IUnilikeFactory(_factory).getPair(_tokenA, _tokenB);

        return IUnilikePair(pair);
    }

    function getPairAddress(
        address _factory,
        address _tokenA,
        address _tokenB
    )
        internal
        view
        returns (address)
    {
        return address(getPair(_factory, _tokenA, _tokenB));
    }

    function getReserves(address _pair)
        internal
        view
        returns (uint256 r0, uint256 r1)
    {
        return getReserves(IUnilikePair(_pair));
    }

    function getReserves(IUnilikePair _pair)
        internal
        view
        returns (uint256 r0, uint256 r1)
    {
        (r0, r1,) = _pair.getReserves();
    }
}
