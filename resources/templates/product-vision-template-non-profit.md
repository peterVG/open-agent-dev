# [PRODUCT NAME]: Product Vision

> **Nonprofit software product vision template**
>
> Use this template to create a product-specific `product-vision.md` that guides discovery, prioritization, and preparation of a product requirements document (PRD). It supports internal tools, member services, program delivery, public products, and shared infrastructure.

## How to complete this template

- Copy this file to `product-vision.md`. Replace bracketed fields and instructional prompts with concise, product-specific answers. Remove unused sample rows. Use `Not applicable - [reason]` where appropriate.
- Keep this document at product level. Link to organizational strategies, research, budgets, and policies rather than reproducing them. Detailed workflows, interface specifications, schemas, and test cases belong in the PRD or later design documents.
- An early draft can contain unknowns. Mark each material gap `TBD - [decision/research owner; resolve by date or milestone]`. Do not invent interviews, stakeholder endorsement, population counts, budgets, funding commitments, targets, partnerships, laws, or technical decisions.
- Separate **evidence** (what is supported and by which source), **assumptions** (what needs testing), **proposals** (what is suggested), and **approved decisions** (who decided, when, and within what authority). Approval does not establish that an assumption is true.
- The prompts describe topics to consider; they do not automatically impose product requirements. Establish the actual organization's purpose, legal form, funding, ownership, and delivery model. Explicitly decide pricing and licensing.
- Preserve sequential user requirement IDs `U-01`, `U-02`, …; **do not use a `V-` prefix**. This template also uses `O-` for outcomes, `CAP-` for capabilities, `CON-` for constraints, `M-` for measures, and `REF-` for sources. Keep issued IDs stable across revisions; do not reassign retired IDs.
- Complete the essential reasoning first: mission contribution, evidenced need, relevant people, outcomes, initial scope, user requirements, and operating/funding approach. Add depth where it changes a product decision. Section 19 records readiness and unresolved questions.

This is an original adaptation of the supplied commercial product vision template, informed by the methods acknowledged at the end. It does not claim compliance with a single nonprofit planning standard.

## Document context

| Field | Value |
| --- | --- |
| Responsible organization; relevant mission/strategy reference | [Name; REF-ID or link] |
| Organizational/legal form and relevant jurisdictions | [Confirmed facts, or TBD] |
| Product type and intended service area | [Internal / member / program / public / infrastructure / hybrid; scope] |
| Product owner and mission/service owner | [Roles or names; one person may hold both] |
| Document status, version, and date | [Draft / In review / Approved; version; YYYY-MM-DD] |
| Planning horizon and initial release boundary | [Period; release or pilot covered] |
| Decision authority and approval record | [Role; decision/date, or approval pending] |
| Review trigger or next review date | [Event or date] |

## 1. Mission and Product Vision

**Purpose:** Explain why this product should exist and the contribution it is expected to make.

**Relevant organizational mission:** [State or cite the mission element this product serves.]

**Product vision:**

> For [people, organizations, or operational roles] experiencing [specific need], [product] will enable [meaningful capability or change], contributing to [mission outcome] through [brief explanation of the connection].

**Why this organization:** [Mandate, expertise, relationships, resources, or stewardship responsibility that justify its role.]

**Product boundary:** [What the software can accomplish; what requires people, other services, policy, partners, or wider conditions.]

**Decision principles:** [A small number of priorities that will resolve tradeoffs, with their practical implications. Identify which are approved.]

For internal software, explain how an operational improvement supports service quality, reliability, capacity, accountability, or another mission-relevant result.

## 2. Problem, Need, Reach, and Evidence

**Purpose:** Establish the need before selecting a solution.

- **Current situation:** [Who experiences the problem, in what task or circumstances, and with what consequences?]
- **Existing response:** [Current tools, services, workarounds, and reasons people use them.]
- **Evidence:** [Research, service data, observation, complaints, sector evidence, or other REF-IDs; dates and limitations.]
- **Reach:** [Relevant population, organizations, members, or internal workflows. Distinguish overall need, realistically reachable groups, and initial participants. Label estimates and their basis.]
- **Demand and feasibility of adoption:** [Evidence that intended users or adopting organizations would use the product; procurement or willingness-to-pay evidence if relevant.]
- **Missing perspectives:** [Whose needs have not been examined; plan to include them.]
- **Opportunity cost:** [What resources this work would displace; what happens if the organization delays or does nothing.]

**Problem statement:** [A concise, evidenced statement without embedding a preferred technology.]

## 3. Beneficiaries, Users, and Other Stakeholders

**Purpose:** Identify distinct interests, needs, and responsibilities. One person or organization may occupy several roles.

| Role | Who occupies it? | Relevant need or interest | Participation or actual decision rights |
| --- | --- | --- | --- |
| Intended beneficiaries or mission interests | [People, communities, organizations, or other subjects; may not use the software] | [Intended improvement] | [How interests are represented] |
| Direct users | [Members, public users, staff, volunteers, or others] | [Tasks and context] | [Research/testing/feedback role] |
| Operators and maintainers | [Who administers and supports it] | [Operational needs] | [Operational responsibility] |
| Paying customers or commissioners, if any | [Who purchases or commissions] | [Purchasing need] | [Contractual authority] |
| Funders or sponsors, if any | [Who supplies resources] | [Conditions and expectations] | [Actual authority] |
| Delivery partners or contributors | [Who enables the service] | [Dependencies and shared value] | [Agreed responsibilities] |
| Governing authority | [Accountable role or body] | [Mission and organizational interests] | [Approval/oversight boundaries] |
| Other affected parties | [People affected by data use, exclusion, or service changes] | [Relevant effects] | [Representation or feedback route] |

**Priority groups and tradeoffs:** [Whose needs lead when interests conflict, why, and who resolves the conflict?]

For missions concerning cultural heritage, animals, or the environment, identify relevant representatives or stewards.

## 4. Intended Outcomes and Theory of Change

**Purpose:** Explain the expected connection between the product and the mission. The short logic model describes the chain; the accompanying explanation states why the links should hold.

### Change logic

| Element | Product-specific account |
| --- | --- |
| Inputs | [Funding, staff capacity, knowledge, data, partnerships, infrastructure] |
| Activities | [What the software, users, organization, and partners will do] |
| Outputs | [Direct services or deliverables produced; distinguish these from the software's features] |
| Outcomes | [Changes in access, capability, practice, quality, reliability, efficiency, or other relevant conditions] |
| Longer-term mission contribution | [Wider change the product is expected to support] |

Use multiple linked pathways or feedback relationships where a single sequence would oversimplify the product's contribution.

**Causal explanation:** [Why should those activities and outputs produce the outcomes? State the mechanism, supporting evidence, essential assumptions, external factors, and plausible alternative explanations.]

### Priority outcomes

| ID | Intended change, affected group or subject, and horizon | Product contribution and degree of influence | Essential dependencies or assumptions |
| --- | --- | --- | --- |
| O-01 | [Change for whom, by when] | [Direct control / partial influence / indirect contribution; explanation] | [People, services, conditions, evidence gaps] |

Link outcomes to measures in section 16. Record both expected benefits and material unintended effects. Choose horizons appropriate to this product; a release date and an outcome assessment date may differ.

**Conditions that would weaken the case:** [What evidence would cause the organization to revise its theory or stop investing?]

## 5. Value, Alternatives, and Distinctive Contribution

**Purpose:** Explain the value offered and why the proposed approach merits investment.

**Value by relevant group:** [What becomes easier, more reliable, more accessible, more effective, or otherwise better? Distinguish beneficiary, user, operator, purchaser, and funder value where necessary.]

| Alternative or existing service | Need it already addresses | Material gap or tradeoff | Implication for this product |
| --- | --- | --- | --- |
| [Existing software, partner service, manual process, or no change] | [Value] | [Evidence-backed limitation] | [Use / buy / adapt / integrate / collaborate / build; rationale] |

**Distinctive contribution:** [Why this organization's proposed contribution is valuable: expertise, trust, stewardship, relationships, content, integration, access, or other demonstrated strengths.]

**Ecosystem approach:** [What should be reused, shared, purchased, or developed jointly? What intellectual property or licensing decisions remain open?]

Where paid offerings are involved, retain relevant competitor, pricing, distribution, and procurement analysis. Assess copying or reuse according to the product's goals and actual rights.

## 6. Core Capabilities, Scope, and Non-goals

**Purpose:** Identify the smallest coherent product scope capable of testing or delivering the intended value.

| ID | High-level capability | Supporting U-ID, O-ID, or confirmed obligation | Release and decision status | Critical dependency |
| --- | --- | --- | --- | --- |
| CAP-01 | [What the product enables, without detailed design] | [Traceable basis] | [Pilot / initial / later; proposed / approved] | [Dependency or none] |

**Initial scope:** [Included users, workflows, geography, languages, data categories, platforms, and integrations, where material.]

**Explicit exclusions:** [What this product or release will not do, with reasons.]

**Later possibilities:** [Ideas retained for consideration; no implied commitment.]

**Prioritization rule:** [How mission contribution, severity of need, evidence, access, cost, risk, dependencies, and mandatory obligations affect choices. Identify who applies the rule.]

Explain why each initial capability is necessary. Broad mission aspirations alone do not determine a feature list.

## 7. User Requirements

**Purpose:** Express the needs that should guide the PRD.

Use `U-01`, `U-02`, … sequentially. Keep each need concise and attributable to a user role. Prefer “As [role], I need [ability], so that [purpose]” or an equivalent “I want/I need” statement.

| ID | User requirement | Intended outcome or value | Evidence and uncertainty | Priority, release, and decision status |
| --- | --- | --- | --- | --- |
| U-01 | As [role], I need [ability], so that [purpose]. | [O-ID or explicit operational value] | [REF-ID; supported / assumption; limitations] | [Priority; release; proposed / approved] |

Describe the need independently of a preferred implementation unless a confirmed constraint requires that implementation.

Needs of operators, administrators, and volunteers belong here when they are users. Beneficiary interests that do not correspond to direct software use remain visible in outcomes and constraints.

Record institutional obligations in sections 14 and 17 without inventing a user persona to carry them.

## 8. Access, Delivery, and Adoption

**Purpose:** Explain how intended users will obtain, adopt, and successfully use the product.

- **Delivery and access model:** [Hosted service, local installation, partner delivery, organizational deployment, or another model; eligibility and account/access arrangements.]
- **Discovery and adoption channels:** [How intended users hear about it; sales, procurement, referrals, partnerships, or internal rollout where relevant.]
- **Practical access:** [Relevant barriers involving cost, language, disability, connectivity, devices, digital confidence, location, or trust; proposed responses.]
- **Service integration:** [What changes in existing workflows; migration, onboarding, training, and assisted or offline processes if needed.]
- **Adoption responsibilities:** [Who secures organizational participation, trains users, and provides ongoing support?]
- **Early validation:** [What pilot or adoption evidence would show that the proposed delivery approach works?]

Record confirmed access commitments as constraints or user requirements, with their source and status.

## 9. Governance, Participation, and Accountability

**Purpose:** Make product decisions and accountability explicit at a scale appropriate to the organization.

| Decision area | Accountable role | Relevant participants | Decision rule or escalation route |
| --- | --- | --- | --- |
| Product priorities and mission alignment | [Role] | [Groups] | [Process] |
| Scope, budget, and release decisions | [Role] | [Groups] | [Process] |
| Service operation and data stewardship | [Role] | [Groups] | [Process] |

**Participation:** [How relevant users, beneficiaries, maintainers, and other affected people influence discovery, prioritization, pilot review, and later improvement. Address barriers to meaningful participation.]

**Feedback and accountability:** [How suggestions, complaints, or concerns are received, answered, and reflected in decisions; who owns follow-up.]

**Conflicts and boundaries:** [How funding conditions, purchaser requests, mission priorities, and user interests are reconciled. State delegated authority and any reserved decisions.]

Link existing governance documents. Additional committees or approval stages should be introduced only when the organization needs them.

## 10. Funding, Costs, and Financial Sustainability

**Purpose:** Explain how development and continued operation will be supported.

| Resource or income source | Commitment status and evidence | Amount/range, currency, and period | Restrictions, conditions, or dependencies |
| --- | --- | --- | --- |
| [Internal allocation, grant, donation, dues, fees, contract, subscription, licence, or other source] | [Secured / conditional / planned; REF-ID] | [Known value, estimate, or TBD] | [Permitted use, renewal dependency, or other condition] |

**Lifecycle cost view:** [Estimate, or link an estimate covering discovery, implementation, migration, hosting, licences, support, training, maintenance, security updates, accessibility work, evaluation, governance, and eventual transition. Include fixed/variable costs, main cost drivers as usage or data volumes grow, staff and volunteer capacity assumptions, one-time/recurring costs, planning horizon, and uncertainty.]

**Operating coverage:** [Which costs have coverage, for how long, and what remains unfunded? Record renewal timing or funding concentration if material.]

**Pricing and affordability:** [Whether access is free, paid, subsidized, tiered, or internally funded; who pays; how the choice affects intended users and mission goals.]

**Financial decision rules:** [Budget owner, acceptable commitments, cost-recovery or surplus assumptions if relevant, and conditions for proceeding or reducing scope.]

**Reduced-funding scenario:** [What changes if anticipated resources do not arrive? How would service continuity, transfer, or closure be handled?]

Keep confirmed commitments distinct from fundraising intentions or projected sales.

## 11. Resources, Partnerships, and Operating Capacity

**Purpose:** Establish who can deliver and sustain the product.

| Resource, role, or partner | Contribution and capacity | Commitment evidence | Dependency and continuity arrangement |
| --- | --- | --- | --- |
| [Team, specialist, partner, infrastructure, or data provider] | [Work and available capacity] | [Confirmed / proposed; REF-ID] | [Dependency, substitute, handover, or unresolved issue] |

**Operating model:** [Responsible organization and roles for hosting/deployment, support, maintenance, incident response, updates, documentation, and user communications.]

**Capacity assumptions:** [Paid staff, volunteers, contractors, shared services, and relevant skills; available time rather than just headcount.]

**Ownership and stewardship:** [Who holds or controls code, documentation, domains, credentials, data, contracts, and other essential assets; unresolved arrangements.]

**Partnership boundaries:** [Responsibilities, service dependencies, data sharing, and any commitments that require agreement.]

**Transition approach:** [Conditions for transfer, consolidation, or retirement; responsibilities for users, data, records, documentation, and integrations.]

## 12. Technical Direction and Architecture Boundaries

**Purpose:** Give the PRD useful technical context while preserving open design decisions.

| Topic | Confirmed constraint, proposed direction, or undecided | Rationale and evidence | Decision owner or resolution milestone |
| --- | --- | --- | --- |
| [Deployment, platform, integration, stack, data exchange, or licensing] | [Status and direction; CON-ID if binding] | [REF-ID or decision record] | [Role/milestone] |

Address only relevant matters: existing systems, interoperability, portability, data ownership, hosting or residency, supported environments, maintainability, integration dependencies, licensing, and available technical skills.

**Existing assets to reuse:** [Code, services, standards, data, documentation, and their assessed suitability.]

**Open architectural questions:** [Choices requiring discovery or technical investigation.]

Candidate tools, frameworks, AI capabilities, hosting providers, or databases remain proposals until decided. Record approved decisions and their rationale; keep detailed architecture in separate records.

## 13. Quality, Accessibility, and Data Stewardship

**Purpose:** Identify product qualities that materially affect usable and dependable service.

| Area | Relevant user/service need | Confirmed commitment or open question | Basis and owner |
| --- | --- | --- | --- |
| [Accessibility, usability, reliability, security, performance, recoverability, maintainability, or interoperability] | [Context and importance] | [Commitment/CON-ID or TBD] | [REF-ID; responsible role] |

**Data boundaries:** [Necessary data categories, sources, sensitivity, ownership/stewardship, and allowed uses.]

**Data lifecycle:** [Responsibilities and applicable requirements for collection, access, correction, sharing, export, retention, preservation, and disposal. Identify any consent or other authorization requirements that actually apply.]

**Risks to people and service:** [Product-specific possibilities of exclusion, misuse, unwanted exposure, inaccurate decisions, or other material harm, with intended responses.]

**Evaluation data:** [What evidence can be collected proportionately; access, collection burden, and limits on secondary use.]

Where service levels or accessibility targets are needed but unresolved, name the decision. Quantitative thresholds and validation methods must be established in the PRD from evidence or approved proposals.

## 14. Applicable Standards, Laws, Policies, and Obligations

**Purpose:** Identify authoritative sources of product constraints.

| REF-ID | Obligation and exact source section/version | Applicability and scope | Product implication | Confirmation status and owner |
| --- | --- | --- | --- | --- |
| [REF-ID] | [Law, standard, contract, funder term, professional rule, or organizational policy] | [Jurisdiction, organization, activity, data, or service concerned] | [CON-ID or proposed requirement area] | [Confirmed / to assess; role] |

Explain why each item applies. A standard, funder preference, or reference document is not automatically a mandatory requirement.

Identify relevant accessibility, privacy, security, records, intellectual property, and sector obligations as applicable to this particular product. Record conflicts or uncertainty for resolution; do not infer obligations solely from nonprofit status.

## 15. Technical, Domain, and Evidence References

**Purpose:** Give human and AI authors a verifiable source base.

Keep supporting materials or reference notes in `resources/references/` when available and permitted. Use relative links to files that actually exist; otherwise provide an authoritative URL and identify any access gap.

| ID | Title, author/organization, version/date | File or URL and relevant section | What it supports | Limitations or verification status |
| --- | --- | --- | --- | --- |
| REF-01 | [Source identity] | [Actual relative link or URL; section/page] | [Claim, U-ID, O-ID, CON-ID, or decision] | [Reviewed / unavailable / needs verification; limitations] |

Include relevant organizational strategy, user research, domain documentation, operating policies, agreements, API documentation, and existing architecture records.

For sensitive research, cite a suitable summary or controlled reference. Do not place personal information or secrets into the vision merely to make evidence accessible.

## 16. Success Measures, Evaluation, and Learning

**Purpose:** Specify how the organization will judge value and learn what needs to change.

Use a small set of measures spanning the relevant mission outcomes, user experience, access, delivery, service quality, and financial/operational health. Distinguish outputs and use counts from changes experienced by people or organizations.

### Repeat for each decision-relevant measure

- **ID and name:** M-01 - [Name]
- **Purpose and type:** [Outcome / output / adoption / operational / financial / unintended effect; decision this informs]
- **Related outcome, need, or constraint:** [O-ID, U-ID, CON-ID, or stated operational purpose]
- **Definition:** [What is measured; population, unit, period, and denominator if relevant]
- **Baseline:** [Known value and source, or how/when it will be established]
- **Target or assessment criterion:** [Approved target/qualitative criterion and horizon; or proposed/TBD]
- **Collection and responsibility:** [Method, source, frequency, accountable role, effort/cost, and relevant data limits]
- **Interpretation and response:** [Limitations, external influences, relevant differences between groups, and the decision prompted by results]

**Evaluation approach:** [How evidence will test the change logic, including other plausible explanations. State the strength of any contribution or causal claim.]

**Learning cycle:** [Who reviews results with whom, when, and how findings affect product priorities or the decision to continue.]

Software acceptance verifies specified product behavior. Broader mission outcomes require evidence from use and context; passing tests does not by itself establish those outcomes.

## 17. Constraints, SWOT, Risks, and Open Decisions

**Purpose:** Expose the factors that could change scope, feasibility, or mission contribution.

### Confirmed constraints

| ID | Constraint and scope | Reason/source | Owner and decision status |
| --- | --- | --- | --- |
| CON-01 | [Binding budget, date, capacity, access, technical, or institutional boundary] | [REF-ID or approved decision] | [Role; status/date] |

Keep preferences and unverified restrictions out of this table until confirmed.

### Brief mission-focused SWOT, where useful

| Perspective | Decision-relevant finding and evidence | Product response |
| --- | --- | --- |
| Internal strength | [Relevant capability or asset] | [Use it how?] |
| Internal weakness | [Capacity or capability limitation] | [Reduce scope, acquire support, or another response] |
| External opportunity | [Change or relationship that may help] | [Investigate or act how?] |
| External threat | [External condition that could undermine success] | [Mitigation or contingency] |

### Material uncertainties

| Risk, assumption, or open decision | Consequence if unresolved or false | Evidence/test/decision needed | Owner and milestone | Blocks which work? |
| --- | --- | --- | --- | --- |
| [Item; label its type] | [Mission, scope, access, cost, delivery, or continuity effect] | [Next action] | [Role; date/gate] | [Discovery / PRD detail / build / release / none] |

Include only material items. Consider dependencies on funding, a single maintainer, adoption, partners, data quality, or service conditions when relevant. Carry unresolved items into the PRD with their status.

## 18. Delivery and Learning Plan

**Purpose:** Define the next useful stages and what evidence will guide progress.

| Stage or milestone | Intended deliverable and learning | Conditions for proceeding, changing, or stopping | Owner and timing |
| --- | --- | --- | --- |
| [Discovery, prototype, pilot, initial release, or later review] | [Product result and uncertainty to resolve] | [Evidence, operational readiness, funding, or decision needed] | [Role; estimate or commitment] |

**Smallest useful initial release:** [Capabilities and service arrangements required to deliver coherent value.]

**Launch dependencies:** [Support, migration, training, agreements, funding, or other non-software work.]

**Post-launch responsibility:** [Owner of evaluation, feedback, maintenance, and the next scope decision.]

Use the stages appropriate to this product. Distinguish estimates from commitments; detailed delivery plans belong downstream.

## 19. PRD Handoff and Readiness

**Purpose:** Enable an accurate PRD without turning every idea in the vision into a commitment.

### Readiness review

- [ ] The product's mission contribution and boundaries are explicit.
- [ ] Relevant users, beneficiaries, operators, funders/purchasers, and decision makers are identified.
- [ ] Principal needs have evidence or clearly labeled assumptions and validation plans.
- [ ] Outcomes are distinct from capabilities, outputs, and usage counts.
- [ ] Initial scope, exclusions, priorities, and later possibilities are clear.
- [ ] User requirements have stable U-01 IDs.
- [ ] Access, adoption, governance, operating ownership, and funding have been addressed.
- [ ] Technical preferences are distinguished from confirmed constraints.
- [ ] Applicable obligations and material claims have traceable sources.
- [ ] Measures, material risks, and unresolved decisions have owners or resolution paths.

**Handoff status:** [Ready for draft PRD / Ready for PRD approval review / Further discovery needed; rationale.]

**Scope allowed to proceed:** [What can be drafted or specified now; what remains blocked.]

**Recorded decision:** [Authorized role, date, accepted uncertainties, and conditions. Leave pending if undecided.]

### Instructions for the human or AI author generating the PRD

1. Read this completed vision and the accessible supporting sources. Record unavailable references and unresolved questions; do not claim to have reviewed missing material.
2. Preserve the product purpose, stakeholder distinctions, outcome IDs, U-01 identifiers, scope boundaries, and approved decisions. Follow the repository's established PRD conventions where provided.
3. Translate approved capabilities and user needs into functional requirements, workflows, relevant data/integration requirements, and acceptance criteria. Derive operational and nonfunctional requirements from confirmed needs, constraints, and applicable obligations.
4. Give every PRD requirement a traceable basis: relevant U-ID, CAP-ID, CON-ID, REF-ID, or an exact approved vision decision. Relate it to an O-ID where meaningful. A broad outcome alone is insufficient to establish a particular implementation.
5. Clearly label additional implementation choices and newly discovered requirements as proposed, with rationale, supporting evidence where available, and the decision needed. Do not present unsupported features, stakeholders, integrations, budgets, technical choices, legal applicability, service levels, or numerical acceptance thresholds as established facts or approved commitments. Where a choice or threshold requires judgment, state the proposal and its basis explicitly.
6. Keep examples, assumptions, later possibilities, and open questions distinct from committed scope. Drafting the PRD does not approve them.
7. Specify acceptance criteria for behavior the software can control, with testable conditions. Preserve mission outcomes and the evaluation plan separately. Mark unresolved thresholds or behaviors as TBD with the appropriate owner.
8. Include applicable accessibility, security, privacy, data lifecycle, support, migration, recovery, maintainability, and interoperability requirements when justified. Explain any relevant gaps instead of silently filling them.
9. Identify non-software dependencies, remaining discovery, and conflicts between sources. Record the governing decision; do not silently choose between contradictory commitments.
10. Include a traceability table, open-decision list, proposed release scope, and the review needed before approval or implementation.

**Suggested PRD traceability format:**

| PRD requirement ID | Requirement and decision status | Vision/source references | Outcome or operational purpose | Acceptance/verification method |
| --- | --- | --- | --- | --- |
| [Use project convention, e.g. F-001 or NFR-001] | [Statement; approved basis or proposal] | [U/CAP/CON/REF IDs or exact decision] | [O-ID or rationale] | [Method; identify unresolved details] |

## Methodological basis and source acknowledgements

These methods inform the template's questions. They do not constitute product-specific evidence, determine legal obligations, or approve requirements. The structure, prompts, and PRD handoff above are an original synthesis.

| Method or guidance | Contribution to this template |
| --- | --- |
| Mission Model Canvas | Mission value, stakeholders, delivery, resources, and operating viability. Funding remains explicit in this adaptation. |
| Theory of Change | Intended changes, mechanisms, assumptions, evidence, and contextual dependencies. |
| Logic models | A compact account of inputs, activities, outputs, outcomes, and longer-term contribution. |
| Human-centered and participatory design | Learning with users and affected people and involving them in product decisions. |
| SWOT | Assessing internal capacity and external conditions, followed by practical responses. |
| Digital sustainability principles | Continued ownership, capacity, financial support, and appropriate transition or retirement. |
| Contribution analysis | Proportionate examination of whether and how the intervention contributed to observed change. |

### Sources

1. Alexander Osterwalder / Strategyzer, [The Mission Model Canvas: an adapted Business Model Canvas for mission-driven organizations](https://www.strategyzer.com/library/the-mission-model-canvas-an-adapted-business-model-canvas-for-mission-driven-organizations), 2016. Developed with Steve Blank from a mission-oriented context; used here as adaptable planning guidance.
2. Center for Theory of Change, [How Does Theory of Change Work?](https://www.theoryofchange.org/what-is-theory-of-change/how-does-theory-of-change-work/).
3. W.K. Kellogg Foundation, [Logic Model Development Guide](https://www.ncleg.gov/Files/ProgramEvaluation/PED/Resources/documents/LogicModelGuide.pdf), updated January 2004; foundation-authored guide hosted by the North Carolina General Assembly. See printed pages 1-4 and chapter 4.
4. IDEO.org, [What Is Human-Centered Design?](https://www.designkit.org/human-centered-design.html).
5. University of Kansas, Community Tool Box, [SWOT Analysis: Strengths, Weaknesses, Opportunities, and Threats](https://ctb.ku.edu/en/table-of-contents/assessment/assessing-community-needs-and-resources/swot-analysis/main).
6. Principles for Digital Development, [Design with people](https://digitalprinciples.org/principles/design-with-people/) and [Build for sustainability](https://digitalprinciples.org/principles/build-for-sustainability/).
7. HM Treasury / Evaluation Task Force, [Magenta Book Annex A: Analytical methods for use within an evaluation](https://www.gov.uk/government/publications/the-magenta-book/magenta-book-annex-a-analytical-methods-for-use-within-an-evaluation-html), updated 15 May 2026; section A1.4, Contribution analysis.

---

© Pieter Van Garderen (2026)
