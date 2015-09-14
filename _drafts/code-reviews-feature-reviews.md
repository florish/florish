---
layout: post
title: Code reviews vs. feature reviews
---

{{page.title}}
===============

Code reviews are part of my job. We have an agile workflows on our projects, where coworkers review my code, and I review theirs. We work with git feature branches and a pull request based workflow.

Over the last few weeks, I noticed my review results differed from most of the review results I got back from others. Most prominently, in my reviews I put:

* _more_ attention to how the overall feature worked for end users
* _less_ attention to the code itself, e.g. design patterns and coding style

This puzzled me: should I be worrying less about end users and just focus on the code itself? Of should the end user's perspective be part of any code review?

## Code reviews

What _is_ a code review anyway? [Wikipedia][] states a code review as follows:

> Code review is systematic examination (often known as peer review) of computer source code.

So, not all too surprisingly, code reviews seem to be limited to reviewing the code itself. Other sources ([1][codinghorror], [2][atlassian], [3][fogcreek]) affirm this. Most articles I see explain what a code review does, and why it's so important (catch bugs early, among other reasons).

I'm not seeing anything about checking out the source code, opening the application, and trying out the feature to see whether things works as expected.

But wait: don't we have automated tests for that? Sure we have. For example, in our Ruby on Rails projects, our test scripts simulate users logging in, clicking links, filling out forms, hitting buttons, and seeing the results we expect them to see.

As this is also part of the code base, any errors there would be caught by the reviewer, and that's that. Just hit "merge" and push the code in to production.

OK. Great.

We could stop there and  I'd like to argue we're missing part of the point of reviewing. While review the _code itself_ is a great thing to do, and surely better than _not_ doing it, I'd like a review to consider what the code _aims to achieve_. The latter is also called the "feature": the purpose for which the code was written in the first place.



*

-------

[Brightin]: http://www.brightin.nl
[1]: http://programmers.stackexchange.com/questions/275813/why-is-there-only-code-review

[wikipedia]: https://en.wikipedia.org/wiki/Code_review
[codinghorror]: http://blog.codinghorror.com/code-reviews-just-do-it/
[atlassian]: https://www.atlassian.com/agile/code-reviews
[fogcreek]: http://blog.fogcreek.com/effective-code-reviews-9-tips-from-a-converted-skeptic/
