# Micro Donations Pool – Solidity Smart Contract

A simple Ethereum-based donation pool that collects micro-donations from users and forwards all collected funds to a fixed charity wallet.  
The contract is intentionally designed with no imports, no constructors, and no function input parameters.

---

## 🛠 Features

- ✅ Anyone can donate using `donate()` or by sending ETH directly.
- ✅ Tracks individual donor contributions.
- ✅ Anyone can trigger a full withdrawal to the predefined charity via `withdrawAll()`.
- ✅ Includes a basic reentrancy guard for safety.
- ✅ Fully permissionless – no owner, no admin.

---

## 📜 Contract Summary

| Function      | Visibility | Description |
|--------------|------------|-------------|
| `donate()`   | External / Payable | Accepts ETH donations |
| `withdrawAll()` | External | Sends full contract balance to charity |
| `receive()` / `fallback()` | External / Payable | Accepts direct ETH transfers |

> 🔒 Charity address is hardcoded and cannot be changed after deployment.  
> ✏️ **Make sure to replace the placeholder address (`0x1111...1111`) before deploying.**

---

## 🚀 How to Deploy

You can deploy this contract using:

### ✅ Remix (Recommended)

1. Go to **https://remix.ethereum.org**
2. Create a new Solidity file (e.g., `MicroDonationPool.sol`)
3. Paste the contract code
4. Choose compiler `0.8.19` or higher
5. Click **Deploy**
6. Start donating or trigger `withdrawAll()`

---

## 💡 Suggested Use Cases

- Community crowdfunding for NGO campaigns
- Micro-philanthropy pools
- “Tip jar” forwarding to verified charity wallets

---

## ⚠️ Security Notes

- This contract sends **all funds** to the predefined charity when `withdrawAll()` is called.
- Since **anyone can trigger withdrawal**, ensure that the charity wallet is trusted.
- ETH-only — no support for ERC20 tokens unless extended manually.

---

## ✅ License

This project is released under the **MIT License**.  
Feel free to modify or enhance it for your use case.

---

## 📬 Need Customization?

Want:

- Multi-charity support?
- Admin-restricted withdrawals?
- ERC20-compatible version?

Just ask — I can generate variants instantly.
