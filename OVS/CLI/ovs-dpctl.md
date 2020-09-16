ovs-dpctl: Open vSwitch datapath management utility
usage: ovs-dpctl [OPTIONS] COMMAND [ARG...]
  add-dp DP [IFACE...]     add new datapath DP (with IFACEs)
  del-dp DP                delete local datapath DP
  add-if DP IFACE...       add each IFACE as a port on DP
  set-if DP IFACE...       reconfigure each IFACE within DP
  del-if DP IFACE...       delete each IFACE from DP
  dump-dps                 display names of all datapaths
  show                     show basic info on all datapaths
  show DP...               show basic info on each DP
  dump-flows [DP]          display flows in DP
  add-flow [DP] FLOW ACTIONS add FLOW with ACTIONS to DP
  mod-flow [DP] FLOW ACTIONS change FLOW actions to ACTIONS in DP
  get-flow [DP] ufid:UFID    fetch flow corresponding to UFID
  del-flow [DP] FLOW         delete FLOW from DP
  del-flows [DP]             delete all flows from DP
  dump-conntrack [DP] [zone=ZONE]  display conntrack entries for ZONE
  flush-conntrack [DP] [zone=ZONE] [ct-tuple]delete matched conntrack entries in ZONE
  ct-stats-show [DP] [zone=ZONE] [verbose] CT connections grouped by protocol
  ct-bkts [DP] [gt=N] display connections per CT bucket
Each IFACE on add-dp, add-if, and set-if may be followed by
comma-separated options.  See ovs-dpctl(8) for syntax, or the
Interface table in ovs-vswitchd.conf.db(5) for an options list.
For COMMAND dump-flows, add-flow, mod-flow, del-flow and
del-flows, DP is optional if there is only one datapath.

Logging options:
  -vSPEC, --verbose=SPEC   set logging levels
  -v, --verbose            set maximum verbosity level
  --log-file[=FILE]        enable logging to specified FILE
                           (default: /var/log/openvswitch/ovs-dpctl.log)
  --syslog-method=(libc|unix:file|udp:ip:port)
                           specify how to send messages to syslog daemon
  --syslog-target=HOST:PORT  also send syslog msgs to HOST:PORT via UDP

Options for show and mod-flow:
  -s,  --statistics           print statistics for port or flow

Options for dump-flows:
  -m, --more                  increase verbosity of output
  --names                     use port names in output

Options for mod-flow:
  --may-create                create flow if it doesn't exist
  --read-only                 do not run read/write commands
  --clear                     reset existing stats to zero

Other options:
  -t, --timeout=SECS          give up after SECS seconds
  -h, --help                  display this help message
  -V, --version               display version information
