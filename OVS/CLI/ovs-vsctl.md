ovs-vsctl : dùng để truy vấn và cấu hình ovs-vswitchd
cách sử dụng : 
       ovs-vsctl [options] -- [options] command [args] [-- [options] command [args]]...




Open vSwitch commands:
  init                        khởi tạo database
  show                        hiển thị tổng quan database content 
  emer-reset                  reset cấu hình về clean state
Bridge commands:
  add-br BRIDGE               tạo bridge mới có tên BRIDGE
  add-br BRIDGE PARENT VLAN   create new fake BRIDGE in PARENT on VLAN
  del-br BRIDGE               delete BRIDGE and all of its ports
  list-br                     print the names of all the bridges
  br-exists BRIDGE            exit 2 if BRIDGE does not exist
  br-to-vlan BRIDGE           print the VLAN which BRIDGE is on
  br-to-parent BRIDGE         print the parent of BRIDGE
  br-set-external-id BRIDGE KEY VALUE  set KEY on BRIDGE to VALUE
  br-set-external-id BRIDGE KEY  unset KEY on BRIDGE
  br-get-external-id BRIDGE KEY  print value of KEY on BRIDGE
  br-get-external-id BRIDGE  list key-value pairs on BRIDGE
Port commands (a bond is considered to be a single port):
  list-ports BRIDGE           print the names of all the ports on BRIDGE
  add-port BRIDGE PORT        add network device PORT to BRIDGE
  add-bond BRIDGE PORT IFACE...  add bonded port PORT in BRIDGE from IFACES
  del-port [BRIDGE] PORT      delete PORT (which may be bonded) from BRIDGE
  port-to-br PORT             print name of bridge that contains PORT
Interface commands (a bond consists of multiple interfaces):
  list-ifaces BRIDGE          print the names of all interfaces on BRIDGE
  iface-to-br IFACE           print name of bridge that contains IFACE
Controller commands:
  get-controller BRIDGE      print the controllers for BRIDGE
  del-controller BRIDGE      delete the controllers for BRIDGE
  set-controller BRIDGE TARGET...  set the controllers for BRIDGE
  get-fail-mode BRIDGE       print the fail-mode for BRIDGE
  del-fail-mode BRIDGE       delete the fail-mode for BRIDGE
  set-fail-mode BRIDGE MODE  set the fail-mode for BRIDGE to MODE
Manager commands:
  get-manager                print the managers
  del-manager                delete the managers
  set-manager TARGET...      set the list of managers to TARGET...
SSL commands:
  get-ssl                     print the SSL configuration
  del-ssl                     delete the SSL configuration
  set-ssl PRIV-KEY CERT CA-CERT  set the SSL configuration
Switch commands:
  emer-reset                  reset switch to known good state
Database commands:
  list TBL [REC]              list RECord (or all records) in TBL
  find TBL CONDITION...       list records satisfying CONDITION in TBL
  get TBL REC COL[:KEY]       print values of COLumns in RECord in TBL
  set TBL REC COL[:KEY]=VALUE set COLumn values in RECord in TBL
  add TBL REC COL [KEY=]VALUE add (KEY=)VALUE to COLumn in RECord in TBL
  remove TBL REC COL [KEY=]VALUE  remove (KEY=)VALUE from COLumn
  clear TBL REC COL           clear values from COLumn in RECord in TBL
  create TBL COL[:KEY]=VALUE  create and initialize new record
  destroy TBL REC             delete RECord from TBL
  wait-until TBL REC [COL[:KEY]=VALUE]  wait until condition is true
Potentially unsafe database commands require --force option.
Options:
  --db=DATABASE               connect to DATABASE
                              (default: unix:/ovs/var/run/openvswitch/db.sock)
  --no-wait                   do not wait for ovs-vswitchd to reconfigure
  --retry                     keep trying to connect to server forever
  -t, --timeout=SECS          wait at most SECS seconds for ovs-vswitchd
  --dry-run                   do not commit changes to database
  --oneline                   print exactly one line of output per command
Pica commands:
  set-match-mode MODE:OPTIONS=PRIORITY          set match-modes
  show-match-mode                               print current match-modes
  set-cos-map TRUE|FALSE                        enable or disable cos-mapping
  show-cos-map [IFACE]                          show cos-mapping
  enable-egress-mode TRUE|FALSE                 enable or disable egress-mode
  show-egress-mode                              show egress-mode
  set-combinated-mode TRUE|FALSE                enable or disable combinated-mode
  show-combinated-mode                          show combinated-mode
  set-qe-port-mode normal|half|max              set port-mode
  show-qe-port-mode                             show port-mode
  set-l2gre-key-length                          set l2gre key length
  show-l2gre-key-length                         show l2gre key length
  set-proxy-arp TRUE|FALSE SUBNETS              set proxy arp
  show-proxy-arp                                show proxy arp
  set-l2-mode TRUE|FALSE [TABLE]                set l2 mode
  show-l2-mode                                  show l2 mode
  set-l3-mode TRUE|FALSE [TABLE]                set l3 mode
  show-l3-mode                                  show l3 mode
  set-l2-l3-buffer-mode [0, 5]                  set l2/l3 buffer mode(0-5)
  show-l2-l3-buffer-mode                        show l2/l3 buffer mode
  set-l2-l3-preference TRUE|FALSE               set l2/l3 flow preference
  show-l2-l3-preference                         show l2/l3 flow preference
  set-max-ecmp-ports NUM                        set l3 max ecmp ports to NUM(2~32 and a power of 2)
  show-max-ecmp-ports                           show l3 max ecmp ports
  set-lag-advance-hash-mapping-fields FIELDS    set hash fields of advance hash-mapping
  show-lag-advance-hash-mapping-fields          show hash fields of advance hash-mapping
  set-udf-mode MODE                             set udf mode, MODE's format is udfN(l2|l3,offset=OFS,length=LEN),...
                                                only up to 4 udfs(udf0,udf1,udf2,udf3) are supported
  show-udf-mode                                 show udf mode
Logging options:
  -vSPEC, --verbose=SPEC   set logging levels
  -v, --verbose            set maximum verbosity level
  --log-file[=FILE]        enable logging to specified FILE
                           (default: /ovs/var/log/openvswitch/ovs-vsctl.log)
  --syslog-target=HOST:PORT  also send syslog msgs to HOST:PORT via UDP
  --no-syslog             equivalent to --verbose=vsctl:syslog:warn
Active database connection methods:
  tcp:IP:PORT             PORT at remote IP
  ssl:IP:PORT             SSL PORT at remote IP
  unix:FILE               Unix domain socket named FILE
Passive database connection methods:
  ptcp:PORT[:IP]          listen to TCP PORT on IP
  pssl:PORT[:IP]          listen for SSL on PORT on IP
  punix:FILE              listen on Unix domain socket FILE
PKI configuration (required to use SSL):
  -p, --private-key=FILE  file with private key
  -c, --certificate=FILE  file with certificate for private key
  -C, --ca-cert=FILE      file with peer CA certificate
Other options:
  -h, --help                  display this help message
  -V, --version               display version information
