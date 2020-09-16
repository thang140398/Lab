ovsdb-tool: Open vSwitch database management utility
usage: ovsdb-tool [OPTIONS] COMMAND [ARG...]
  create [DB [SCHEMA]]    create DB with the given SCHEMA
  create-cluster DB CONTENTS LOCAL
    create clustered DB with given CONTENTS and LOCAL address
  [--cid=UUID] join-cluster DB NAME LOCAL REMOTE...
    join clustered DB with given NAME and LOCAL and REMOTE addrs
  compact [DB [DST]]      compact DB in-place (or to DST)
  convert [DB [SCHEMA [DST]]]   convert DB to SCHEMA (to DST)
  db-name [DB]            report name of schema used by DB
  db-version [DB]         report version of schema used by DB
  db-cksum [DB]           report checksum of schema used by DB
  db-cid DB               report cluster ID of clustered DB
  db-sid DB               report server ID of clustered DB
  db-local-address DB     report local address of clustered DB
  db-is-clustered DB      test whether DB is clustered
  db-is-standalone DB     test whether DB is standalone
  schema-name [SCHEMA]    report SCHEMA's name
  schema-version [SCHEMA] report SCHEMA's schema version
  schema-cksum [SCHEMA]   report SCHEMA's checksum
  compare-versions A OP B  compare OVSDB schema version numbers
  query [DB] TRNS         execute read-only transaction on DB
  transact [DB] TRNS      execute read/write transaction on DB
  [-m]... show-log [DB]   print DB's log entries
The default DB is /etc/openvswitch/conf.db.
The default SCHEMA is /usr/share/openvswitch/vswitch.ovsschema.

Logging options:
  -vSPEC, --verbose=SPEC   set logging levels
  -v, --verbose            set maximum verbosity level
  --log-file[=FILE]        enable logging to specified FILE
                           (default: /var/log/openvswitch/ovsdb-tool.log)
  --syslog-method=(libc|unix:file|udp:ip:port)
                           specify how to send messages to syslog daemon
  --syslog-target=HOST:PORT  also send syslog msgs to HOST:PORT via UDP

Other options:
  -m, --more                  increase show-log verbosity
  --rbac-role=ROLE            RBAC role for transact and query commands
  -h, --help                  display this help message
  -V, --version               display version information
