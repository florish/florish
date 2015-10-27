---
layout: post
title: Shortening the feedback loop
---

{{page.title}}
==============

On a project retrospective, we found that the best work we delivered had short feedback loops during the development process. Also, we were least satisfied with work that took a long and lonely road before being reviewed by another person. How can we ensure feedback is at the core of our development process?

A while ago, when talking about software development, a [colleague](http://www.arjanvandergaag.nl) semi-jokingly said:

> Feedback is the currency of software development

We laughed at the statement's cheesiness, and got back to work.

... something on how this turned out to be pretty much our retrospective conclusion ...

## How we manage projects

Where I work, project teams usually consist of two to four developers, one of which also has the role of _project owner_. Being a project owner means tracking project progress, arranging meetings with the client, and also making sure features are ready for development. The suggestions presented in this article are mostly based on my personal experiences as a project owner.

Project progress is tracked using [Trello](https://trello.com). A typical project board looks something like this:

<<BOARD PICTURE>>

[Lists on the board:]

* Backlog
* Up Next
* Doing
* Review
* Master / Staging

Each card on the board represents a feature. Progress is tracked by moving feature between lists (Trello's name for the columns on a board).

A project owner is responsible to keep the Up Next list populated with features prepared and ready for development. As the project owner is the main contact for the client, he or she usually knows most about the client's domain. This knowledge comes in handy when prioritizing work to be done next (usually together with the client) and turning a high level user story into concrete steps to be taken for development.

Once this is done, the first available developer simply picks the top card from Up Next, put his or her name on it and moves it to Doing.

## Start together

As simple as this sounds, in practice, it is quite hard to think out development steps without actually, well, _developing_ anything. However detailed a feature description may be, starting development on your own means missing an opportunity for discussion.

An hour of talking often results in improved ideas over what has been thought out before. A project owner can explain choices made in the preparation progress. A developer can ask questions and, more importantly, be an active part in the thought process behind the code that eventually needs to be written.

## Keep getting together

When starting together, work towards clear next steps to take and when to discuss progress. Make these steps actionable (the smaller the better) and plan your next meeting. Ideally, this next meeting should be held after no more than a couple of hours work (e.g. a single morning or afternoon).

In this next meeting, make sure to again define next steps and a next meeting. If progress isn't as good as expected, do not postpone getting together. Lack of progress may very well indicate the current direction is not the right one after all -- an issue that needs to be addressed, not ignored.

Keep iterating until the work is done and ready to move to the next list on the Trello board.

## Move out extra work

We use Trello's checklists a lot for dividing work into smaller parts. While working on features, we sometimes saw initial five item checklists expand to twenty or even thirty cards.

The first time this happened, we muddled through, anding up with a pull request containing about a hundred commits and thousands of lines of code. This is not good for all kinds of reasons, one being that reviewing such a large amount of code is difficult to do.

Instead of expanding the feature along the way, consider moving parts of the original feature to new cards. (Trello support this by offering a "Convert to Card" feature for every checklist item.)

This allows you to focus on the core feature at hand, with Trello helping you keep track of missing parts to be developed later on.

OUTLINE:

* Create new cards for non-essential functionality
* Avoid putting multiple cards into a single pull request

## Give reviews priority

So now we moved our feature from Up Next to Doing, did some work, moved out extra stuff to new cards, and now we're done. The card is moved from Doing to Review. What can the reviewer do to speed things up?

That's easy: give reviews priority over other work. This not only speeds up finishing the current feature, but also ensures next features are built on top of the latest and greatest codebase.

In our workflow, a review is the last step before merging a feature branch into master. While the original feature developer can already start working on a new feature by creating a new branch from the pre-merge master, this is not ideal, as we probably need to rebase that work after merging the previous feature.

Creating a new branch from an unmerged feature branch is another possibility. While this ensures the previous feature is already included, we found this to give all kinds of merging mayhem later on in development, especially when review feedback leads to new commits on the original feature branch. After having dealt with a situation a couple of times, we now avoid this whenever possible.

While doing reviews quickly is a great tool for shortening the feedback loop, I'm not suggesting doing reviews fast-paced just to merge stuff in to master. Do take the time to thoroughly check things before giving the final go (or no go) on a feature.

OUTLINE:

* Giving feedback on someone else's feature is more important than working on your own stuff
* Don't forget: giving good feedback takes time, allow this time to be spent

## Conclusion

...

------------------------

## RANDOM IDEAS

~~~
..... ..... .....
----- ----- -----
===== ===== =====

|-_-| |#_#| |*_*|
  -------------
   |@_@| |~_~|
~~~

If getting together is so essential, why not go all the way and do pair programming only?

Yes, well, that's a good question. For us, this would currently be quite a paradigm shift. For the better, possibly, but a paradigm shift nonetheless.


## Start together

Manage items example

* What do you mean by "items"?
* What fields are there?
* Simple list and form approach, or do we need more?

Not starting together revealed words can me interpreted in so many ways.

Opposite: just start building stuff, assuming the project owner must have had his of her reasons for the suggested implementation. We'll see how it goes and meet later.


## Keep getting together

As you build, you learn and make lots of decisions. Sometimes these are good decisions, sometimes they are not so good.

It's easy to get sidetracked by unnecessary extras.

Opposite: muddling through alone, hoping (wishing) for that "Eureka!" moment.


## Move out extra work

Split up the work into multiple cards.

Ignoring this advice: keep on expanding that pull request, just because someone created a card which included all of this work (wow, this is a BIG feature! So much more work than we thought)

Opposite: doing that related feature, which would be next anyway, right away and include it in the branch you're already on.


## Give feedback priority

Opposite: finish your own work first and let the reviewee muddle through, or worse, wait for you to be done before taking up the next card.




