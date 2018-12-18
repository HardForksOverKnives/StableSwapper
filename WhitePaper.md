<div align="center">
	<h1>Stable Swapper: An open protocol for decentralized exchange of ERC20 Stablecoins at a fixed 1:1 ratio</h1>
	Connor Dunham<br>
	<a href="https://github.com/HardForksOverKnives/StableSwapper">GitHub Repository</a><br>
	October 20, 2018
</div>

<h2 align="center">Purpose</h2>
<p>
	The Stable Swapper Protocol aims to achieve two goals: create an ERC20 compliant stablecoin that is backed by other ERC20 stablecoins, and enable stablecoin liquidity providers to profit off market fluctuations between coins with identical pegs. Currently, the most common fiat-pegged ERC20 stablecoins are either backed by fiat like TUSD and USDC, or backed by cryptocurrency like MakerDao's Dai. Fiat-backed stablecoin architectures like TUSD and USDC require a central custodian to manage the fiat reserves backing the coin. Cryptocurrency-backed stablecoins like Dai maintain decentralization by utilizing Ethereum smart contracts to connect stability seekers (holders of Dai) with risk seekers (collateralized debt position holders). The Dai/CDP system is fairly complex. If you are unfamiliar with it, I suggest reading through MakerDao's <a href="https://makerdao.com/whitepaper/">overview</a>.
</p>

<h2>Tokens and Actors</h3>
<p>
	<b>IOUSD</b>: An ERC20 stablecoin minted/burned by Stable Swapper that represents stablecoins in the collateral pool. The number of IOUSD tokens in existence is always equal to the sum of the stablecoins in the collateral pool. In other words, IOUSD is a stablecoin backed by other stablecoins.
	<br><br><b>IOUV</b>: A protocol token minted by Stable Swapper. IOUV is used for decentrazed governance over the protocol's variables. 
</p>

<h2>Architecture Overview</h2>
<p>
	At the center of Stable Swapper's architecture is a smart contract facilitating the following operations.
	<ul>
		<li>Minting "IOUSD" and "IOUV" tokens by accepting deposits of stablecoins supported by the collateral pool.</li>
		<li>Paying off "IOUSD" tokens with stablecoins from the collateral pool.</li>
		<li>Performing trades with entities wishing to swap between stablecoins supported by the collateral pool at a 1:1 ratio.</li>
		<li>Vote processing for protocol governance.</li>
	</ul>
</p>
