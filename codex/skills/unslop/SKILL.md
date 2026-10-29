---
name: unslop
description: Cut AI tells from writing while preserving meaning and voice.
---

# Unslop

Scan the text for the patterns below, then make the smallest useful edits. Match the intended tone. Treat patterns as signals, not automatic replacements, except for the explicit punctuation rules.

Preserve facts, meaningful uncertainty, technical terms, and useful structure. Leave code, commands, identifiers, URLs, and direct quotations unchanged unless asked to edit them. Never invent sources, measurements, or technical details to make a sentence more concrete.

Return the edited text. Add a brief note only when an unresolved factual issue materially affects the edit.

## Patterns to detect and fix

Rule numbers are stable IDs that other skills can cite. Removed rules leave gaps.

### Content

3. **Empty participial phrases.** Cut trailing phrases such as "highlighting its importance" or "showcasing its potential" when they add no fact. Keep phrases that explain an actual action or consequence.
5. **Vague attributions.** "Experts believe" and "industry reports suggest" imply evidence without identifying it. Name a source already supplied or verified, or remove the attribution. Flag an unsupported claim when deleting it would change the argument.

### Language

7. **AI vocabulary.** Replace inflated or stock wording with plain words. Watch for "delve", "pivotal", "tapestry", "testament", "underscore", "garner", "fostering", and abstract uses of "landscape". Keep a word when it has a precise meaning in context.
8. **Fancy ways to say "is" or "has".** Replace empty uses of "serves as", "stands as", and "boasts". Keep "features" when it describes actual functionality.
9. **"Not just X, but Y."** State the point directly. Keep a contrast only when the distinction matters.
10. **Forced groups of three.** Remove padding added to complete a trio. Keep three items when all three matter.
11. **Synonym cycling.** Use a consistent name for the same thing. Do not rotate terms merely to avoid repetition.
12. **False ranges.** Replace "from X to Y" with a direct list when X and Y do not form a meaningful scale or sequence.

### Style

13. **Em dashes.** Use periods or commas instead. Do not substitute parentheses, en dashes, or hyphens used as dashes. Keep punctuation required by technical notation.
14. **Connector colons.** Keep colons before lists or examples. Rewrite sentences that use a colon to join an introductory comparison to the actual point.
15. **Excessive boldface.** Remove emphasis from routine proper nouns, acronyms, and repeated keywords.
16. **Redundant inline headers.** Rewrite entries such as "**Performance:** Performance improved...". Keep useful lead-ins that name an item and introduce new detail.
17. **Title case headings.** Use sentence case, preserving proper names.
18. **Decorative emojis.** Remove them from headings and bullets unless they convey information.
19. **Curly quotes.** Use straight quotes in editable prose.

### Communication artifacts

20. **Chatbot phrases.** Remove "I hope this helps", "Let me know if...", "Certainly", and similar preambles or sign-offs that add nothing.
22. **Sycophancy.** Cut reflexive praise and agreement such as "Great question" or "You're absolutely right". Keep substantive acknowledgment when it matters.

### Filler

23. **Filler phrases.** Shorten "in order to" to "to" and "due to the fact that" to "because". Delete "it is important to note that".
24. **Stacked hedging.** Reduce "could potentially possibly" to the qualifier the evidence supports. Preserve meaningful uncertainty.
25. **Generic conclusions.** Cut endings such as "the future looks bright". End with a supported fact or actual next step when one exists.

### Technical writing

26. **Abstract metaphor nouns.** Replace "nexus", "bedrock", "north star", "flywheel", "scaffolding", and similar metaphors with the concrete thing they mean. Keep established technical terms when a replacement would reduce precision.
27. **Feelings instead of behavior.** Replace "types that follow your schema" with the actual behavior, such as "a column rename fails the build", only when supported. Cut interchangeable praise. Keep general explanations the reader needs.
28. **Dense sentences.** Split clauses when the reader must backtrack to understand them. Do not break clear prose into choppy fragments.
30. **Empty intensifiers.** Remove "significantly", "seamlessly", and "effortlessly" when they substitute for evidence. Use a measured difference only when supplied or verified. Keep qualifiers that change the meaning.
32. **Mannered prose.** Replace rhetorical fragments, personified code, and flourishes such as "a dial worth turning" with literal wording such as "a parameter worth varying". Preserve deliberate humor or imagery that suits the author's voice.
33. **Over-compression.** Restore articles and verbs when edits make the reader decode fragments, arrows, or abbreviations. Concise prose still needs complete thoughts.
34. **Inflated significance.** Replace "marks a major milestone" or "sets a new standard" with what changed and its supported consequence. Do not manufacture importance.
