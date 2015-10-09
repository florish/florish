---
layout: post
title: Back to the feature
---

{{page.title}}
==============

_Feature review first, code review later_

**Step one in a code review: read the code. But what if I told you your review results might improve by prepending a "feature review" step?**

Where I work, everybody requests and conducts code reviews. Lately, I noticed my review results differ from the results I get back from co-workers. Most prominently, in my reviews I seem to put:

* _more_ attention to how the overall feature works for end users;
* _less_ attention to the code itself, e.g. the use of design patterns and coding style.

This puzzled me: should my reviews focus less on end users and more on the code itself? My answer turned out to be "no". The rest of this post explains why.

## Naming things

Literature on code reviews ([Wikipedia][], [1][codinghorror], [2][atlassian], [3][fogcreek]) does not mention the end user perspective -- actually running the application, and trying out the feature to see whether things work as intended.

So, what to call this other part then, a _feature review_ maybe? This turns out to be a term not all too commonly associated with programming. There's a [StackExchange question][stackexchange] mentioning it as an addition to code reviews, but no definitive answers there.

To be sure, we do have names for this type of feedback. Two terms pop into my mind:

* Quality assurance (QA) -- dedicated testers systematically trying out a feature before delivering to customers and/or end users;
* User acceptance (UA) tests -- customers testing and formally accepting (or rejecting) features before putting them into production.

QA and UA are mostly considered as steps taken _after_ code reviews have been performed. While useful as extra safeguards, it's not the same as including this perspective into the code review process itself.

In lack of a better name, we'll stick to _feature review_ for the rest of this post and define it as "reviewing a feature's usefulness from an end user's perspective".

## Example: user management

How do code reviews and feature reviews relate? This is perhaps best demonstrated with an example. (This example is a simplified version of a real situation encountered at work.)

Say we have an application with a feature request from a customer:

> Administrator users should be able to create and activate new (non-admin) users

This feature has been built and is now ready for review. The current implementation is designed as follows:

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

The code reviews suggests _code_ improvements _given the current design_. The feature review, on the other hand, suggests _design_ improvements _given the requested feature_. Put in another way:

* Feature review asks: is it doing the job _well_?
* Code review asks: is it doing the job _cleanly_?

For me, the _well_ question should always be answered first: if the current version of the feature is not doing a good job, don't even bother optimizing the code behind it. Chances are the current code has to be rewritten anyway.

This is also illustrated in the example. The feature review suggests separating _creating_ a user from _activating_ it. This enables administrators to resend activation mails. Adding this functionality should be considered before implementing the code review optimization of sending the e-mail in a background job.

## Conclusion

While a code review may suggest it is about code _only_, such a limited perspective can lead to optimized code that does not work well for end users. Avoid this trap by first reviewing a feature from and end user perspective. Play around and check if everything feels right and works as expected. If so, go ahead and dive into the code for further inspection. If not, fix the feature first -- and the code later.

------------

### Afterthought: feature design

Of course, feature design should be discussed way before reviewing the resulting code. But until a feature has been built, design choices are based on assumptions. Once a review is requested, the feature _is_ real, making it possible to explicitly verify the design choices made earlier.


[wikipedia]: https://en.wikipedia.org/wiki/Code_review
[codinghorror]: http://blog.codinghorror.com/code-reviews-just-do-it/
[atlassian]: https://www.atlassian.com/agile/code-reviews
[fogcreek]: http://blog.fogcreek.com/effective-code-reviews-9-tips-from-a-converted-skeptic/
[stackexchange]: http://programmers.stackexchange.com/questions/275813/why-is-there-only-code-review
