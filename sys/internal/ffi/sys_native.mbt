// Copyright 2024 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
fn internal_get_cli_args() -> FixedArray[Bytes] = "$moonbit.get_cli_args"

///|
pub fn get_cli_args() -> Array[String] {
  Array::from_fixed_array(
    internal_get_cli_args().map(fn {
      // Here we assume that the CLI arguments are encoded in well-formed UTF-8.
      // TODO: Handle other encodings.
      arg => @encoding.decode_strict(UTF8, arg).to_string?().unwrap()
    }),
  )
}

///|
pub fn get_env_vars() -> Map[String, String] {
  // not implement yet
  panic()
}

///|
pub fn set_env_var(_key : String, _value : String) -> Unit {
  // not implement yet
  panic()
}

///|
pub extern "native" fn exit(code : Int) -> Unit = "exit"
