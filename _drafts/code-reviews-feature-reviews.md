---
layout: post
title: Treat code reviews as feature reviews
---

{{page.title}}
==============

Consider you're on a team developing new features for a software application. You pick a feature, create a new branch in your version control system. You start coding and at some point, you open a pull request to merge your work into the application's main branch.

At that point, you probably ask a co-worker to do a code review.

In my day to day job, this is the workflow we use. Everyone on a development team both requests and conducts code reviews.

Over the last few weeks, I noticed my review results differ from most of the review results I get back from others. Most prominently, in my reviews I seem to put:

* _more_ attention to how the overall feature works for end users
* _less_ attention to the code itself, e.g. the use of design patterns and coding style

This puzzles me: should I be worrying less about end users and just focus on the code itself?

## Code review

First question to answer: what _is_ a code review anyway? [Wikipedia][] tells us this:

> Code review is systematic examination (often known as peer review) of computer source code.

Further reading ([1][codinghorror], [2][atlassian], [3][fogcreek]) gives articles on what a code review does, why it's important (e.g. catch bugs early), and considerations for both submitters and reviewers.

I'm not seeing anything about actually running the application, and trying out the feature from an end user perspective to see whether things works as expected. Apparently, this is not part of a code review.

## Naming things

So, what to call it then, a _feature review_ maybe? This turns out to be a term not all too commonly associated with programming. There's a [StackExchange question][stackexchange] asking about feature reviews as an addition to code reviews, but no definitive answers there.

Thinking about this some more, in software development, we do have a name for this kind of feedback. Two terms pop into my mind:

* Quality assurance (QA): dedicated testers systematically trying out a feature before delivering to customers and/or end users
* User acceptance (UA) tests: customers testing and formally accepting (or rejecting) features before putting them into production

As I see things, QA and UA are mostly considered as steps taken _after_ code reviews have been performed. While useful as extra safeguards, it's not the same as including this perspective into the code review process itself.

## Back to the feature

Let's do a thought experiment for a moment. Say we're working on an application, which currently has one feature called A. The customer requested a new feature called B, which got built and is currently awaiting peer review. Let's look at this from a code and a feature perspective.

What would a _code_ review reveal? I'd say a code review is considered with how we got from A to B. Logic can be optimized, edge cases tackled, bugs avoided, and so on.

In reviewing the _feature_, we're considering something else: are we getting from A to B in the first place? By trying out the application itself without looking at the code underneath, we force ourself to take on the perspective of an outsider. In my view, this is the only way to get close to the experience end users will have once the feature is rolled out. Often, I find myself asking questions like: does this 'feel' right? And it might even raise the question whether B was such a good idea in the first place. Isn't C what we actually meant, now that we see B in action?

Visually, this could look something like this:

Code review:

    A -/\^,---> B  ==>  A --------> B

Feature review:

    A -/\^,---> B  ==>  A ---XX--->
                                    C

In my experience, seeing C might be a better choice than B can be a very valuable lesson. Also, it is best learned as early in the development process as possible: the more we're already invested in B, the less we're inclined to consider C to be a viable alternative.

Therefore I'm suggesting to treat your next code review as a feature review. Start by testing the feature _as a whole_. If you think end users would be happy with the result, then (and only then!) it's time to dive into the code for further inspection.

----------

But wait: don't we have automated tests for that? Sure we have. For example, in our Ruby on Rails projects, our test scripts simulate users logging in, clicking links, filling out forms, hitting buttons, and seeing the results we expect them to see.

As this is also part of the code base, any errors there would be caught by the reviewer, and that's that. Just hit "merge" and push the code into production.

OK. Great.

I'd like to argue we're missing part of the point of reviewing.

While review the code itself is a great thing to do, and surely better than not doing it, I'd like a review to first and foremostly consider what the code _aims to achieve_. The latter is also called the "feature": the purpose for which the code was written in the first place.

---------

[wikipedia]: https://en.wikipedia.org/wiki/Code_review
[codinghorror]: http://blog.codinghorror.com/code-reviews-just-do-it/
[atlassian]: https://www.atlassian.com/agile/code-reviews
[fogcreek]: http://blog.fogcreek.com/effective-code-reviews-9-tips-from-a-converted-skeptic/
[stackexchange]: http://programmers.stackexchange.com/questions/275813/why-is-there-only-code-review
