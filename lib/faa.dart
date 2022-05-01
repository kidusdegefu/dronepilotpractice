import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';

final testData = [
  " Unmanned aircraft must weigh less than 55 lbs. (25 kg).  ",
  " Visual line-of-sight (VLOS) only; the unmanned aircraft must remain within VLOS of the remote pilot in command and the person manipulating the flight controls of the small UAS. Alternatively, the unmanned aircraft must remain within VLOS of the visual observer. ",
  " At all times the small unmanned aircraft must remain close enough to the remote pilot in command and the person manipulating the flight controls of the small UAS for those people to be capable of seeing the aircraft with vision unaided by any device other than corrective lenses. ",
  " Small unmanned aircraft may not operate over any persons not directly participating in the operation, not under a covered structure, and not inside a covered stationary vehicle. ",
  " Daylight-only operations, or civil twilight (30 minutes before official sunrise to 30 minutes after official sunset, local time) with appropriate anti-collision lighting.",
  " Must yield right of way to other aircraft. ",
  " May use visual observer (VO) but not required. ",
  " First-person view camera cannot satisfy “see-and-avoid” requirement but can be used as long as requirement is satisfied in other ways. ",
  " Maximum groundspeed of 100 mph (87 knots). ",
  " Maximum altitude of 400 feet above ground level (AGL) or, if higher than 400 feet AGL, remain within 400 feet of a structure. ",
  " Minimum weather visibility of 3 miles from control station. ",
  " Operations in Class B, C, D and E airspace are allowed with the required ATC permission. ",
  " Operations in Class G airspace are allowed without ATC permission. ",
  " No person may act as a remote pilot in command or VO for more than one unmanned aircraft operation at one time. ",
  " No operations from a moving aircraft. ",
  " No operations from a moving vehicle unless the operation is over a sparsely populated area. ",
  " No careless or reckless operations. ",
  " No carriage of hazardous materials. ",
  " Requires preflight inspection by the remote pilot in command. ",
  " A person may not operate a small unmanned aircraft if he or she knows or has reason to know of any physical or mental condition that would interfere with the safe operation of a small UAS. ",
  " Foreign-registered small unmanned aircraft are allowed to operate under part 107 if they satisfy the requirements of part 375. ",
  " External load operations are allowed if the object being carried by the unmanned aircraft is securely attached and does not adversely affect the flight characteristics or controllability of the aircraft. ",
  " Transportation of property for compensation or hire allowed provided that- o The aircraft, including its attached systems, payload and cargo weigh less than 55 pounds total; o The flight is conducted within visual line of sight and not from a moving vehicle or aircraft; and o The flight occurs wholly within the bounds of a State and does not involve transport between (1) Hawaii and another place in Hawaii through airspace outside Hawaii; (2) the District of Columbia and another place in the District of Columbia; or (3) a territory or possession of the United States and another place in the same territory or possession. ",
  " Most of the restrictions discussed above are waivable if the applicant demonstrates that his or her operation can safely be conducted under the terms of a certificate of waiver. ",
  " Establishes a remote pilot in command position. ",
  " A person operating a small UAS must either hold a remote pilot airman certificate with a small UAS rating or be under the direct supervision of a person who does hold a remote pilot certificate (remote pilot in command). ",
  " Part 61 pilot certificate holders may obtain a temporary remote pilot certificate immediately upon submission of their application for a permanent certificate. Other applicants will obtain a temporary remote pilot certificate upon successful completion of TSA security vetting. The FAA anticipates that it will be able to issue a temporary remote pilot certificate within 10 business days after receiving a completed remote pilot certificate application. ",
  " Until international standards are developed, foreign certificated UAS pilots will be required to obtain an FAA issued remote pilot certificate with a small UAS rating.",
  " Make available to the FAA, upon request, the small UAS for inspection or testing, and any associated documents/records required to be kept under the rule. ",
  " Report to the FAA within 10 days of any operation that results in at least serious injury, loss of consciousness, or property damage of at least 500 dollars. ",
  " Conduct a preflight inspection, to include specific aircraft and control station systems checks, to ensure the small UAS is in a condition for safe operation. ",
  " Ensure that the small unmanned aircraft complies with the existing registration requirements specified in § 91.203(a)(2). A remote pilot in command may deviate from the requirements of this rule in response to an in flight emergency",
  " FAA airworthiness certification is not required. However, the remote pilot in command must conduct a preflight check of the small UAS to ensure that it is in a condition for safe operation. ",
  " Part 107 does not apply to model aircraft that satisfy all of the criteria specified in section 336 of Public Law 112-95",
  " The rule codifies the FAA’s enforcement authority in part 101 by prohibiting model aircraft operators from endangering the safety of the NAS.",
];

void main() => runApp(Demo());

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAA Rules'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1600,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BulletedList(
                listItems: testData,
                listOrder: ListOrder.ordered,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
