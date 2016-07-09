---
title: NPCs and Quests
layout: default
---

Each town has NPCs roughly equal to the number of houses.
NPCs generate quests.

### NPC roles

Each NPC has a role. Each role can have special quests

* King
	* Retrieve treasure from dungeon
	* Deliver messages
* Knight
	* ???
* Shop keeper
	* Retrieve treasure from dungeon
* Tavern
	* ???
* Blacksmith
	* Fetch rare metal
* Maid
	* ???
* Thief
	* Steal from this house
	* Assassinate this person
* Wife/Husband
	* ???
* Farmer
	* Bandits are stealing all their havests, clear the bandits

### Story overarch

Yet to be decided. It is possible to generate overarching stories using
heuristics. For a civil war story, you could choose a capital city
(probably the spawn city) and then have the player deliver messages
and ambush troops in certain locations.

### Rate Limiting

* Each NPC only has one side quest at a time.
* Each town has maximum 10 side quests (number will be changable).

### Potential Problems

* Pregeneration of villages to act as story devices.
	* mg_villages only works so far, and I want to make villages fairly spread apart.
