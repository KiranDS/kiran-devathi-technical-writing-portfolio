# Ticket management

**Audience:** Support agents and team leads  
**Product version:** 1.0

## 1. Overview

A ticket represents a customer request that the support team must investigate, answer, or resolve. This guide describes the illustrative ticket lifecycle in SupportFlow.

## 2. Ticket fields

| Field | Description | Example |
|---|---|---|
| Ticket ID | Unique ticket reference | `SF-10482` |
| Subject | Short summary of the request | `Unable to reset password` |
| Requester | Person who raised the request | `Avery Morgan` |
| Status | Current lifecycle state | `Open` |
| Priority | Relative urgency | `High` |
| Team | Team responsible for the work | `Account Support` |
| Assignee | Individual responsible for the ticket | `Jordan Lee` |
| Created | Date and time the ticket was created | `2026-11-09 09:15 UTC` |
| Updated | Date and time of the latest update | `2026-11-09 10:05 UTC` |

All sample records are fictional.

## 3. Create a ticket

**Prerequisites:** You are signed in and have permission to create tickets.

1. Select **New ticket**.
2. Enter the requester's name and contact details required by the workspace.
3. Enter a subject that describes the issue.
4. Add the problem description and relevant context.
5. Select a priority using your team's criteria.
6. Select a team or assignee if the workflow requires it.
7. Select **Save**.

**Expected result:** SupportFlow creates a ticket and displays its ticket ID.

### Example

**Subject:** Unable to reset password

**Description:** The requester reports that the password-reset link returns an expired-link message. The requester tried the link twice. No credentials or secret values are included in this example.

**Priority:** High

## 4. Assign or reassign a ticket

1. Open the ticket.
2. Review its current team and assignee.
3. Select the appropriate team or assignee.
4. Confirm that the new owner has the required skills and capacity.
5. Save the change.
6. Verify that the ticket displays the new assignment.

Reassignment should preserve the ticket's activity history.

## 5. Change ticket status

Use the following status meanings:

- **New:** created and awaiting active handling.
- **Open:** actively being investigated or worked.
- **Pending:** awaiting an external response or action.
- **Resolved:** the support team has recorded a resolution.

Before changing a status, add an explanatory note when it helps the next person understand the reason.

## 6. Add an internal note or customer response

Choose the communication type carefully.

- **Internal note:** information for authorised support staff; not intended for the requester.
- **Customer response:** information intended to be sent to the requester.

Before saving, verify the selected communication type and review the text for sensitive information.

## 7. Resolve a ticket

1. Review the original request.
2. Confirm the resolution or agreed outcome.
3. Record the steps taken and relevant evidence.
4. Provide the requester with a concise summary where appropriate.
5. Set the status to **Resolved**.
6. Save and verify the updated status.

## 8. Example end-to-end scenario

| Step | Action | Ticket state |
|---|---|---|
| 1 | Request is recorded | New |
| 2 | Agent begins investigation | Open |
| 3 | Agent requests additional information | Pending |
| 4 | Requester supplies the information | Open |
| 5 | Agent applies and verifies the fix | Open |
| 6 | Agent records the outcome | Resolved |

The example does not define automatic status transitions or timer behaviour.

## 9. Good ticket hygiene

- Use specific subjects.
- Keep descriptions factual and concise.
- Record meaningful investigation steps.
- Keep ownership current.
- Use Pending only when a dependency exists.
- Do not place credentials, tokens, or payment-card data in ticket content.
- Link to an approved knowledge article when it helps explain a repeatable resolution.

## 10. Related documentation

- [User guide](user-guide.md)
- [SLA management](sla-management.md)
- [Troubleshooting](troubleshooting.md)
