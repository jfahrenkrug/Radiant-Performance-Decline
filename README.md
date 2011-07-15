Performance Decline Demo: Radiant 0.8.1 vs 0.9.1
================================================

We have seen that the performance of Radiant 0.9.1 is way lower that
that of Radiant 0.8.1 in certain cases.

This project was tested with ruby-1.8.7-p302.

Gems for the Radiant 0.8.1 demo app:
------------------------------------

* rack (1.0.1)
* radiant (0.8.1)
* rake (0.8.7)
* RedCloth (4.2.7)
* sqlite3 (1.3.3)

Gems for the Radiant 0.9.1 demo app:
------------------------------------

* rack (1.1.2)
* radiant (0.9.1)
* rake (0.8.7)
* RedCloth (4.2.7)
* sqlite3 (1.3.3)
* will_paginate (2.3.15)

Background
==========

This app has an empty layout and two pages that contain 46k and 460k of
plain text: no markup, no snippets, nothing.
On Radiant 0.8.1, the 46k page takes about 28ms to render, the 460k page takes about 32ms to render. On Radiant 0.9.1
exactly the same content takes way longer: 46k take about 900ms to
render and 460k take about 9400ms(!) to render.

How to run
==========

Just start the Rails server with script/server -e production in either
of the project folders, open the homepage and try out the 46k and 460k
pages. 

How to run the profiling test
=============================

Make sure you have the ruby-prof gem installed. Then run

    RAILS_ENV=production ruby script/console
    require 'test.rb'

then you'll find a ruby-prof profile in tmp/profile-graph.html.
