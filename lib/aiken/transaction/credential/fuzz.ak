use aiken/fuzz
use aiken/transaction/credential.{
  Address, PaymentCredential, StakeCredential, VerificationKeyCredential,
}

pub type Sample<a> =
  Fuzzer<List<a>>

pub fn address() -> Fuzzer<Address> {
  let payment <- fuzz.map(fuzz.bytearray_between(28, 28))
  Address {
    payment_credential: VerificationKeyCredential(payment),
    stake_credential: None,
  }
}

pub fn address_from(
  payment_credentials: Sample<PaymentCredential>,
  delegation_credentials: Sample<StakeCredential>,
) -> Fuzzer<Address> {
  todo
}
