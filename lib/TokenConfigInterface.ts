import NetworkConfigInterface from '../lib/NetworkConfigInterface';

export default interface TokenConfigInterface {
  testnet: NetworkConfigInterface;
  mainnet: NetworkConfigInterface;
  contractName: string;
  publicName: string;
  tbccTokenAddress: string;
  randomGeneratorAddress: string;
  contractAddress: string|null;
};
