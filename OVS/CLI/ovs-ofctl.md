ovs-ofctl: OpenFlow switch management utility
usage: ovs-ofctl [OPTIONS] COMMAND [ARG...]
For OpenFlow switches:
  show SWITCH                 show OpenFlow information
  dump-desc SWITCH            print switch description
  dump-tables SWITCH          print table stats
  dump-table-features SWITCH  print table features
  mod-port SWITCH IFACE ACT   modify port behavior
  mod-table SWITCH MOD        modify flow table behavior
  get-frags SWITCH            print fragment handling behavior
  set-frags SWITCH FRAG_MODE  set fragment handling behavior
  dump-ports SWITCH [PORT]    print port statistics
  dump-ports-desc SWITCH [PORT]  print port descriptions
  dump-flows SWITCH           print all flow entries
  dump-flows SWITCH FLOW      print matching FLOWs
  dump-aggregate SWITCH       print aggregate flow statistics
  dump-aggregate SWITCH FLOW  print aggregate stats for FLOWs
  queue-stats SWITCH [PORT [QUEUE]]  dump queue stats
  add-flow SWITCH FLOW        add flow described by FLOW
  add-flows SWITCH FILE       add flows from FILE
  mod-flows SWITCH FLOW       modify actions of matching FLOWs
  del-flows SWITCH [FLOW]     delete matching FLOWs
  replace-flows SWITCH FILE   replace flows with those in FILE
  diff-flows SOURCE1 SOURCE2  compare flows from two sources
  packet-out SWITCH IN_PORT ACTIONS PACKET...
                              execute ACTIONS on PACKET
  monitor SWITCH [MISSLEN] [invalid_ttl] [watch:[...]]
                              print packets received from SWITCH
  snoop SWITCH                snoop on SWITCH and its controller
  add-group SWITCH GROUP      add group described by GROUP
  add-groups SWITCH FILE       add group from FILE
  mod-group SWITCH GROUP      modify specific group
  del-groups SWITCH [GROUP]   delete matching GROUPs
  dump-group-features SWITCH  print group features
  dump-groups SWITCH [GROUP]  print group description
  dump-group-stats SWITCH [GROUP]  print group statistics
  queue-get-config SWITCH PORT  print queue information for port
  add-meter SWITCH METER      add meter described by METER
  mod-meter SWITCH METER      modify specific METER
  del-meter SWITCH METER      delete METER
  del-meters SWITCH           delete all meters
  dump-meter SWITCH METER     print METER configuration
  dump-meters SWITCH          print all meter configuration
  meter-stats SWITCH [METER]  print meter statistics
  meter-features SWITCH       print meter features
For OpenFlow switches and controllers:
  probe TARGET                probe whether TARGET is up
  ping TARGET [N]             latency of N-byte echos
  benchmark TARGET N COUNT    bandwidth of COUNT N-byte echos
SWITCH or TARGET is an active OpenFlow connection method.
Other commands:
  ofp-parse FILE              print messages read from FILE
  mod-temp-thresh SWITCH THRESHOLD  modify temperature threshold
  dump-temp-thresh SWITCH     print temperature threshold
  ofp-parse-pcap PCAP         print OpenFlow read from PCAP
  dump-tables-desc SWITCH     print tables description
  bundle SWITCH MSG           send bundle messages
Active OpenFlow connection methods:
  tcp:IP[:PORT]           PORT (default: 6633) at remote IP
  ssl:IP[:PORT]           SSL PORT (default: 6633) at remote IP
  unix:FILE               Unix domain socket named FILE
PKI configuration (required to use SSL):
  -p, --private-key=FILE  file with private key
  -c, --certificate=FILE  file with certificate for private key
  -C, --ca-cert=FILE      file with peer CA certificate
Daemon options:
  --detach                run in background as daemon
  --no-chdir              do not chdir to '/'
  --pidfile[=FILE]        create pidfile (default: /ovs/var/run/openvswitch/ovs-ofctl.pid)
  --overwrite-pidfile     with --pidfile, start even if already running
OpenFlow version options:
  -V, --version           display version information
  -O, --protocols         set allowed OpenFlow versions
                          (default: OpenFlow10, OpenFlow11, OpenFlow12, OpenFlow13, OpenFlow14)
Logging options:
  -vSPEC, --verbose=SPEC   set logging levels
  -v, --verbose            set maximum verbosity level
  --log-file[=FILE]        enable logging to specified FILE
                           (default: /ovs/var/log/openvswitch/ovs-ofctl.log)
  --syslog-target=HOST:PORT  also send syslog msgs to HOST:PORT via UDP
Other options:
  --strict                    use strict match for flow commands
  --readd                     replace flows that haven't changed
  -F, --flow-format=FORMAT    force particular flow format
  -P, --packet-in-format=FRMT force particular packet in format
  -m, --more                  be more verbose printing OpenFlow
  --timestamp                 (monitor, snoop) print timestamps
  -t, --timeout=SECS          give up after SECS seconds
  --sort[=field]              sort in ascending order
  --rsort[=field]             sort in descending order
  --unixctl=SOCKET            set control socket name
  -h, --help                  display this help message
  -V, --version               display version information
