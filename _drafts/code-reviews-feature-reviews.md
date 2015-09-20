---
layout: post
title: Feature review first, code review later
---

{{page.title}}
==============

_You want me to do a code review? Great, let's dive into the code right away! But what if I'd say your review results might improve by prepending a "feature review" step?_

Where I work, everybody requests and conducts code reviews. Over the last few weeks, I noticed my review results differ from most of the review results I get back from co-workers. Most prominently, in my reviews I seem to put:

* _more_ attention to how the overall feature works for end users
* _less_ attention to the code itself, e.g. the use of design patterns and coding style

This puzzled me: should my reviews worry less about end users and focus more on the code itself? My answer turned out to be "no". The rest of this post aims to explain why.

## Code review

First question to answer: what _is_ a code review anyway? [Wikipedia][] tells us this:

> Code review is systematic examination (often known as peer review) of computer source code.

Further reading ([1][codinghorror], [2][atlassian], [3][fogcreek]) gives articles on what a code review does, why it's important (e.g. catch bugs early), and considerations for both submitters and reviewers.

I'm not seeing anything about the end user perspective -- actually running the application, and trying out the feature to see whether things work as intended.

## Naming things

So, what to call this other part then, a _feature review_ maybe? This turns out to be a term not all too commonly associated with programming. There's a [StackExchange question][stackexchange] asking about feature reviews as an addition to code reviews, but no definitive answers there.

Thinking about this some more, in software development, we do have a name for this kind of feedback. Two terms pop into my mind:

* Quality assurance (QA): dedicated testers systematically trying out a feature before delivering to customers and/or end users
* User acceptance (UA) tests: customers testing and formally accepting (or rejecting) features before putting them into production

As I see things, QA and UA are mostly considered as steps taken _after_ code reviews have been performed. While useful as extra safeguards, it's not the same as including this perspective into the code review process itself.

In lack of a better name, let's stick to _feature review_ for the rest of this post and define it as "reviewing a feature's usefulness from an end user's perspective".

## Back to the feature

Now we have two concepts: code review and feature review.

Let's do a thought experiment for a moment. Say we're working on an application, which currently has one feature called A. The customer requested a new feature called B, which got built and is currently awaiting peer review. Let's look at this from a code and a feature perspective.

What would a _code_ review reveal? I'd say a code review is considered with how we got from A to B. Logic can be optimized, edge cases tackled, bugs avoided, and so on.

In reviewing the _feature_, we're considering something else: are we getting from A to B in the first place? By trying out the application without looking at the code underneath, we force ourself to take on the perspective of an outsider. In my view, this is the only way to get close to the experience end users will have once the feature is rolled out. Often, I find myself asking questions like: does this 'feel' right? And it might even raise the question whether B was such a good idea in the first place. Isn't C what we actually meant, now that we see B in action?

Visually, this could look something like this:

Code review:

    A -/\^,---> B  ==>  A --------> B

Feature review:

    A -/\^,---> B  ==>  A ---XX--->
                                    C

In my experience, seeing C might be a better choice than B can be a very valuable lesson. Also, it is best learned as early in the development process as possible: the more we're already invested in B, the less we're inclined to consider C to be a viable alternative.

Therefore I'm suggesting to treat your next code review as a feature review. Start by testing the feature _as an end user_. If you're happy with the result, then (and only then!) it's time to dive into the code for further inspection.

--------

## Outline for code example rewrite

Admin:

* List users
* Fill in form
* Save and automatically send activation email

New user:

* Visit activation link in email
* Enter new password
* Save password and automatically log in and redirect


Code review might reveal things like:

* Consider rewriting the new user form using a form builder plugin
* Send activation email in a background job instead of inline
* Use full URL instead of relative path in activation email body
* Replace custom redirect code by authentication plugin's redirect feature


Feature review:

* How to resend the activation mail after fixing a typo in the email address? Maybe decouple user create logic from sending the activation mail?
* The activation HTML email layout looks a bit weird on my mail client
* The new password page has not been translated yet, some labels are still in English (should be Dutch)


--------



[wikipedia]: https://en.wikipedia.org/wiki/Code_review
[codinghorror]: http://blog.codinghorror.com/code-reviews-just-do-it/
[atlassian]: https://www.atlassian.com/agile/code-reviews
[fogcreek]: http://blog.fogcreek.com/effective-code-reviews-9-tips-from-a-converted-skeptic/
[stackexchange]: http://programmers.stackexchange.com/questions/275813/why-is-there-only-code-review
