---
title: NPCs
layout: default
---

Each town has NPCs roughly equal to the number of houses.
NPCs generate [quests](quests.html).

### Required Capabilities

* Conversation: players can right click to talk to the NPC
* Off screen movement: need to be able to move to a different location
* Combat: should attack threatening players and monsters
* Wandering: for atmosphere, should wander around the town

Solution: finite state machine

### States

* Talking - in this state whilst in dialogue.
* Fight state - attacking a target or group of targets. Refuses dialogue.
* Waiting state - waiting for a player to approach them, say for a quest.
    May only accept dialogue from one player.
* Idle state - standing still. Accepts dialogue.
* Wander state - uses the pathfinder to work around. Accepts dialogue.

### Transition

on_rightclick will call will_accept_dialogue(player) on state to see if they can
accept converstation from player

### Offscreen navigation

NPC framework deletes NPCs when they are loaded from an chunk, and then manually
places them when a chunk is loaded. This shouldn't be a problem then.

### NPC roles

NPCs can be:

* King
* Knight
* Shop keeper
* Inn keeper
* Blacksmith
* Maid
* Thief
* Farmer
* Guard
* Bandit

### Quest instructions

NPCs will store instructions in their persistent storage.
For example, which state they should be in, the name of the quest, any dialogue
trees. It should also maybe be possible for a quest to register a state to control
the NPC say in scripted stories.

### NPC searching

The quest allocator will need to search for an available NPC to assign a quest to
