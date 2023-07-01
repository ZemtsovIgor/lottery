import TokenConfigInterface from '../lib/TokenConfigInterface';
import * as Networks from '../lib/Networks';

const TokenConfig: TokenConfigInterface = {
  testnet: Networks.bscMainnet,
  mainnet: Networks.bscMainnet,
  contractName: 'TBCCLottery',
  publicName: 'TBCC Lottery',
  tbccTokenAddress: '0x4dcCa80514c13dAcBd4A00c4E8dB891592a89306',
  randomGeneratorAddress: '0x200665d3D819c31a91deA995E1fa240204EFF08B',
  contractAddress: '0x3a6b6ca1d3A49FFf1Bf65300eb8F4F6909365634',
};

export default TokenConfig;
