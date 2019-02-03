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

<p>
	The Stable Swapper protocol can be used to mint coins that represent a 1:1 claim from a collateral pool of other stablecoins. This pool can be comprised of only decentralized coins, centralized coins, or a hybrid of the two. This removes the risk involved with being 100% exposed to the intricacies and security holes of a single stablecoin system. For example, if Stable Swapper is used to mint a stablecoin backed equally by Dai and USDC, and Dai's peg breaks, bringing it to $.50, the new stablecoin is only 50% exposed to the drop, so it still has $.75 of collateral backing each coin. Even though the new coin is now exposed to all vulnerabilities from Dai and USDC, the loss in value from a successful attack on Dai or USDC is halved. This diversification of risk is compatible with the intent of stablecoins because it contributes to stability.
</p>

# Table of Contents
1. [Current Stablecoin Landscape](#current_stablecoin_landscape)
2. [Tokens and Actors](#tokens_and_actors)
3. [Architecture Overview](#architecture_overview)
4. [Protocol Variables](#protocol_variables)
5. [Governance](#governance)

<a name="current_stablecoin_landscape"></a>
<h2>Current Stablecoin Landscape</h2>
<p>
	The stablecoin landscape as of 2019 includes a growing set of different coins with varying degrees of centralization. The smart contracts deployed by centralized systems relying on fiat custodians are typically much less sophisticated than the smart contracts responsible for decentralized coins like Dai. This greatly reduces the number of attack vectors targeting the smart contract, but creates new off-chain attack vectors that target the custodian. A legitimate argument can be made that centralized coins like TUSD and USDC fly in the face of the fundamental value proposition of cryptocurrencies: decentralization. However, there is still undoubtedly a market for centralized stablecoins. Tether, which has dominated the stablecoin space since it's conception maintained a market cap of over 2 billion dollars for the majority of 2018. Whether or not these coins stay true to the intentions of Bitcoin and decentralization, there's undoubtedly a market for centralized stablecoins. The differences between coins like Dai and Tether are sufficient enough to disqualify the idea that these coins are participating in a zero sum, winner take all game.
</p>
	
<a name="tokens_and_actors"></a>
<h2>Tokens and Actors</h2>
<p>
	<b>SWAP</b>: An ERC20 stablecoin minted and burned by Stable Swapper. SWAP is minted when a user deposits collateral, and burned when a user withdraws collateral. Each SWAP token is redeemable for a stablecoin from the collateral pool. The number of SWAP tokens in existence is always equal to the sum of the stablecoins in the collateral pool. In other words, SWAP is a stablecoin backed by other stablecoins.
	<br><br><b>STAKE</b>: A protocol token minted by Stable Swapper, used for decentralized governance over the protocol variables. Additionally, Swapping fees are paid out to holders of STAKE. In order to obtain STAKE, a user must send SWAP to a smart contract, which time-locks the SWAP until the STAKE's expiration block number. The only utility of expired STAKE is the ability to retrieve the time-locked SWAP.
	<br><br><b>Swapper</b>: An actor swapping between coins held in the collateral pool. Swappers are incentivized by the market dynamics of coins in the collateral pool. Currently, the most obvious incentive for swappers is to act on arbitrage opportunities between coins in the collateral pool. For example, if the Dai/USDC exchange rate on Exchange A is more than 1 + SWAP fee + gas, there is a guaranteed profit opportunity to swap USDC for Dai and sell the Dai on Exchange A.
	<br><br><b>Staker</b>: An actor holding STAKE. Stakers holding more than the (((proposal threshold))) are permitted to propose changes to protocol variables. All Stakers are able to vote on these proposals. Stakers have the most to lose in the event of a successful attack on the protocol, because their SWAP is time locked in a smart contract and unredeemable until (((Stake Lock Blocks))) have passed. More on this in (((Governance))).
</p>

<a name="architecture_overview"></a>
<h2>Architecture Overview</h2>
<p>
	At the center of Stable Swapper's architecture is a smart contract facilitating the following operations:
	<ul>
		<li>Minting SWAP tokens by taking deposits of stablecoins that satisfy current protocol variables.</li>
		<li>Paying off SWAP redemptions with stablecoins from the collateral pool.</li>
		<li>Performing swaps for swappers.</li>
	</ul>
</p>

<a name="protocol_variables"></a>
<h2>Protocol Variables</h2>
<p>
	Because cryptocurrency markets are unpredictable, it's important to give decentralized protocols the ability to adapt and updatein accordance with the desires of good actors using the protocol. For example, there will likely be many Stablecoin projects launching after the Stable Swapper contract has been deployed, and it's important that these coins can be added to the liquidity pool. However, plasticity often opens the door for bad actors attempting to manipulate protocol variables without concern for the longterm stability of the protocol.
</p>

<a name="governance"></a>
<h2>Governance</h2>
<p>
	Governance over the Stable Swapper protocol leverages STAKE tokens to vote on proposals that change the 
</p>
