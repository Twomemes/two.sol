import {parseEther} from 'ethers/lib/utils';
import {captainClaimContract} from '~/utils/contract';
import {contractAddress} from '../../utils/contract';
import {formatEther} from 'ethers/lib/utils';
import {captureRejections} from 'events';

(async () => {
  const captain = await captainClaimContract();
  const address1 = await captain.setMysteryAdd('');
  console.log(address1);
})();
