import pytest

@pytest.fixture(scope="session")
def alice(accounts):
    accounts[0].balance += 1000000000000000000
    return accounts[0]

@pytest.fixture(scope="function")
def safe_wallets(alice, project):
    rental_factory = project.RentalFactory.at(
        "0x2c2BBA22aA19Ba34bC5BA65e6c35Ce54DA36A33D"
    )
    receipt_alice = rental_factory.deployRentalSafe(
        alice.address, sender=alice
    )
    alice_safe = receipt_alice.decode_logs()[-1].safe
    return alice_safe
