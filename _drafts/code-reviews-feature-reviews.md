---
layout: post
title: Back to the feature
---

{{page.title}}
==============

_Feature review first, code review later_

**Step one in a code review: read the programming code. But what if I say your review results might improve by prepending a "feature review" step?**

Where I work, everybody requests and conducts code reviews. Over the last few weeks, I noticed my review results differ from the review results I get back from co-workers. Most prominently, in my reviews I seem to put:

* _more_ attention to how the overall feature works for end users
* _less_ attention to the code itself, e.g. the use of design patterns and coding style

This puzzled me: should my reviews worry less about end users and focus more on the code itself? My answer turned out to be "no". The rest of this post explains why.

## On code reviews

First question to answer: what _is_ a code review anyway? [Wikipedia][] tells us this:

> Code review is systematic examination (often known as peer review) of computer source code.

Further reading ([1][codinghorror], [2][atlassian], [3][fogcreek]) gives articles on what a code review does, why it's important (e.g. catch bugs early), and considerations for both submitters and reviewers.

I'm not seeing anything about the end user perspective -- actually running the application, and trying out the feature to see whether things work as intended.

## Naming things

So, what to call this other part then, a _feature review_ maybe? This turns out to be a term not all too commonly associated with programming. There's a [StackExchange question][stackexchange] asking about feature reviews as an addition to code reviews, but no definitive answers there.

Thinking about this some more, in software development, we do have names for this type of feedback. Two terms pop into my mind:

* Quality assurance (QA): dedicated testers systematically trying out a feature before delivering to customers and/or end users
* User acceptance (UA) tests: customers testing and formally accepting (or rejecting) features before putting them into production

As I see things, QA and UA are mostly considered as steps taken _after_ code reviews have been performed. While useful as extra safeguards, it's not the same as including this perspective into the code review process itself.

In lack of a better name, we'll stick to _feature review_ for the rest of this post and define it as "reviewing a feature's usefulness from an end user's perspective".

## Example: user management

Now that we have code review and feature review defined, how do these concepts relate? This is perhaps best shown by example. (This example is a simplified version of a real situation encountered at work.)

Say we have an application with a feature request from a customer:

> Administrator users should be able to create and activate new (non-admin) users

This feature has been built and is now ready for review.

The current implementation is designed as follows:

* Administrator clicks "New user" link on the Users index page
* Fills in form fields (name, e-mail address) and clicks "Save" button
* On success, the system automatically sends an activation e-mail
* A confirmation message is shown on the screen

### Code review

Reviewing the programming code might reveal things like:

* The code for generating the new user form seems a bit verbose. Consider rewriting the form using a form builder plugin.
* On saving the user, the response is halted until the e-mail has been sent. Consider decreasing the response time by sending the activation e-mail in a background job instead.

### Feature review

Trying out the feature as an administrator might reveal issues such as:

* The "New user" link is positioned below the user list. I already had a couple of test users in my database and couldn't find the link right away. Maybe move the link to the top?
* I made a typo in the e-mail address and couldn't find a way to resend the activation mail after fixing it. Maybe we should decouple sending the activation mail from creating the new user?

## Is it doing the job?

Looking at the code review feedback, I'd say it suggests _code_ improvements _given the current design_. The feature review, on the other hand, suggests _design_ improvements _given the requested feature_. Put in another way:

* Feature review asks: is it doing the job _at all_?
* Code review asks: is it doing the job _well_?

For me, the _at all_ question should always be answered first: if the current version of the feature is not doing the job at all, don't even bother optimizing the code behind it. Chances are the current code has to be rewritten anyway.

This is also illustrated by the feedback on the send activation e-mail process from our example. While the code review suggestion of moving e-mail logic into a background job makes a lot of sense, the feature review reveals a design flaw: an administrator cannot resend activation mails for the same user. This means we have to rewrite parts of our code, and it's usually best to do this (separate activation from creation) before optimizing one part (offloading e-mail sending to a background job).


------------

(stuff below not part of the post)

## Design choices

## Some afterthoughts

Of course, design choices in developing a feature have been made way before the code gets reviewed. But until a feature has been completed, these design choices are always assumptions, as the actual feature has not been built yet. Once a review is requested, the feature _is_ real, and it makes sense to explicitly verify the design choices made earlier.


--------



[wikipedia]: https://en.wikipedia.org/wiki/Code_review
[codinghorror]: http://blog.codinghorror.com/code-reviews-just-do-it/
[atlassian]: https://www.atlassian.com/agile/code-reviews
[fogcreek]: http://blog.fogcreek.com/effective-code-reviews-9-tips-from-a-converted-skeptic/
[stackexchange]: http://programmers.stackexchange.com/questions/275813/why-is-there-only-code-review
