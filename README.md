## Challenge

AUTOMATICALLY FILL OUT ADDRESSES

We currently have a form which allows our users to fill out their address:

We want these fields to be pre-populated depending on the data the user enters.

On https://data.public.lu/en/datasets/registre-national-des-localites-et-des-rues/ you find the "caclr.zip" file which includes all the addresses in Luxembourg.

## Specifications

- [ ] Import the addresses into a database
- [ ] Modify the form so the City is a select box. When the user enters a Postal code, the City select values change depending on the Postal Code entered.
- [ ] Modify the form so the Street is a select box. When the user selects a City, the Street select values change depending on the City selected.
- [ ] Modify the form so the Number is a select box. When the user selects a Street, the Number select values change depending on the Street selected.
- [ ] New Rails 6.1 or 7 application
- [ ] Postgres database
- [ ] Stimulus (JavaScript)

## Setup Ruby (only if you have not installed)

This project uses [asdf](https://asdf-vm.com/#/). \
Follow the installation [instructions](https://asdf-vm.com/#/core-manage-asdf?id=asdf)

After installation you need to follow these steps:

```bash
# Add ruby plugin on asdf
$ asdf plugin add ruby

# Install ruby plugin
$ asdf install ruby 3.0.3

# Set the default ruby for the project
$ asdf local ruby 3.0.3
```

## Setup Project

```bash
# install bundler
$ gem install bundler

# run bundle to install gems
$ bundle
```

