I represent the software configuration of the Trike threat modeling tool.  I know where to find the currently loading Trike packages and the packages they depend on, for all the platforms Trike runs on, starting with Trike v2.  (There is currently no way to load Trike v1.)

Metacello uses me to download & install the required packages.  For example:

```Smalltalk
Metacello new
	repository: 'github://octotrike/trike/src';
	baseline: 'Trike';
	load
```

Or, if you have your own fork already checked out:

```Smalltalk
Metacello new
  baseline: 'Trike';
  repository: 'filetree://', '/PATH/TO/SRC';
  load.
```

I'm a very simple subclass of BaselineOf.  The best resource for understanding my use and API, and especially how to modify me to load more and more of Trike, is the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) documentation on the Pharo wiki.