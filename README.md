sketchy-overflow
================

Sketchy overflow, the place to post your sketchy questions

# Encryption

Why use encryption at all: (from bcrypt docs)
If you store user passwords in the clear, then an attacker who steals a copy of your database has a giant list of emails and passwords. Some of your users will only have one password — for their email account, for their banking account, for your application. A simple hack could escalate into massive identity theft.

Sketchy Overflow uses SHA512 to hash user's usernames into the database.

User names are never publicly displayed or stored on the server.

This is to protect users from exposing usernames that might lead to their capture (such as Dread Pirate Robert (DPR) from Silk Road).

We also use SCrypt encryption to protect user passwords. We chose SCrypt over BCrypt because SCrypt is more secure against hardware brute force attacks than BCrypt.

![](https://github.com/tarcieri/scrypt/raw/modern-readme/kdf-comparison.png)  
  
"The designers of scrypt estimate that on modern (2009) hardware, if 5 seconds are spent computing a derived key, the cost of a hardware brute-force attack against scrypt is roughly 4000 times greater than the cost of a similar attack against bcrypt (to find the same password), and 20000 times greater than a similar attack against PBKDF2."  

## About SCrypt
Password.create takes three options which will determine the cost limits of the computation.

:max_time specifies the maximum number of seconds the computation should take.
:max_mem specifies the maximum number of bytes the computation should take. A value of 0 specifies no upper limit. The minimum is always 1 MB.
:max_memfrac specifies the maximum memory in a fraction of available resources to use. Any value equal to 0 or greater than 0.5 will result in 0.5 being used.
Default options will result in calculation time of approx. 200 ms with 1 MB memory use.

Sketchy Overflow uses: (typically, do not disclose your encryption scheme publicly)
a max_time of 2 seconds,
salt_size of 32 bytes,
a max_mem limit of 0.5 of available resources,
key length of 4096 bits (512 bytes).

## Example of just how unsafe SHA can be for password hashing:
```ruby
require 'digest'
Digest::SHA512.hexdigest("hello")
=> "9b71d224bd62f3785d96d46ad3ea3d73319bfbc2890caadae2dff72519673ca72323c3d99ba5c11d7c7acc6e14b8c5da0c4663475c2e5c3adef46f73bcdec043"
```
Go to http://www.crackstation.net and paste that hash in.

Yup, easily cracked.

![](http://i7.minus.com/i6ibKx1P2GrBR.png)  

SHA can be made safer by adding a salt that is the same size as the output string of the SHA implementation you're using. However, SHA was developed by the NSA, so keep that in mind.


