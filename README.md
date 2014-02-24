sketchy-overflow
================

Sketchy overflow, the place to post your sketchy questions

# Encryption
Sketchy Overflow uses SHA512 to hash user's usernames into the database.

User names are never publicly displayed or stored on the server.

This is to protect users from exposing usernames that might lead to their capture (such as Dread Pirate Robert (DPR) from Silk Road).

We also use SCrypt encryption to protect user passwords. We chose SCrypt over BCrypt because SCrypt is more secure against hardware brute force attacks than BCrypt.

![](https://github.com/tarcieri/scrypt/raw/modern-readme/kdf-comparison.png)
