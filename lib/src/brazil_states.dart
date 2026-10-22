import 'package:flutter/foundation.dart';

/// One of Brazil's 27 federative units. The plate does not print it; the
/// series implies it, see [BrazilSeries.stateOf].
@immutable
class BrazilState {
  const BrazilState(this.code, this.name);

  /// The two-letter UF abbreviation.
  final String code;
  final String name;

  static const BrazilState ac = BrazilState('AC', 'Acre');
  static const BrazilState al = BrazilState('AL', 'Alagoas');
  static const BrazilState ap = BrazilState('AP', 'Amapá');
  static const BrazilState am = BrazilState('AM', 'Amazonas');
  static const BrazilState ba = BrazilState('BA', 'Bahia');
  static const BrazilState ce = BrazilState('CE', 'Ceará');
  static const BrazilState df = BrazilState('DF', 'Distrito Federal');
  static const BrazilState es = BrazilState('ES', 'Espírito Santo');
  static const BrazilState go = BrazilState('GO', 'Goiás');
  static const BrazilState ma = BrazilState('MA', 'Maranhão');
  static const BrazilState mt = BrazilState('MT', 'Mato Grosso');
  static const BrazilState ms = BrazilState('MS', 'Mato Grosso do Sul');
  static const BrazilState mg = BrazilState('MG', 'Minas Gerais');
  static const BrazilState pa = BrazilState('PA', 'Pará');
  static const BrazilState pb = BrazilState('PB', 'Paraíba');
  static const BrazilState pr = BrazilState('PR', 'Paraná');
  static const BrazilState pe = BrazilState('PE', 'Pernambuco');
  static const BrazilState pi = BrazilState('PI', 'Piauí');
  static const BrazilState rj = BrazilState('RJ', 'Rio de Janeiro');
  static const BrazilState rn = BrazilState('RN', 'Rio Grande do Norte');
  static const BrazilState rs = BrazilState('RS', 'Rio Grande do Sul');
  static const BrazilState ro = BrazilState('RO', 'Rondônia');
  static const BrazilState rr = BrazilState('RR', 'Roraima');
  static const BrazilState sc = BrazilState('SC', 'Santa Catarina');
  static const BrazilState sp = BrazilState('SP', 'São Paulo');
  static const BrazilState se = BrazilState('SE', 'Sergipe');
  static const BrazilState to = BrazilState('TO', 'Tocantins');

  static const List<BrazilState> values = <BrazilState>[
    ac,
    al,
    ap,
    am,
    ba,
    ce,
    df,
    es,
    go,
    ma,
    mt,
    ms,
    mg,
    pa,
    pb,
    pr,
    pe,
    pi,
    rj,
    rn,
    rs,
    ro,
    rr,
    sc,
    sp,
    se,
    to,
  ];

  @override
  String toString() => code;
}

/// Which state a series was issued to.
abstract final class BrazilSeries {
  /// The state whose block contains [value], a full `LLLNLNN` registration,
  /// or null for a series not yet allocated (or a malformed value).
  ///
  /// Informational: a plate from an unallocated series is not invalid.
  static BrazilState? stateOf(String value) {
    if (value.length != 7) return null;
    int lo = 0;
    int hi = _ranges.length - 1;
    while (lo <= hi) {
      final int mid = (lo + hi) >> 1;
      final (String first, String last, BrazilState state) = _ranges[mid];
      if (value.compareTo(first) < 0) {
        hi = mid - 1;
      } else if (value.compareTo(last) > 0) {
        lo = mid + 1;
      } else {
        return state;
      }
    }
    return null;
  }

  /// Inclusive, sorted, non-overlapping blocks, from the article's
  /// "Vertical distribution of sequences in alphabetical order" table as of
  /// January 2026. Rows marked "sequence not allocated yet" are left out.
  /// Every position compares in its own class (digits below letters in
  /// ASCII, but a position never mixes them), so string order is plate order.
  static const List<(String, String, BrazilState)> _ranges = <(String, String, BrazilState)>[
    ('AAA0A00', 'BEZ9Z99', BrazilState.pr),
    ('BFA0A00', 'GKI9Z99', BrazilState.sp),
    ('GKJ0A00', 'HOK9Z99', BrazilState.mg),
    ('HOL0A00', 'HQE9Z99', BrazilState.ma),
    ('HQF0A00', 'HTW9Z99', BrazilState.ms),
    ('HTX0A00', 'HZA9Z99', BrazilState.ce),
    ('HZB0A00', 'IAP9Z99', BrazilState.se),
    ('IAQ0A00', 'JDO9Z99', BrazilState.rs),
    ('JDP0A00', 'JKR9Z99', BrazilState.df),
    ('JKS0A00', 'JSZ9Z99', BrazilState.ba),
    ('JTA0A00', 'JWE9Z99', BrazilState.pa),
    ('JWF0A00', 'JXY9Z99', BrazilState.am),
    ('JXZ0A00', 'KAU9Z99', BrazilState.mt),
    ('KAV0A00', 'KFC9Z99', BrazilState.go),
    ('KFD0A00', 'KME9Z99', BrazilState.pe),
    ('KMF0A00', 'LVE9Z99', BrazilState.rj),
    ('LVF0A00', 'LWQ9Z99', BrazilState.pi),
    ('LWR0A00', 'MMM9Z99', BrazilState.sc),
    ('MMN0A00', 'MOW9Z99', BrazilState.pb),
    ('MOX0A00', 'MTZ9Z99', BrazilState.es),
    ('MUA0A00', 'MVK9Z99', BrazilState.al),
    ('MVL0A00', 'MXG9Z99', BrazilState.to),
    ('MXH0A00', 'MZM9Z99', BrazilState.rn),
    ('MZN0A00', 'NAG9Z99', BrazilState.ac),
    ('NAH0A00', 'NBA9Z99', BrazilState.rr),
    ('NBB0A00', 'NEH9Z99', BrazilState.ro),
    ('NEI0A00', 'NFB9Z99', BrazilState.ap),
    ('NFC0A00', 'NGZ9Z99', BrazilState.go),
    ('NHA0A00', 'NHT9Z99', BrazilState.ma),
    ('NHU0A00', 'NIX9Z99', BrazilState.pi),
    ('NIY0A00', 'NJW9Z99', BrazilState.mt),
    ('NJX0A00', 'NLU9Z99', BrazilState.go),
    ('NLV0A00', 'NMO9Z99', BrazilState.al),
    ('NMP0A00', 'NNI9Z99', BrazilState.ma),
    ('NNJ0A00', 'NOH9Z99', BrazilState.rn),
    ('NOI0A00', 'NPB9Z99', BrazilState.am),
    ('NPC0A00', 'NPQ9Z99', BrazilState.mt),
    ('NPR0A00', 'NQK9Z99', BrazilState.pb),
    ('NQL0A00', 'NRE9Z99', BrazilState.ce),
    ('NRF0A00', 'NSD9Z99', BrazilState.ms),
    ('NSE0A00', 'NTC9Z99', BrazilState.pa),
    ('NTD0A00', 'NTW9Z99', BrazilState.ba),
    ('NTX0A00', 'NUG9Z99', BrazilState.mt),
    ('NUH0A00', 'NUL9Z99', BrazilState.rr),
    ('NUM0A00', 'NVF9Z99', BrazilState.ce),
    ('NVG0A00', 'NVN9Z99', BrazilState.se),
    ('NVO0A00', 'NWR9Z99', BrazilState.go),
    ('NWS0A00', 'NXQ9Z99', BrazilState.ma),
    ('NXR0A00', 'NXT9Z99', BrazilState.ac),
    ('NXU0A00', 'NXW9Z99', BrazilState.pe),
    ('NXX0A00', 'NYG9Z99', BrazilState.mg),
    ('NYH0A00', 'NZZ9Z99', BrazilState.ba),
    ('OAA0A00', 'OAO9Z99', BrazilState.am),
    ('OAP0A00', 'OBS9Z99', BrazilState.mt),
    ('OBT0A00', 'OCA9Z99', BrazilState.pa),
    ('OCB0A00', 'OCU9Z99', BrazilState.ce),
    ('OCV0A00', 'ODT9Z99', BrazilState.es),
    ('ODU0A00', 'OEI9Z99', BrazilState.pi),
    ('OEJ0A00', 'OES9Z99', BrazilState.se),
    ('OET0A00', 'OFH9Z99', BrazilState.pb),
    ('OFI0A00', 'OFW9Z99', BrazilState.pa),
    ('OFX0A00', 'OGG9Z99', BrazilState.pb),
    ('OGH0A00', 'OHA9Z99', BrazilState.go),
    ('OHB0A00', 'OHK9Z99', BrazilState.al),
    ('OHL0A00', 'OHW9Z99', BrazilState.ro),
    ('OHX0A00', 'OIQ9Z99', BrazilState.ce),
    ('OIR0A00', 'OJQ9Z99', BrazilState.ma),
    ('OJR0A00', 'OKC9Z99', BrazilState.rn),
    ('OKD0A00', 'OKH9Z99', BrazilState.sc),
    ('OKI0A00', 'OLG9Z99', BrazilState.ba),
    ('OLH0A00', 'OLN9Z99', BrazilState.to),
    ('OLO0A00', 'OMH9Z99', BrazilState.mg),
    ('OMI0A00', 'OOF9Z99', BrazilState.go),
    ('OOG0A00', 'OOU9Z99', BrazilState.ms),
    ('OOV0A00', 'ORC9Z99', BrazilState.mg),
    ('ORD0A00', 'ORM9Z99', BrazilState.al),
    ('ORN0A00', 'OSV9Z99', BrazilState.ce),
    ('OSW0A00', 'OTZ9Z99', BrazilState.pa),
    ('OUA0A00', 'OUE9Z99', BrazilState.pi),
    ('OUF0A00', 'OVD9Z99', BrazilState.ba),
    ('OVE0A00', 'OVF9Z99', BrazilState.es),
    ('OVG0A00', 'OVG9Z99', BrazilState.ac),
    ('OVH0A00', 'OVL9Z99', BrazilState.es),
    ('OVM0A00', 'OVV9Z99', BrazilState.df),
    ('OVW0A00', 'OVY9Z99', BrazilState.pi),
    ('OVZ0A00', 'OWG9Z99', BrazilState.rn),
    ('OWH0A00', 'OXK9Z99', BrazilState.mg),
    ('OXL0A00', 'OXL9Z99', BrazilState.ro),
    ('OXM0A00', 'OXM9Z99', BrazilState.am),
    ('OXN0A00', 'OXN9Z99', BrazilState.al),
    ('OXO0A00', 'OXO9Z99', BrazilState.pb),
    ('OXP0A00', 'OXP9Z99', BrazilState.ac),
    ('OXQ0A00', 'OXZ9Z99', BrazilState.ma),
    ('OYA0A00', 'OYC9Z99', BrazilState.to),
    ('OYD0A00', 'OYK9Z99', BrazilState.es),
    ('OYL0A00', 'OYZ9Z99', BrazilState.pe),
    ('OZA0A00', 'OZA9Z99', BrazilState.ce),
    ('OZB0A00', 'OZB9Z99', BrazilState.se),
    ('OZC0A00', 'OZV9Z99', BrazilState.ba),
    ('OZW0A00', 'PBZ9Z99', BrazilState.df),
    ('PCA0A00', 'PED9Z99', BrazilState.pe),
    ('PEE0A00', 'PFQ9Z99', BrazilState.pe),
    ('PFR0A00', 'PGK9Z99', BrazilState.pe),
    ('PGL0A00', 'PGU9Z99', BrazilState.pe),
    ('PGV0A00', 'PGZ9Z99', BrazilState.pe),
    ('PHA0A00', 'PHZ9Z99', BrazilState.am),
    ('PIA0A00', 'PIZ9Z99', BrazilState.pi),
    ('PJA0A00', 'PLZ9Z99', BrazilState.ba),
    ('PMA0A00', 'POZ9Z99', BrazilState.ce),
    ('PPA0A00', 'PPZ9Z99', BrazilState.es),
    ('PQA0A00', 'PRZ9Z99', BrazilState.go),
    ('PSA0A00', 'PTZ9Z99', BrazilState.ma),
    ('PUA0A00', 'PZZ9Z99', BrazilState.mg),
    ('QAA0A00', 'QAZ9Z99', BrazilState.ms),
    ('QBA0A00', 'QCZ9Z99', BrazilState.mt),
    ('QDA0A00', 'QEZ9Z99', BrazilState.pa),
    ('QFA0A00', 'QFZ9Z99', BrazilState.pb),
    ('QGA0A00', 'QGZ9Z99', BrazilState.rn),
    ('QHA0A00', 'QJZ9Z99', BrazilState.sc),
    ('QKA0A00', 'QKM9Z99', BrazilState.to),
    ('QKN0A00', 'QKZ9Z99', BrazilState.se),
    ('QLA0A00', 'QLM9Z99', BrazilState.al),
    ('QLN0A00', 'QLT9Z99', BrazilState.ap),
    ('QLU0A00', 'QLZ9Z99', BrazilState.ac),
    ('QMA0A00', 'QMP9Z99', BrazilState.se),
    ('QMQ0A00', 'QQZ9Z99', BrazilState.mg),
    ('QRA0A00', 'QRA9Z99', BrazilState.ro),
    ('QRB0A00', 'QRM9Z99', BrazilState.es),
    ('QRN0A00', 'QRZ9Z99', BrazilState.pi),
    ('QSA0A00', 'QSM9Z99', BrazilState.pb),
    ('QSN0A00', 'QSZ9Z99', BrazilState.sp),
    ('QTA0A00', 'QTJ9Z99', BrazilState.ro),
    ('QTK0A00', 'QTM9Z99', BrazilState.sc),
    ('QTN0A00', 'QTS9Z99', BrazilState.go),
    ('QTT0A00', 'QTT9Z99', BrazilState.al),
    ('QTU0A00', 'QTZ9Z99', BrazilState.ba),
    ('QUA0A00', 'QUZ9Z99', BrazilState.mg),
    ('QVA0A00', 'QVZ9Z99', BrazilState.pa),
    ('QWA0A00', 'QWF9Z99', BrazilState.to),
    ('QWG0A00', 'QWL9Z99', BrazilState.al),
    ('QWM0A00', 'QWQ9Z99', BrazilState.ac),
    ('QWR0A00', 'QXZ9Z99', BrazilState.mg),
    ('QYA0A00', 'QYZ9Z99', BrazilState.pe),
    ('QZA0A00', 'QZZ9Z99', BrazilState.am),
    ('RAA0A00', 'RAJ9Z99', BrazilState.sc),
    ('RAK0A00', 'RAZ9Z99', BrazilState.mt),
    ('RBA0A00', 'RBJ9Z99', BrazilState.es),
    ('RBK0A00', 'RCN9Z99', BrazilState.go),
    ('RCO0A00', 'RDR9Z99', BrazilState.ba),
    ('RDS0A00', 'REB9Z99', BrazilState.sc),
    ('REC0A00', 'REV9Z99', BrazilState.df),
    ('REW0A00', 'REZ9Z99', BrazilState.ms),
    ('RFA0A00', 'RGD9Z99', BrazilState.mg),
    ('RGE0A00', 'RGM9Z99', BrazilState.rn),
    ('RGN0A00', 'RGN9Z99', BrazilState.rn),
    ('RGO0A00', 'RGU9Z99', BrazilState.al),
    ('RGV0A00', 'RGZ9Z99', BrazilState.al),
    ('RHA0A00', 'RHZ9Z99', BrazilState.pr),
    ('RIA0A00', 'RIL9Z99', BrazilState.ce),
    ('RIM0A00', 'RIN9Z99', BrazilState.to),
    ('RIO0A00', 'RIO9Z99', BrazilState.rj),
    ('RIP0A00', 'RKV9Z99', BrazilState.rj),
    ('RKW0A00', 'RLP9Z99', BrazilState.sc),
    ('RLQ0A00', 'RLZ9Z99', BrazilState.pb),
    ('RMA0A00', 'RMC9Z99', BrazilState.to),
    ('RMD0A00', 'RNZ9Z99', BrazilState.mg),
    ('ROA0A00', 'ROZ9Z99', BrazilState.ma),
    ('RPA0A00', 'RPZ9Z99', BrazilState.ba),
    ('RQA0A00', 'RQL9Z99', BrazilState.rn),
    ('RQM0A00', 'RQV9Z99', BrazilState.es),
    ('RQW0A00', 'RRH9Z99', BrazilState.se),
    ('RRI0A00', 'RRZ9Z99', BrazilState.mt),
    ('RSA0A00', 'RSF9Z99', BrazilState.to),
    ('RSG0A00', 'RST9Z99', BrazilState.pi),
    ('RSU0A00', 'RSZ9Z99', BrazilState.ro),
    ('RTA0A00', 'RVZ9Z99', BrazilState.mg),
    ('RWA0A00', 'RWJ9Z99', BrazilState.ms),
    ('RWK0A00', 'RXJ9Z99', BrazilState.pa),
    ('RXK0A00', 'RYZ9Z99', BrazilState.sc),
    ('RZA0A00', 'RZD9Z99', BrazilState.rr),
    ('RZE0A00', 'RZZ9Z99', BrazilState.pe),
    ('SAA0A00', 'SAJ9Z99', BrazilState.al),
    ('SAK0A00', 'SAM9Z99', BrazilState.ap),
    ('SAN0A00', 'SAU9Z99', BrazilState.ce),
    ('SAV0A01', 'SAV1A00', BrazilState.sp),
    ('SAV1A01', 'SBV9Z99', BrazilState.ce),
    ('SBW0A00', 'SDO9Z99', BrazilState.go),
    ('SDP0A00', 'SFO9Z99', BrazilState.pr),
    ('SFP0A00', 'SGM9Z99', BrazilState.es),
    ('SGN0A00', 'SGZ9Z99', BrazilState.df),
    ('SHA0A00', 'SHA9Z99', BrazilState.ac),
    ('SHB0A00', 'SJI9Z99', BrazilState.mg),
    ('SJJ0A00', 'SKT9Z99', BrazilState.ba),
    ('SKU0A00', 'SLF9Z99', BrazilState.pb),
    ('SLG0A00', 'SLL9Z99', BrazilState.ro),
    ('SLM0A00', 'SLV9Z99', BrazilState.pi),
    ('SLW0A00', 'SML9Z99', BrazilState.ms),
    ('SMM0A00', 'SNJ9Z99', BrazilState.ma),
    ('SNK0A00', 'SPB9Z99', BrazilState.pe),
    ('SPC0A00', 'SQP9Z99', BrazilState.mt),
    ('SQQ0A00', 'SQU9Z99', BrazilState.ac),
    ('SQV0A00', 'SSE9Z99', BrazilState.rj),
    ('SSF0A00', 'SSQ9Z99', BrazilState.df),
    ('SSR0A00', 'SWZ9Z99', BrazilState.sp),
    ('SXA0A00', 'SXZ9Z99', BrazilState.sc),
    ('SYA0A00', 'SYZ9Z99', BrazilState.mg),
    ('SZA0A00', 'SZZ9Z99', BrazilState.pa),
    ('TAA0A00', 'TAH9Z99', BrazilState.am),
    ('TAI0A00', 'TBZ9Z99', BrazilState.pr),
    ('TCA0A00', 'TEZ9Z99', BrazilState.mg),
    ('TFA0A00', 'TGN9Z99', BrazilState.go),
    ('TGO0A00', 'TGQ9Z99', BrazilState.ap),
    ('TGR0A00', 'THH9Z99', BrazilState.ba),
    ('THI0A00', 'THM9Z99', BrazilState.ro),
    ('THN0A00', 'TIN9Z99', BrazilState.ce),
    ('TIO0A00', 'TMJ9Z99', BrazilState.sp),
    ('TMK0A00', 'TNG9Z99', BrazilState.ba),
    ('TNH0A00', 'TNT9Z99', BrazilState.al),
    ('TNU0A00', 'TOD9Z99', BrazilState.se),
    ('TOE0A00', 'TOS9Z99', BrazilState.es),
    ('TOT0A00', 'TPH9Z99', BrazilState.pb),
    ('TPI0A00', 'TQE9Z99', BrazilState.sc),
    ('TQO0A00', 'TRW9Z99', BrazilState.rs),
    ('TRX0A00', 'TSO9Z99', BrazilState.am),
    ('TSP0A00', 'TSZ9Z99', BrazilState.rn),
    ('TTA0A00', 'TUX9Z99', BrazilState.rj),
    ('TUY0A00', 'TUZ9Z99', BrazilState.df),
    ('TVA0A00', 'TVD9Z99', BrazilState.to),
    ('TVK0A00', 'TVK9Z99', BrazilState.df),
    ('TVL0A00', 'TWK9Z99', BrazilState.pa),
    ('TWY0A00', 'UAH9Z99', BrazilState.mg),
    ('UAI0A00', 'UAI9Z99', BrazilState.mg),
    ('UAJ0A00', 'UAR9Z99', BrazilState.ro),
    ('UAS0A00', 'UCZ9Z99', BrazilState.pr),
    ('UDA0A00', 'UGV9Z99', BrazilState.sp),
    ('UHJ0A00', 'UII9Z99', BrazilState.pe),
    ('UIV0A00', 'UJL9Z99', BrazilState.df),
    ('UJM0A00', 'UKE9Z99', BrazilState.ma),
    ('UKF0A00', 'UKN9Z99', BrazilState.pi),
    ('UKO0A00', 'UKQ9Z99', BrazilState.ap),
  ];
}
