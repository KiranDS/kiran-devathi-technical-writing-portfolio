# SLA management

**Audience:** Workspace administrators and team leads  
**Product version:** 1.0

## 1. Overview

A service-level agreement (SLA) defines a target for a support activity, such as the first response to a customer or the resolution of a ticket.

In this portfolio example, SupportFlow uses SLA policies to help teams monitor service commitments. The exact timer implementation is illustrative and must be validated before use in a real product.

## 2. SLA terminology

| Term | Definition |
|---|---|
| First response | The first qualifying response sent to the requester |
| Resolution | The point at which the ticket is marked resolved under the applicable policy |
| Business hours | The configured working periods used to calculate a target |
| Target | The permitted duration for a qualifying action |
| Breach | A target that has passed without the qualifying action |
| At risk | A ticket approaching its target threshold |

## 3. Example policy

The following values are fictional examples, not recommended service commitments.

| Priority | First-response target | Resolution target |
|---|---:|---:|
| Urgent | 15 business minutes | 4 business hours |
| High | 1 business hour | 8 business hours |
| Normal | 4 business hours | 2 business days |
| Low | 8 business hours | 5 business days |

A production policy should define how holidays, time zones, Pending status, reassignment, and reopened tickets affect calculations.

## 4. Configure an SLA policy

**Prerequisites:** You have administrator access and an approved policy from the service owner.

1. Open **Administration**.
2. Select **SLA policies**.
3. Create a policy or open the policy to update.
4. Enter a descriptive policy name.
5. Define the applicable ticket conditions, such as priority or team.
6. Enter the approved first-response and resolution targets.
7. Select the applicable business-hour schedule.
8. Review exception and pause rules with the service owner.
9. Save the policy.
10. Verify the policy using representative test scenarios.

**Expected result:** The policy is available for the ticket conditions defined in its configuration.

## 5. Monitor SLA status

Team leads should review:
- Tickets approaching first-response targets.
- Tickets approaching resolution targets.
- Tickets that have breached a target.
- Tickets in Pending status with an outstanding dependency.
- Tickets whose priority or ownership changed.

A dashboard indicator should be treated as a prompt for investigation, not as a substitute for reviewing ticket context.

## 6. Example calculation

Assume a fictional policy gives a High-priority ticket a first-response target of one business hour. The ticket is created at 10:00 on a working day, and the business-hour schedule is active from 09:00 to 17:00.

If the policy counts continuously during that schedule and no pause or exception applies, the illustrative target time is 11:00 on the same day.

This example does not specify the product's actual timer algorithm.

## 7. Operational recommendations

- Obtain SLA targets from the service owner.
- Document the time zone and holiday calendar.
- Define whether Pending pauses any timer.
- Define how reassignment affects ownership and timers.
- Test boundary conditions, including tickets created near closing time.
- Review policy changes with affected teams.
- Communicate changes before they take effect.

## 8. Troubleshooting SLA discrepancies

If a ticket appears to have an unexpected SLA state:
1. Confirm the ticket priority and applicable policy.
2. Check the team's business-hour schedule and time zone.
3. Review status changes and any documented pause conditions.
4. Check whether the ticket was reassigned or reopened.
5. Compare the displayed target with the approved policy.
6. Escalate unexplained differences to the administrator or product support team.

## 9. Related documentation

- [Administrator guide](administrator-guide.md)
- [Ticket management](ticket-management.md)
- [Reporting and analytics](reporting-and-analytics.md)
