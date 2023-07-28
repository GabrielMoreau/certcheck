# NAME

certcheck - check certificate chain

# SYNOPSIS

```bash
certcheck check|text
```

# COMMAND

```bash
    certcheck text  cert_base_name.pub.pem
    certcheck check cert_base_name
    certcheck version
    certcheck help
```

The command `certcheck` checks the certificate chain
and takes the certificate name base as input.
The three certificates can take the form:

     cert_base_name.pub.pem
     cert_base_name.key.pem
     cert_base_name.chain.pem

or

     cert_base_name.crt
     cert_base_name.key
     cert_base_name.bundle

With the text subcommand, `certcheck` returns the main values
(lifetime, DNS name...) of the public key.

# AUTHOR

Written by Valentin Hilbig (hilbix https://gist.github.com/hilbix/bde7c02009544faed7a1)
and extended by Gabriel Moreau <Gabriel.Moreau@univ-grenoble-alpes.fr>, Grenoble - France

# COPYRIGHT

Copyright (C) 2015, Valentin Hilbig
Copyright (C) 2023, LEGI UMR 5519 / CNRS UGA G-INP, Grenoble, France

Licence: CC0 (Creative Commons Zero - https://spdx.org/licenses/CC0-1.0)
