<div align="center">
	<h1>Stable Swapper: An open protocol for decentralized exchange of ERC20 Stablecoins at a fixed 1:1 ratio</h1>
	Connor Dunham<br>
	<a href="https://github.com/HardForksOverKnives/StableSwapper">GitHub Repository</a><br>
	October 20, 2018
</div>

<h2 align="center">Purpose</h2>
<p>
	The Stable Swapper Protocol aims to achieve two goals: facilitate the creation of ERC20 compliant stablecoins that are backed by other ERC20 stablecoins, and enable stablecoin liquidity providers to profit off market fluctuations between coins with identical pegs. Currently, the most common fiat-pegged ERC20 stablecoins are either backed by fiat like TUSD and USDC, or backed by cryptocurrency like MakerDao's Dai. Fiat-backed stablecoin architectures like TUSD and USDC require a central custodian to manage the fiat reserves backing the coin. Cryptocurrency-backed stablecoins like Dai maintain decentralization by utilizing Ethereum smart contracts to connect stability seekers (holders of Dai) with risk seekers (collateralized debt position holders). The Dai/CDP system is fairly complex. If you are unfamiliar with it, I suggest reading through MakerDao's <a href="https://makerdao.com/whitepaper/">overview</a>.
</p>

<h2>Tokens and Actors</h3>
<p>
	<b>SWAP</b>: An ERC20 stablecoin minted and burned by Stable Swapper. SWAP is minted when a user deposits collateral, and burned when a user withdraws collateral. Each SWAP token is redeemable for a stablecoin from the collateral pool. The number of SWAP tokens in existence is always equal to the sum of the stablecoins in the collateral pool. In other words, SWAP is a stablecoin backed by other stablecoins.
	<br><br><b>STAKE</b>: A protocol token minted by Stable Swapper, used for decentralized governance over the protocol variables. Additionally, Swapping fees are paid out to holders of STAKE. In order to obtain STAKE, a user must send SWAP to a smart contract, which time-locks the SWAP until the STAKE's expiration block number. The only utility of expired STAKE is the ability to retrieve the time-locked SWAP.
	<br><br><b>Swapper</b>: An actor swapping between coins held in the collateral pool. Swappers are typically incentivized by market situations outside the scope of Stable Swapper. Currently the most obvious incentive is arbitrage opportunities across coins in the collateral pool. For example, if the Dai/USDC exchange rate on Exchange A is more than 1 + SWAP fee + gas, there is a profit opportunity for swapping USDC for Dai and selling the Dai on Exchange A.
	<br><br><b>Staker</b>: An actor holding STAKE. Stakers holding more than the (((proposal threshold))) are permitted to propose changes to protocol variables. All Stakers are able to vote on these proposals. Stakers have the most to lose in the event of a successful attack on the protocol, because their SWAP is time locked in a smart contract and unredeemable until (((Stake Lock Blocks))) have passed. More on this in (((Governance))).
</p>

<h2>Architecture Overview</h2>
<p>
	At the center of Stable Swapper's architecture is a smart contract facilitating the following operations:
	<ul>
		<li>Minting SWAP tokens by taking deposits of stablecoins that satisfy current protocol variables.</li>
		<li>Paying off SWAP redemptions with stablecoins from the collateral pool.</li>
		<li>Performing swaps for swappers.</li>
	</ul>
</p>

<h2>Protocol Variables</h2>
<p>
	Because cryptocurrency markets are unpredictable, it's important to give decentralized protocols the ability to adapt and updatein accordance with the desires of good actors using the protocol. For example, there will likely be many Stablecoin projects launching after the Stable Swapper contract has been deployed, and it's important that these coins can be added to the liquidity pool. However, plasticity often opens the door for bad actors attempting to manipulate protocol variables without concern for the longterm stability of the protocol.
</p>

<h2>Governance</h2>
<p>
	Governance over the Stable Swapper protocol leverages STAKE tokens to vote on proposals that change the 
