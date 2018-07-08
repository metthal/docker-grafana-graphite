{
  port: 8125,
  mgmt_port: 8126,

  percentThreshold: [ 50, 75, 90, 95, 98, 99, 99.9, 99.99, 99.999],

  graphitePort: 2003,
  graphiteHost: "127.0.0.1",
  flushInterval: ${STATSD_FLUSH_INTERVAL},

  backends: ['./backends/graphite'],
  graphite: {
    legacyNamespace: false,
    globalPrefix: '${STATSD_GRAPHITE_PREFIX}',
    prefixCounter: '${STATSD_GRAPHITE_PREFIX_COUNTER}',
    prefixTimer: '${STATSD_GRAPHITE_PREFIX_TIMER}',
    prefixGauge: '${STATSD_GRAPHITE_PREFIX_GAUGE}',
    prefixSet: '${STATSD_GRAPHITE_PREFIX_SET}'
  }
}
