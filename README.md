# Recursion Error Poc

After installing poetry deps:

1. Set `SEPOLIA_RPC_URL` in `.env` file, this will be used for forking with `anvil`
2. Run `poetry run ape plugins install .`
3. Open a terminal window and run `make anvil-sepolia-fork`
4. Now, in a different terminal window, run `make test`

You will notice everything goes through just fine.

However, observer the CI actions on github, this very same test is failing.
