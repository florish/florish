---
layout: post
title: Shortening the feedback loop
---

{{page.title}}
==============

**In a recent project retrospective, we found that the best work we delivered had short feedback loops during the development process. Here are four lessons for getting feedback early and often.**

This article is about improving _internal_ feedback between developers. Getting timely _external_ feedback from customers (e.g. acceptance testing) can be of equal importance, but lessons on this would be better served in an article of its own.

With this out of the way, here's lesson number one.

## Lesson 1: Start together

Where I work, project teams usually consist of two to four developers. One team member also takes on the role of _lead developer_. This includes converting short user stories into more detailed technical feature descriptions. These can then be assigned to developers on the team.

As reasonable as this sounds, separating architecture from development also means missing an opportunity for discussion. As a lead developer I found it quite hard to think out development steps without actually, well, _developing_ anything. And even when I thought I had written out a detailed plan that just couldn't go wrong, in practice, my words still turned out be interpreted differently.

Just half an hour of talking things through often results in improved ideas over whatever was thought out before. The lead developer can explain choices made in the preparation progress. The developer building the feature can ask questions and, more importantly, be an active part in the thought process behind the code that eventually needs to be written.

## Lesson 2: Keep getting together

Good, so we're off to a great start. We discussed the desired outcome and first steps to take. Let's say that for this particular feature, we decided to use an open source plugin of some sorts to add animated transitions to our application. Getting the plugin up and running should be easy, and we expect to have a first working transition by the end of the morning.

Unfortunately, things turn out to be not so simple. The plugin's default settings do not work for our particular use case, the documentation is outdated, and we keep getting errors we can't track down. By the end of the morning, we finally have the plugin installed, but we can't demo anything at this point. In a couple of hours more, we should be fine though.

What to do at this point? I'm guessing most developers would likely go ahead and hack on to get something working. After all, the idea was to have progress, and we don't have progress at this point, so we simply need to to some extra work to get to that point.

While this is a pretty natural thing to do, we found this to be counterproductive. If you and your co-worker expected something to be done after two hours of work, but in practice, you're not even half way, this may indicate the current approach is not the right one. This is an issue that needs to be addressed, not ignored. And addressing the issue means getting together and talking about it.

We put this into practice by moving from "let's meet again after these steps are finished" to "let's meet every day at 10 AM, 1 PM and 4 PM", regardless of progress.

## Lesson 3: Move out extra work

Both previous lessons help avoiding taking the wrong turn without having a mechanism to get back on track. Another form of detour is extra work being added to a feature after development has already begun. Types of extra work we see creeping into a feature include:

* unanticipated extra work needed to get the original feature working;
* refactoring unrelated code smells you happened to come across;
* doing the next feature right away, because it builds upon the current one;
* immediately applying a newly added improvement to other parts of the application.

When working on features, we use checklists a lot for keeping track of the actions needed. While working on features, we sometimes saw initial five item checklists expand to twenty or even thirty items.

The first time this happened, we muddled through, ending up with a pull request containing over hundred commits and thousands of lines of code. This became unmanageable for all kinds of reasons, one being that reviewing such a large amount of code is difficult to do.

Instead of expanding the feature along the way, we now try to move out any parts of the feature not absolutely necessary to fulfill the original user story. These feature parts become separate features to be developed later. This allows us to focus on the core feature at hand, without having to worry about additional ideas falling through the cracks if we do not implement them right now.

## Lesson 4: Give reviews priority

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




