import TokenConfig from './TokenConfig';

// Update the following array if you change the constructor arguments...
const ContractArguments = [
  TokenConfig.tbccTokenAddress,
  TokenConfig.randomGeneratorAddress,
] as const;

export default ContractArguments;
