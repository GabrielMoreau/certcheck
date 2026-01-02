# NAME

certcheck - check certificate chain or self-signed

# SYNOPSIS

```bash
 certcheck check [--base|-b certbase] [--pub|-p certbase.pub.pem] [--key|-k certbase.key.pem] [--chain|-c certbase.chain.pem]
 certcheck text  [--base|-b certbase] [--pub|-p certbase.pub.pem]
 certcheck txt   [--base|-b certbase] [--pub|-p certbase.pub.pem]
 certcheck info  [--base|-b certbase] [--pub|-p certbase.pub.pem]
 certcheck text  [--sort|-s] certbase1.pub.pem certbase2.pub.pem certbase*.pub.pem
 certcheck txt   [--sort|-s] certbase1.pub.pem certbase2.pub.pem certbase*.pub.pem
 certcheck info  [--sort|-s] certbase1.pub.pem certbase2.pub.pem certbase*.pub.pem
 certcheck version
 certcheck help
```

# COMMAND

```bash
certcheck text  --pub certbase.pub.pem
certcheck check --base certbase
certcheck version
certcheck help
```

The command `certcheck` checks the certificate chain
and takes the certificate name base as input.
The three certificates can take the form:

     public:  certbase.pub.pem    certbase.crt     certbase.cer
     private: certbase.key.pem    certbase.key     certbase.keystore
     chain:   certbase.chain.pem  certbase.bundle  certbase.ca-bundle

With the text subcommand, `certcheck` returns the main values
(lifetime, DNS name...) of the public key.

# SEE ALSO

Own project ressources:

* [Web site (Gitlab)](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/certcheck)
* [Online Manual](https://legi.gricad-pages.univ-grenoble-alpes.fr/soft/trokata/certcheck/certcheck.html)
* [Download package (Debian)](https://legi.gricad-pages.univ-grenoble-alpes.fr/soft/trokata/certcheck/download/)

Note: The master Git repository in on the [GRICAD Gitlab](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/certcheck).
Other Git repository are mirror or fork.

# AUTHOR

Written by Valentin Hilbig (hilbix https://gist.github.com/hilbix/bde7c02009544faed7a1)
and extended by Gabriel Moreau <Gabriel.Moreau@univ-grenoble-alpes.fr>, Grenoble - France

# COPYRIGHT

* Copyright (C) 2015, Valentin Hilbig
* Copyright (C) 2023-2026, LEGI UMR 5519 / CNRS UGA G-INP, Grenoble, France

Licence: CC0 (Creative Commons Zero - https://spdx.org/licenses/CC0-1.0)
