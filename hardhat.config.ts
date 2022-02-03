import path from "path";
import * as dotenv from "dotenv";

import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "hardhat-gas-reporter";
import "solidity-coverage";

dotenv.config();

const
    BASE_PATH: string = "./",
    CONTRACTS_PATH: string = path.join(BASE_PATH, "contracts"),
    CACHE_PATH:     string = path.join(BASE_PATH, "cache"),
    ARTIFACTS_PATH: string = path.join(BASE_PATH, "artifacts"),
    TESTS_PATH:     string = path.join(BASE_PATH, "test"),
    SCRIPTS_PATH:   string = path.join(BASE_PATH, "scripts");

const config: HardhatUserConfig = {
  paths: {
    root:      BASE_PATH,
    sources:   CONTRACTS_PATH,
    cache:     CACHE_PATH,
    artifacts: ARTIFACTS_PATH,
    tests:     TESTS_PATH,
  },
  solidity: {
    compilers: [
      { version: "0.8.11" },
      { version: "0.6.12" },
    ]
  },
  networks: {
    ropsten: {
      url: process.env.ROPSTEN_URL || "",
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  // etherscan: {
  //   apiKey: process.env.ETHERSCAN_API_KEY,
  // },
};

export default config;
