ovsdb-client: Open vSwitch database JSON-RPC client
usage: ovsdb-client [OPTIONS] COMMAND [ARG...]

Valid commands are:

  list-dbs [SERVER]
    list databases available on SERVER

  get-schema [SERVER] [DATABASE]
    retrieve schema for DATABASE from SERVER

  get-schema-version [SERVER] [DATABASE]
    retrieve schema for DATABASE from SERVER and report only its
    version number on stdout

  get-schema-cksum [SERVER] [DATABASE]
    retrieve schema for DATABASE from SERVER and report only its
    checksum on stdout

  list-tables [SERVER] [DATABASE]
    list tables for DATABASE on SERVER

  list-columns [SERVER] [DATABASE] [TABLE]
    list columns in TABLE (or all tables) in DATABASE on SERVER

  transact [SERVER] TRANSACTION
    run TRANSACTION (params for "transact" request) on SERVER
    and print the results as JSON on stdout

  query [SERVER] TRANSACTION
    run TRANSACTION (params for "transact" request) on SERVER,
    as read-only, and print the results as JSON on stdout

  monitor [SERVER] [DATABASE] TABLE [COLUMN,...]...
    monitor contents of COLUMNs in TABLE in DATABASE on SERVER.
    COLUMNs may include !initial, !insert, !delete, !modify
    to avoid seeing the specified kinds of changes.

  monitor-cond [SERVER] [DATABASE] CONDITION TABLE [COLUMN,...]...
    monitor contents that match CONDITION of COLUMNs in TABLE in
    DATABASE on SERVER.
    COLUMNs may include !initial, !insert, !delete, !modify
    to avoid seeing the specified kinds of changes.

  convert [SERVER] SCHEMA
    convert database on SERVER named in SCHEMA to SCHEMA.

  needs-conversion [SERVER] SCHEMA
    tests whether SCHEMA's db on SERVER needs conversion.

  monitor [SERVER] [DATABASE] ALL
    monitor all changes to all columns in all tables

  wait [SERVER] DATABASE STATE
    wait until DATABASE reaches STATE ("added" or "connected" or "removed")
    in DATBASE on SERVER.

  dump [SERVER] [DATABASE]
    dump contents of DATABASE on SERVER to stdout

  backup [SERVER] [DATABASE] > SNAPSHOT
    dump database contents in the form of a database file

  [--force] restore [SERVER] [DATABASE] < SNAPSHOT
    restore database contents from a database file

  lock [SERVER] LOCK
    create or wait for LOCK in SERVER

  steal [SERVER] LOCK
    steal LOCK from SERVER

  unlock [SERVER] LOCK
    unlock LOCK from SERVER

The default SERVER is unix:/var/run/openvswitch/db.sock.
The default DATABASE is Open_vSwitch.

Active SERVER connection methods:
  tcp:IP:PORT             PORT at remote IP
  ssl:IP:PORT             SSL PORT at remote IP
  unix:FILE               Unix domain socket named FILE
Passive SERVER connection methods:
  ptcp:PORT[:IP]          listen to TCP PORT on IP
  pssl:PORT[:IP]          listen for SSL on PORT on IP
  punix:FILE              listen on Unix domain socket FILE
PKI configuration (required to use SSL):
  -p, --private-key=FILE  file with private key
  -c, --certificate=FILE  file with certificate for private key
  -C, --ca-cert=FILE      file with peer CA certificate
  --bootstrap-ca-cert=FILE  file with peer CA certificate to read or create
SSL options:
  --ssl-protocols=PROTOS  list of SSL protocols to enable
  --ssl-ciphers=CIPHERS   list of SSL ciphers to enable

Output formatting options:
  -f, --format=FORMAT         set output formatting to FORMAT
                              ("table", "html", "csv", or "json")
  -d, --data=FORMAT           set table cell output formatting to
                              FORMAT ("string", "bare", or "json")
  --no-headings               omit table heading row
  --pretty                    pretty-print JSON in output
  --bare                      equivalent to "--format=list --data=bare --no-headings"
  --timestamp                 timestamp "monitor" output
Daemon options:
  --detach                run in background as daemon
  --monitor               creates a process to monitor this daemon
  --user=username[:group] changes the effective daemon user:group
  --no-chdir              do not chdir to '/'
  --pidfile[=FILE]        create pidfile (default: /var/run/openvswitch/ovsdb-client.pid)
  --overwrite-pidfile     with --pidfile, start even if already running

Logging options:
  -vSPEC, --verbose=SPEC   set logging levels
  -v, --verbose            set maximum verbosity level
  --log-file[=FILE]        enable logging to specified FILE
                           (default: /var/log/openvswitch/ovsdb-client.log)
  --syslog-method=(libc|unix:file|udp:ip:port)
                           specify how to send messages to syslog daemon
  --syslog-target=HOST:PORT  also send syslog msgs to HOST:PORT via UDP

Other options:
  -h, --help                  display this help message
  -V, --version               display version information
