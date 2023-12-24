# hyperledger-workshop
Environment for a Hyperledger Workshop for issuing credentials via Indy Besu ledger


## Step 0. Open the repository in Gitpod

https://gitpod.io/#https://github.com/Toktar/hyperledger-workshop.git

## Step 1. Setup Indy environment and launch Indy Besu ledger (pool)

```bash
sudo -E ./setup.sh
```

## Step 2. Build the demo project

```bash
cd aries-framework-javascript/demo
nvm install 18.0.0
yarn install
```

## Step 3. Launch Holder (Alice) CLI

```bash
yarn alice
```

## Step 4. Launch Issuer (Faber) CLI

```bash
yarn faber
```
