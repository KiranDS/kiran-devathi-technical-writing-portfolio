# SupportFlow administrator guide

**Audience:** Workspace administrators  
**Product version:** 1.0

## 1. Overview

This guide describes illustrative workspace administration tasks. It does not represent a verified implementation or a complete security configuration.

Administrators are responsible for maintaining workspace access, team structure, and organisation-level settings in accordance with internal policy.

## 2. Administrator responsibilities

Typical responsibilities include:
- Provisioning and deactivating user accounts.
- Assigning users to teams.
- Assigning appropriate roles.
- Reviewing access when responsibilities change.
- Maintaining SLA policies and business-hour schedules.
- Coordinating configuration changes with support leadership.

Apply the principle of least privilege: grant only the access required for a user's responsibilities.

## 3. Manage users

The illustrative user-management workflow is:

1. Open **Administration**.
2. Select **Users**.
3. Choose **Invite user**.
4. Enter the user's work email address.
5. Select the appropriate role.
6. Assign the user to the relevant team, if applicable.
7. Send the invitation.
8. Confirm that the user appears in the user list with the expected role and status.

Before inviting a user, confirm that the request is authorised.

### Review a user's access

1. Find the user in the user list.
2. Review the assigned role and team membership.
3. Compare the access with the user's current responsibilities.
4. Update the role or team assignment if authorised.
5. Record the change according to your organisation's access-review process.

The exact invitation lifecycle and account-deactivation behaviour must be verified against a real product before operational use.

## 4. Manage teams

Teams organise users who handle related support work.

1. Open **Administration**.
2. Select **Teams**.
3. Create a team or open an existing team.
4. Enter a clear team name and description.
5. Add authorised members.
6. Review the team's queue and assignment conventions.
7. Save the changes.

Avoid creating duplicate teams for the same operational function.

## 5. Understand roles

The portfolio example defines three roles:

| Role | Intended responsibility |
|---|---|
| Administrator | Workspace configuration and access management |
| Team Lead | Team-level workload and ticket oversight |
| Agent | Day-to-day ticket handling |

This is a conceptual role model, not a complete permission specification. A production implementation should provide a permission matrix showing every privileged action and its authorised roles.

## 6. Configure workspace settings

Workspace settings may include organisation details, default time zone, business-hour schedule, and notification preferences.

Before changing a setting:
1. Identify the business owner.
2. Understand which teams or workflows are affected.
3. Communicate the planned change.
4. Apply the change in an approved window where required.
5. Verify the result with an appropriate test account.
6. Record the change.

## 7. Configure business hours

Business-hour schedules are used by the illustrative SLA model.

When defining a schedule, document:
- Time zone.
- Working days.
- Start and end times.
- Public holidays and exceptions.
- Whether different teams use different schedules.

Do not publish SLA calculations until the time-zone and holiday rules are confirmed.

## 8. Access-review checklist

- [ ] Every active user has a business need for access.
- [ ] Each user has the least-privileged appropriate role.
- [ ] Team membership reflects current responsibilities.
- [ ] Departed or transferred users are handled through the approved identity process.
- [ ] Administrative access is limited and periodically reviewed.
- [ ] Changes are recorded in the organisation's approved audit process.

## 9. Security and privacy

Do not use SupportFlow documentation as evidence of a specific security certification, encryption design, retention policy, or regulatory compliance status. Those claims require authoritative product evidence.

For a real product, administrators should consult approved security and privacy documentation before configuring sensitive workflows.

## 10. Related documentation

- [Getting started](getting-started.md)
- [SLA management](sla-management.md)
- [Troubleshooting](troubleshooting.md)
