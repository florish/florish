---
layout: post
title: Shortening the feedback loop
---

{{page.title}}
==============

**Getting feedback early and often during software development often leads to great results. But how can we make this happen every single time? Here's four ways how: start together, stay in touch, move out extra work, and give reviews priority.**

## Start together

Where I work, project teams usually consist of two to four developers. One team member also takes on the role of lead developer. This includes converting short user stories into more detailed technical feature descriptions. These are then assigned to developers on the team.

As reasonable as this sounds, separating analysis from development also means missing an opportunity for discussion. As a lead developer, I found it quite hard to think out all development steps without actually, well, _developing_ anything. And even when I thought I had written out a detailed plan that just couldn't go wrong, in practice, my words still turned out be interpreted differently.

Our solution was to start with just 15 to 30 minutes of talking things through when starting on a new feature. This allows the lead developer to explain choices made in the preparation progress. The developer building the feature can ask questions and, more importantly, becomes an active part in the thought process behind the code that eventually needs to be written.

## Stay in touch

Good, so we're off to a great start. We discussed the desired outcome and first steps to take. Let's say that for a particular feature, we decided to use an open source plugin of some sorts to add some animations to our application. Getting the plugin up and running should be easy, and we expect to have a first working animation by the end of the morning.

Unfortunately, things turn out to be not so simple. The plugin's default settings do not work for our particular use case, the documentation is outdated, and we keep getting errors we can't track down. By the end of the morning, we finally have the plugin installed, but we can't demo anything at this point.

What to do at this point? Simple: hack on to get something working. After all, the idea was to have progress, and we don't have progress at this point. We simply need to do some extra work to get to that point.

While this is a pretty natural thing to do, we found this to be counterproductive. If you and your co-worker expected something to be done after two hours of work, but in practice, you're not even half way, this may indicate the current approach is not the right one. This is an issue that needs to be addressed, not ignored. And addressing the issue means getting together and talking about it.

One way to put this into practice is by moving from "let's meet again after these steps are finished" to "let's meet every day at 10 AM, 1 PM and 4 PM", regardless of progress.

## Move out extra work

Both previous points help avoid taking wrong turns without having a mechanism to get back on track. Another possible detour is extra work being added to a feature after development has already begun. Some example of extra work we've seen creeping in:

* refactoring unrelated code smells you happened to come across;
* doing the next feature right away, because it builds upon the current one;
* immediately applying a newly added improvement to other parts of the application.

When working on features, we use checklists a lot for keeping track of the actions needed. While working on features, we sometimes saw initial 3 item checklists expand to 20 or even 30 items.

The first time this happened, we muddled through, ending up with a pull request containing over hundred commits and thousands of lines of code. This became unmanageable for all kinds of reasons, one being that reviewing such a large amount of code is difficult to do.

Instead of expanding the feature along the way, we now try to move out any parts of the feature not absolutely necessary to fulfill the original user story. These parts become separate features to be developed later. This allows us to focus on the core feature at hand, without having to worry about things falling through the cracks if we do not implement them right now.

## Give reviews priority

We started our feature, discussed progress, moved out extra stuff, and now we're done. The feature is ready for review. What can a reviewer do to speed things up?

One answer is this: give reviews priority over other work. This not only speeds up finishing the current feature, but also ensures next features are built on top of the latest and greatest codebase.

In our Git workflow, a review is the last step before merging a feature branch back into. The longer a feature branch exists alongside master, the more chance you have for merge conflicts, difficult rebase situations and other kinds of merging mayhem. With multiple features in development simultaneously, this problem only get worse.

While doing reviews quickly is a great tool for shortening the feedback loop, I'm not suggesting doing reviews fast-paced just to merge stuff in to master. Do take the time to [check things thoroughly]({% post_url 2015-10-10-back-to-the-feature %}) before giving the final go (or no go) on a feature.

## Conclusion

If you want short feedback loops, start together, stay in touch, move out extra work and give reviews priority.

Is that all there is to it? Of course not! There's lots more: pair programming, automated test suites, rapid application development, just to name a few. But comprehensiveness is not the value of these four principles.

The value is that they are simple to explain and easy to apply to every feature, every day. So for your next feature, simply start by talking things through with someone, and hopefully you'll be pleasantly surprised.
