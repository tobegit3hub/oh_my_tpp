# Oh My Tpp

[![TravisCI status](https://secure.travis-ci.org/tobegit3hub/oh_my_tpp.png)](http://travis-ci.org/tobegit3hub/oh_my_tpp)

## Introduction
Oh_my_tpp is the Ruby DSL(Domain Specified Language) for presentation. It's inpired by [tpp](hhttp://www.ngolde.de/tpp.html) but more than it. You can write the semantic "code" to present your idea and convert into any type of files you want. It's also a tidy demo for you to how to design a inner domain specified language.

## Example
You can write your presentation file like example.omt:

```
page "oh my tpp" do
  text "The dsl for ppt, inspired by tpp."
  link "https://github.com/tobegit3hub/oh_my_tpp.git"
end

page "syntax" do
  text "the simple text like oh_my_tpp"
  link "the linke like https://travis-ci.org"
  image "the image in https://images.google.com"
  audio "the audio in https://fb.com"
  video "the video in https://www.youtube.com"
end
```

Then use oh_my_tpp parser to convert it into .tpp file or others. The converted example.tpp looks liek:

```
--title oh my tpp
text The dsl for ppt, inspired by tpp.
link https://github.com/tobegit3hub/oh_my_tpp.git

--newpage
--title syntax
text the simple text like oh_my_tpp
link the linke like https://travis-ci.org
image the image in https://images.google.com
audio the audio in https://fb.com
video the video in https://www.youtube.com
```

