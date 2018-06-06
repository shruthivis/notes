---
title: Trading
---  

Here we consider basic (possibly multi-step) actions involving various negotiable instruments in the market.

## Value, valuers

### Beliefs and market positions

Agents, in trading securities, bet on change in market’s evaluation of securities. Thus, the market price of securities is adjusted continually.

If agents believe that a security will increase in value, they are said to act from a bullish/ long position. If the reverse is true, they are said to act from a bearish/ short position.

Agents may also believe a certain company will outperform or underperform other companies in the sector.

### Jitters

It is natural that the market tries to converge on the value of a security only gradually, as they process information about it through trades and bets. Thus, there are short term jitters in the stock price curve, which are different from the long-term booms and busts. Jitters result either from temporary change in sentiment of the traders while assimilating new information, or it can be the result of a large trade increasing the supply of certain securities relative to the demand.

Long-term booms and busts also a natural consequence of the heuristic nature of matching demand and supply.

#### Human instincts and biases

The market, being composed of humans, benefits and suffers from strengths and weaknesses of human instincts. Behavioral economics models can be used to explain the quirks of market evaluation.

##### Risk aversion

Humans are subject to risk aversion: they are more averse to loosing than they yearn for profits. This explains why security prices are fast to drop, but slow to rise: investors, eager to stop loss are more eager to sell, and they are more cautious in buying in the future.

##### Recency bias

Recent news about a security tends to affect evaluation more severely than it perhaps should. Ideally, long-term information about the asset should be a very important part of the evaluation.

### Comparative measures

#### P/E ratio

P/E or price/ earning ratio measures the size of a security’s price relative to the associated dividend. This is often used to identify high dividend yield stocks, which constitute attractive investments. One can think of the units as being years it takes to earn enough dividend to equal the price.

Comparison can even be between the states of a derivative at different points in time: Considering the P/E curve and the stock price together can be useful.

#### Price / book value (P/B) ratio

Here one considers the total asset value (aka book value) of a company and sees if the price is reasonable compared to it.

#### Risks

Securities which constitute riskier investments have lower value compared to less risky securities yielding similar returns. Judging investment risks is described elsewhere.

## Trading infrastructure

### Securities Exchanges

Stock markets provide a regulated/ facilitated environment for carrying out securities transactions/ trades. It operates in fixed trading hours - beyond those hours, brokers may trade on their amongst themselves in extended trading hours.

### Brokerages

Every trade is accomplished by agents/ brokers authorized to trade in the stock market - usually on behalf of their customers. A fraction of each trade is usually collected by the stock exchange as fees. A fraction is also collected from the buyers by the brokerage agency.

#### Regulation

They are regulated by rules framed by the Securities and Exchanges Commission (SEC) in USA.

Front-running of clients by their brokers is illegal. Also, while assigning option exercises sent to them by the exchange, they should use some equitable mechanism.

#### Quality

Brokerages vary in the fees they charge for trades, inactivity, money transfers.

They vary in the account opening process: minimum money required, ease, acceptance of international/ foreign traders.

They also vary in their ability to reinvest dividend without extra fees, interest paid for funds in ’sweep accounts’ holding uninvested cash.

They vary in the types of orders one can place, their quality of execution, the UI, speed of money transfers, whether investments are insured by a government agency (SPIC in USA).

zecco seems to have issues in order execution, severe ACH transfer delays, horrendous customer service. just2trade seems cheap and reliable, but it has very restrictive policies on options trading: eg: it would not allow selling cash covered puts. OptionsHouse seemed more flexible, with a good customer service, if slightly costlier.

### Fees

#### 

- Exchange fees
    - When a market charges taker and maker fees, they differentiate whether you're increasing the size of the order book or decreasing the size of the order book. When you create an order that is immediately matched with already existing orders, you're a taker because you take liquidity from the market.
- Brokerage fees
- Taxes
    - On transaction
    - On profits

#### Using leverage

Aka Margin trading. One can act on one’s belief about a security using money borrowed from an agent - in the hopes that one can sell it, repay the loan and make a profit on top of it.

### Insider trading

Trading based on non-public information - like board meetings - which can especially profit some people more than others, is discouraged and made illegal, mainly based on disguised jealousy.

## Buying and selling

Basic actions in a stock market are to buy or sell a security. The securities exchange has programs/ machines which effectively communicate the price of various stocks based on what prices people are asking/ willing to pay for them - by recording these bids.

### Market price order

A market order is an order to buy or sell a stock at the current market price.

#### Market price trigger

Aka Stop order. A stop order is an order to buy or sell a stock once the price of the stock reaches a specified price (the stop price). When the specified price is reached, your order becomes a market order.

With such orders, one can trigger buying or selling; this is a common technique used by agents for preventing excessive loss.

The disadvantage is that prices could fall rapidly between the trigger and the trade, so that securities are sold at very low prices - this happened in the 2010 Flash crash.

#### Market opening/ closing trigger

These orders become a market order at the opening/ closing time of the market.

### Price Limit order

One may want to buy or sell at or beyond a preset price - but this is only possible when there exist sellers or buyers willing to transact at that price. So, these actions are conducted at an appropriate time by computer programs acting on behalf of the investors.

Price limit order by an agent ensures that the transaction occurs only if it is not too unfavorable to the agent.

#### Market price trigger

Aka Stop-limit order. Once the stop price is reached, the stop-limit order becomes a limit order.

Stop-limit orders improve on stop orders in that: not only do they act on a similar trigger, but they are processed only if the price limit is met for the transaction.

### Order size and price

Small ’sell’ orders trade for the highest available bid in the market, whereas large ’sell’ orders may exhaust high-price bids and may actually sell at a lower average price.

## Multi-step Trading strategies

### Duration

The duration required for the entire trade varies. For example, while holding a long position, one can hold on to a stock for a short time - as in day-trading; or one can turn it into a long term investment.

### Buy, sell

One can buy a security at a certain time, in the hopes that it will increase significantly in monetary value - at which point one can sell the security to make a profit.

### Borrow, sell, buy, return

Aka Shorting.

Or one can borrow a security at a certain time, sell it immediately, and buy it in the future at a hopefully lower price to return the borrowed security, - aka shorting. So, one is betting that a certain security will loose value. Or, one can do this by buying credit-default swaps.

### Sector ETF + company trading.

Aka Pairs trading. Here agents act on the belief that a certain company will outperform or underperform relative to other companies in the sector.

They take advantage of the outperformance belief by holding a short position of a certain amount on the sector ETF and holding a long position of the same amount in the company in question. Similarly, they take advantage of belief in underperformance by holding a short position on the company and a long position on the sector ETF.

## Future trading contract

### Anticipated trade

One agent makes a deal with another to buy a certain amount of an ’underlying’ security on a specified future date at a certain ’strike’ price. To satisfy this deal, the seller is obliged to buy the security - if he does not already hold it - on or before the due-date.

#### Motivation

The seller is betting that the market price of the security on or before the due-date will be lower than the set price; and the buyer is betting that the market price will exceed the set-price on or after the due-date. So, both stand to make a profit according to their beliefs.

#### Effect on evaluation

If one ignores market jitters, the beliefs of the buyer and seller are mildly contradictory, in that believes that there will be a fall in the price of the security, whereas they buyer believes that there will be a rise in the price of the security.

These publicly stated beliefs have an effect on the evaluation of securities - speculation about the future can cause currency or commodity prices to rise even during the present time.

## Buy/sell options

### Definition

The buyer of an option gains the right (not obligation) to buy or sell (depending on the option type) an underlying security (100 shares in case of a standard option) at a specified strike price per share by a certain expiration day in case of American-style options (which we consider here), or exactly on a certain day in case of European-style options.

The seller of such an option is called a writer.

#### Premium

The price paid for buying an option is called a premium: this insurance term being used because one is essentially guaranteeing purchase or sale at a certain price despite risk of loss.

Its size depends on the terms of the contract (due date, underlying security, strike price). An option is worth nothing if it has expired.

The expected market price of the underlying security remaining the same, premium decreases with time as uncertainty decreases with time.

#### Expiration day

Option chains expire weekly, monthly or quarterly. Most commonly, in USA, they expire monthly on the third Friday/ Thursday of every month.

A limited number of weekly options are being tried out.

### Notation

The running example below is XOP call option expiring on 20 Aug 2011, with strike price 48.

Most common notation: 48 Aug call (symbol XOP is mentioned elsewhere).

Sometimes a 5 letter alphabetical symbol is used, with letters indicating the stock, the expiry month, the strike price.

Another notation is XOP 110820C00048000.

### Options exchange

All options purchases, sales and exercises are done through the centralized options exchange: Options clearing corporation (OCC) in USA.

### Exercising options

The holder of an option can exercise his right to buy/ sell the underlying security by informing his broker of this intent before a certain deadline agreed between them.

When exercising an option, one usually needs to pay a brokerage for selling/ buying stock.

#### Effective time

The option-holder, upon exercising the option, is deemed to have purchased or sold the underlying security at the end of the same trading day: so theoretically he has the right to use the money/ security he gets immediately, and he has the right to any dividend which may be given the next day onwards.

#### Settlement type

At exercise, the option contract specifies the manner in which the contract is to be settled: physical (Eg: many equity options) or cash to buy (Eg: index tracking security options).

#### Clearing, assignment

This intent is communicated to the exchange by the broker/ clearing agent, which then randomly picks a broker who has sold such an option and decides that this entity must fulfill the obligation. The obligated broker will be informed by next day and the securities/ money is deducted from his account.

The broker in turn internally passes the obligation on an equitably chosen client on whose behalf the option contract was written. This process is called assignment.

#### Frequency

Around 12% of all option contracts are exercised: people often prefer to avoid the hassle of exercising options by selling away their options near the expiry date.

People are also motivated to exercise options just before dividend is expected to be distributed.

### Motivation

The motivation for either party to enter the contract is their differing opinions about the price of the underlying security in the stretch of time upto the expiration time.

The seller of a call option believes that with significant probability, the market price during this time will not exceed the (strike-price - premium).

The seller of a put option believes that the price during this time is unlikely to fall below the strike-price - premium.

### Basic trades

Options which grant the right to buy are called call options; those that grant the right to sell are called put options. Selling or buying an option is, as usual, denotes taking a short or long position on the option.

#### Risk and return
On any given day, the market value ($$m$$) of the underlying security at the end of trading on that day, an option (bought with premium $$p$$) is said to be ’in the money’ or ’out of the money’ depending on whether exercising it at strike price s leads to a profit or a loss for the holder of the option $$( \vert s − m \vert −p)$$. Correspondingly, the option writer looses or gains the same amount.

Since the option holder may choose not to exercise the option in case doing so would lead to a loss, the maximum loss he undergoes is p, while the returns can potentially be ∞ in case of call options or  $$\vert s \vert$$  in case of put options. The option writer, correspondingly has limited opportunity for profit $$ \vert p \vert $$ (which happens when the option is not exercised), and a correspondingly big potential loss.

#### Covered options

Since the put option writer only stands to loose (is obliged to pay) at most  $$\vert s \vert $$, even risk averse brokerages usually allow cash covered puts. This is usually a good option in case one intends to invest a certain security at a low enough price.

Similarly, brokerages easily allow folks to write call options when they already own the underlying security in sufficient quantities.

### Vertical Spreads

#### Definition

Here one buys and sells a put or call option over the underlying security, and at the same expiration date at different strike prices ($$s_b$$ and $$s_s$$), with premiums $$p_b$$, $$p_s$$.

#### Exercising strategy

Since an option is both bought and sold, the person holding the spread is obligated in case the sold option is exercised. The idea is to be able to meet this obligation whenever necessary by exercising the bought option, hopefully while making a profit.

This being the case, good triggers for exercising the bought option would be a\] the expiration day, when the bought option is ’in the money’, and/ or b\] the sold option has been exercised.

#### Plots: inference

Consider a coordinate system with horizontal axis being time, and vertical axis being price, with 3 curves: two horizontal lines corresponding to $$y = s_b$$ and $$y = s_s$$, and the market value $$m + p_s − p_b$$. From this, one can reason quickly and correctly about a\] the value of benefiting from the option on a certain expiration day (a vertical line in the plot, leading to the name ’vertical’ spreads).

It is also easy to visualize risk and return with a plot of profit against market price.

#### Risk and return

One is reducing the investment (and the risked loss) while limiting potential returns.

If both options are in the money, returns are $$ \vert s_s − s_b \vert −(p_b − p_s)$$. If just the purchased option is in the money, returns are $$ \vert m − s_b \vert −(p_b − p_s)$$. If both the options are out of money, loss is $$(p_b − p_s)$$. When only the sold option is in the money, loss is $$ \vert m − s_s \vert −(p_b − p_s)≤ \vert s_b − s_s \vert −(p_b − p_s)$$.

Thus, in all cases, profit and loss are limited. Potential loss is significant only when it happens that only the sold option is in the money: in other cases, loss is merely $$(p_b − p_s)$$. This significant loss eventuality is non existent in case of bullish call spreads and bearish put spreads.

#### Types

In case of a call spread, one buys and sells call options; put spreads are similarly defined. Depending on whether $$s_s ≥ s_b$$, call spreads are called bullish or bearish (the reason for which is clear upon considering potential profit and loss). Put spreads are bearish or bullish depending on whether $$s_b < s_s$$.

### Straddles

In a straddle, one buys/ sells put and call options (at a combined premium p) for the same security at the same strike price s, with the same expiry date.

If the options are bought, we have a long straddle. If the options are sold, we have a short straddle. In case of a long straddle, one is essentially betting that the market price will move outside the interval $$[s − p, s + p]$$. In the case of a short straddle, one is betting that the reverse will happen.

#### Risk and returns

WIth a long straddle, potential loss is atmost p, while potential returns are ∞. In case of a short straddle, the potential returns are atmost p, while potential loss is unlimited.