#! /bin/bash
dropdb typix_development
createdb typix_development
psql -d typix_development -f dump.sql
