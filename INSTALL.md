This is how to install the Smalltalk implementation of Trike v2.  Not all components are loading properly on Pharo 8.x yet, and there are several dependencies we need to replace before we can rewrite the UI, so these instructions assume you are either a Smalltalk developer or very adventurous.

## Prerequisites

 * [Pharo 8.x](https://pharo.org/download)
    * Download & install Pharo Launcher, then use it to create & launch a Pharo 8 image.  Yes, [we noticed the OS X security advice](https://github.com/octotrike/trike/issues/1).

## Installation

Once you are inside Pharo, there are many ways to install Trike.  The GUIest way is to use Iceberg, like this:

 - Tools -> Iceberg
 - +Add
 - Clone from github.com
    - Owner name: octotrike (or your own username if you have a fork)
    - Project name: trike
    - Local directory: If you are going to contribute to Trike, we recommend Pharo/projects or somewhere else OUTSIDE your Pharo/images directory.  This makes it easier to share your local git repository between images.
    - Protocol: OS X users probably want ssh; Windows users reputedly want https.
 - Right click on the trike repository
    - Optionally, -> Checkout branch (e.g. origin/pharo tends to be ahead of origin/default)
    - -> Metacello -> Install baseline of Trike (default)
         - In this context, `default` is the name of the baseline you want, NOT the name of the git branch you are on.

Or, if you are an experienced Pharo or other Smalltalk developer, you may prefer to run something like this in a Playground:

```Smalltalk
Metacello new
	repository: 'github://octotrike/trike:pharo/src';
	baseline: 'Trike';
	load
```

Assuming installation worked, it's a good idea to Pharo -> Save now, just in case.

## Updates

After you have Trike installed, you can get the latest version from inside Pharo by:

 - Tools -> Iceberg
 - Right click on the trike repository
    - Optionally, -> Checkout branch
    - -> Fetch
    - -> Pull
        - Select the revision you want
        - Pull
    -> Metacello -> Install baseline of Trike (default)

Or, you can use Pharo Launcher to get a fresh image and follow the instructions above to install the latest Trike.

---

Please [contact us](http://www.octotrike.org/contact) if you have problems, questions, or trip reports.
