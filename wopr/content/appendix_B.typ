= Appendix B: Literature Review Protocols <app:lit-review-protocols>

== Key Definitions
+ *Artificial Intelligence (AI):* The use of computers to carry out tasks that previously required human intelligence.
+ *Wargame:* A multi‑faceted depiction of conflict with one or more parties in which the participants’ decisions influence the future outcomes of events.
+ *Open-ended:* Games where rules permit *unconstrained natural-language moves*, allowing players to propose novel actions beyond a preset menu. Outcomes are adjudicated by facilitators, subject matter experts, or dynamic rules rather than a fixed payoff matrix. Seminar wargames or Diplomacy (with negotiation phases) exemplify this approach, contrasting with constrained games like Chess or Go or rigid social games like Werewolf or Among Us.
+ *Analytical wargame:* Formats that track numeric scores, payoffs, probabilities, or optimization objectives, though they may still contain open-ended dialogue components. Examples include Chess, Starcraft 2, and other stochastic combat models.
+ *Creative wargame:* Games relying on narrative adjudication or subject matter expert judgment with minimal or no numeric scoring. Tabletop seminar games with after-action discussions represent this category.
+ *Language-centric game:* Formats where progress depends fundamentally on *textual or spoken communication* among actors (human or LM). CICERO Diplomacy and conflict negotiations exemplify this approach @meta_fundamental_ai_research_diplomacy_team_human-level_2022, contrasting with action-based games like _StarCraft_, where LM-powered bots handle micromanagement.

== Analytical vs Creative Axes

We treat analytical and creative emphases as two axes of open‑endedness: one for the player
agent (the actor who proposes moves) and one for the adjudicator agent (the entity that
determines outcomes via rules or judgment). Hereafter we refer to them simply as “player” and
“adjudicator.” We avoid numeric scales and use categorical labels: Analytical or Creative.

#figure(
  placement: top,
  scope: "parent",
  table(
    columns: (auto, auto, auto),
    stroke: none,
    column-gutter: 1em,
    align: left,
    table.hline(),
    [*Axis*], [*Analytical*], [*Creative*],
    [Player], [Fixed scripts; narrow menus], [Novel proposals; free‑form argumentation],
    [Adjudicator], [Deterministic rules/tables], [Expert narrative judgment; flexible calls],
    table.hline()
  ),
  caption: [Open‑endedness axes with categorical levels (Analytical/Creative) for player and adjudicator],
)


