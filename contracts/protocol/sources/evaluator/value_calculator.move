module protocol::value_calculator {
  
  use sui::math;
  use std::fixed_point32::{Self, FixedPoint32};
  use 0xad013d5fde39e15eabda32b3dbdafd67dac32b798ce63237c27a8f73339b9b6f::fixed_point32_empower;
  
  public fun usd_value(price: FixedPoint32, amount: u64, decimals: u8): FixedPoint32 {
    let amount_with_decimals = fixed_point32::create_from_rational(amount, math::pow(10, decimals));
    fixed_point32_empower::mul(price, amount_with_decimals)
  }
}
