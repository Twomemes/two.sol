import {parseEther} from 'ethers/lib/utils';
import {contractAddress, claimLockContract} from '../../utils/contract';
import {formatEther} from 'ethers/lib/utils';

(async () => {
  const claimlock = await claimLockContract();
  let a = await claimlock.getFarmAccInfo('0x33e85AebCdA9744b08037d02e51E3b19518d6D14');
  console.log(a);

  let b = await claimlock._userLockedFarmRewards('0x33e85AebCdA9744b08037d02e51E3b19518d6D14',0);
  console.log(b);
})();
