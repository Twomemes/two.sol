

import { Airdrop__factory } from '~/typechain';
import { contractAddress, airdropContract } from '~/utils/contract';
import { upgrade } from '~/utils/upgrader';
import { getSigner } from '~/utils/contract';
import { fetcher } from '~/utils/fetcher';

(async () => {
  const airdrop = await airdropContract();

  const signer = await getSigner(0);
  const signs = await fetcher<{
    address: string;
    id: number;
    amount: string;
    sign: {
      v: number;
      r: string;
      s: string;
    }
  }[]>(`https://twochoice.vercel.app/api/two/airdrop/${signer.address}`);

  console.log(signer.address);
  console.log(signs);
  for (const s of signs) {
    const tx = await airdrop.claim(s.id, s.amount, s.sign.v, s.sign.r, s.sign.s,{gasLimit: 1000000});
    console.log(tx.hash);

    //const tx = await airdrop.checkToClaim2(signer.address, s.amount, s.id,s.sign.v, s.sign.r, s.sign.s);
    //console.log(tx);
  }




})();



