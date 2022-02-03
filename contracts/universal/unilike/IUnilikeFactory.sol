// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12;
pragma experimental ABIEncoderV2;

interface IUnilikeFactory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}