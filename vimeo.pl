#!/usr/bin/perl
use strict;
use CGI;
use LWP::Simple;

my $cgi = CGI->new();
#!/bin/sh
#
# Vimeo Downloader
#
# Copyright (C) 2008  Denver Gingerich
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

my $full_url      = $cgi->url(-path_info=>1,-query=>1);
#my ($VIMEO_ID) = ($full_url =~ /vimeo\.com.*(\d+)$/);
my ($VIMEO_ID) = ($full_url =~ /(\d+)$/);
my $VIDEO_XML=get("http://www.vimeo.com/moogaloop/load/clip:${VIMEO_ID}");

my ($REQUEST_SIGNATURE) = ($VIDEO_XML =~ /<request_signature>([^<]*)</);
my ($REQUEST_SIGNATURE_EXPIRES) = ($VIDEO_XML =~ /<request_signature_expires>([^<]*)</);
my $url = "http://www.vimeo.com/moogaloop/play/clip:${VIMEO_ID}/${REQUEST_SIGNATURE}/${REQUEST_SIGNATURE_EXPIRES}/?q=sd";
print $cgi->redirect($url);
