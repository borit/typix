#! /bin/bash
postgres -D /usr/local/var/postgres/ &
rails s
