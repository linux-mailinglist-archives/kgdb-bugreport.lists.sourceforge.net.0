Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C14589B12BB
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Oct 2024 00:37:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t4Svo-0004jt-6h
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Oct 2024 22:37:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t4Svn-0004jn-HZ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cFr8zCuXx7Qa1HYksDWyqy8DL1qhBnHCzBZwSDddfWM=; b=NZVcwXofjPLvZSfsadKVrVdEYu
 J25O4a1WwDwp4hq5jgq2JvBO8mqE0w/wa8DfQf57I044+s9yYr/T+lmnlwH4pzgag1AcTqCUfIE3H
 pjtl59vDDRUXwvmI27QrF8r1uf/bGB6tKvX4NWH0fcRUUNUc4bNX+V+imcf/hpiAp1p0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cFr8zCuXx7Qa1HYksDWyqy8DL1qhBnHCzBZwSDddfWM=; b=cCSdpghms4aWHEkh2UVOOaB1Sb
 8x8VVjSX5hqrowcF+AhMLsc6lfgfsbRVxgcmy0TmeLB3OeKOw97TLylihTuRJOf8Ho60uMs5XddRT
 7BBO6F2/uSLSJ17OXEurVl0uBXxMdbfqZgPUzPL+hzfoJPQWe/gpPpvw8dvaNjm7urGI=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t4Svm-0000U2-NR for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:37:19 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5cb72918bddso3278408a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2024 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729895827; x=1730500627;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFr8zCuXx7Qa1HYksDWyqy8DL1qhBnHCzBZwSDddfWM=;
 b=cvvVOtSG0q0oEy3A/SuwQCTgeD2qLuuHangoVq81bZ1Wq8n2DA58YnnVs4HL/hMOzn
 qVEmo4kHrgo+XjdqSA25EMrSOtLfuxAHEGZwSqOJirlvJVyRbDkebQQYAAL/qhGIpbMG
 VAfNf3FeWzYYk4G/XvBQBQ3VG8PsDmPJYoAIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729895827; x=1730500627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFr8zCuXx7Qa1HYksDWyqy8DL1qhBnHCzBZwSDddfWM=;
 b=vStZO7kIB9JkxG7FowAg4tLqL1QJBbNEUYvr+FrOIn7dvg6BJ0+3X7FkFysB9vhGux
 7tJQe6TnZXTkOAt+TCSMK2i0wIG/ziz8Q2v0Zv4cnLO6Z0OnKHXPUmNJGvEOxp/FPfwh
 tbmWPbOCURnNLpWKbnlaigHBBMuEy6iW5GflgDC2w3QTBv+eTXAOfLg7Ku6Yqob2qbIQ
 DOW9lWpG1LUH9FqTYNwiDSYEMF5dE4FYjh+WNM6S7aDHwptTwt4q6st12aAAMNJcMY2m
 ENXb8I0lKoPGsXI0Abdv4zg7bHmrwAuDOwRbIqHZPjl81qAJTkxW2lUqbpRA/9SV5N22
 KFmg==
X-Gm-Message-State: AOJu0YwM81VALUmd0qragCRunnMhcp4cFr+OlFeqmvjM353m/ts25/5Q
 MhX9bfoYVLtAnijDk9nMwutDgQftKyinKk7T5t4/w0sQFqsysy3zoWvoFM59vzTrgQhU2v+y+LK
 nWw==
X-Google-Smtp-Source: AGHT+IG5RurmAUpiHMARzYfCqNUIzUk5dpK4rQETm1Ts375hrsbDIMRJoY/ouuYv37VJsAbTyuxrDg==
X-Received: by 2002:a05:6512:230c:b0:539:ee04:2321 with SMTP id
 2adb3069b0e04-53b348e761amr333947e87.33.1729895503101; 
 Fri, 25 Oct 2024 15:31:43 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e135ec9sm328388e87.110.2024.10.25.15.31.42
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 15:31:42 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso25156281fa.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2024 15:31:42 -0700 (PDT)
X-Received: by 2002:a05:651c:b09:b0:2fa:d604:e525 with SMTP id
 38308e7fff4ca-2fcbe077e48mr4065661fa.28.1729895501542; Fri, 25 Oct 2024
 15:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241021211451.GB835676@lichtman.org>
In-Reply-To: <20241021211451.GB835676@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 15:31:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJsUZ1+v5Rd+Pcx+3tO18ivgax4i8XfRg2BZJ_OEEu+A@mail.gmail.com>
Message-ID: <CAD=FV=WJsUZ1+v5Rd+Pcx+3tO18ivgax4i8XfRg2BZJ_OEEu+A@mail.gmail.com>
To: Nir Lichtman <nir@lichtman.org>
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Oct 21, 2024 at 2:14 PM Nir Lichtman <nir@lichtman.org>
    wrote: > > The simple_str* family of functions perform no error checking
   in > scenarios where the input value overflows the intended o [...] 
 
 Content analysis details:   (-2.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.48 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4Svm-0000U2-NR
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/2] kdb: Replace the use of
 simple_strto with safer kstrto in kdb_main
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCAyOjE04oCvUE0gTmlyIExpY2h0bWFuIDxuaXJA
bGljaHRtYW4ub3JnPiB3cm90ZToKPgo+IFRoZSBzaW1wbGVfc3RyKiBmYW1pbHkgb2YgZnVuY3Rp
b25zIHBlcmZvcm0gbm8gZXJyb3IgY2hlY2tpbmcgaW4KPiBzY2VuYXJpb3Mgd2hlcmUgdGhlIGlu
cHV0IHZhbHVlIG92ZXJmbG93cyB0aGUgaW50ZW5kZWQgb3V0cHV0IHZhcmlhYmxlLgo+IFRoaXMg
cmVzdWx0cyBpbiB0aGVzZSBmdW5jdGlvbnMgc3VjY2Vzc2Z1bGx5IHJldHVybmluZyBldmVuIHdo
ZW4gdGhlCj4gb3V0cHV0IGRvZXMgbm90IG1hdGNoIHRoZSBpbnB1dCBzdHJpbmcuCj4KPiBPciBh
cyBpdCB3YXMgbWVudGlvbmVkIFsxXSwgIi4uLnNpbXBsZV9zdHJ0b2woKSwgc2ltcGxlX3N0cnRv
bGwoKSwKPiBzaW1wbGVfc3RydG91bCgpLCBhbmQgc2ltcGxlX3N0cnRvdWxsKCkgZnVuY3Rpb25z
IGV4cGxpY2l0bHkgaWdub3JlCj4gb3ZlcmZsb3dzLCB3aGljaCBtYXkgbGVhZCB0byB1bmV4cGVj
dGVkIHJlc3VsdHMgaW4gY2FsbGVycy4iCj4gSGVuY2UsIHRoZSB1c2Ugb2YgdGhvc2UgZnVuY3Rp
b25zIGlzIGRpc2NvdXJhZ2VkLgo+Cj4gVGhpcyBwYXRjaCByZXBsYWNlcyBhbGwgdXNlcyBvZiB0
aGUgc2ltcGxlX3N0cnRvKiBzZXJpZXMgb2YgZnVuY3Rpb25zCj4gd2l0aCB0aGVpciBzYWZlciBr
c3RydG8qIGFsdGVybmF0aXZlcy4KPgo+IFNpZGUgZWZmZWN0cyBvZiB0aGlzIHBhdGNoOgo+IC0g
RXZlcnkgc3RyaW5nIHRvIGxvbmcgb3IgbG9uZyBsb25nIGNvbnZlcnNpb24gdXNpbmcga3N0cnRv
KiBpcyBub3cKPiAgIGNoZWNrZWQgZm9yIGZhaWx1cmUuCj4gLSBrc3RydG8qIGVycm9ycyBhcmUg
aGFuZGxlZCB3aXRoIGFwcHJvcHJpYXRlIGBLREJfQkFESU5UYCB3aGVyZXZlcgo+ICAgYXBwbGlj
YWJsZS4KPiAtIEEgZ29vZCBzaWRlIGVmZmVjdCBpcyB0aGF0IHdlIGVuZCB1cCBzYXZpbmcgYSBm
ZXcgbGluZXMgb2YgY29kZQo+ICAgc2luY2UgdW5saWtlIGluIHNpbXBsZV9zdHJ0byogZnVuY3Rp
b25zLCBrc3RydG8gZnVuY3Rpb25zIGRvIG5vdAo+ICAgbmVlZCBhbiBhZGRpdGlvbmFsICJlbmQg
cG9pbnRlciIgdmFyaWFibGUsIGFuZCB0aGUgcmV0dXJuIHZhbHVlcwo+ICAgb2YgdGhlIGxhdHRl
ciBjYW4gYmUgZGlyZWN0bHkgY2hlY2tlZCBpbiBhbiAiaWYiIHN0YXRlbWVudCB3aXRob3V0Cj4g
ICB0aGUgbmVlZCB0byBkZWZpbmUgYWRkaXRpb25hbCBgcmV0YCBvciBgZXJyYCB2YXJpYWJsZXMu
Cj4gICBUaGlzLCBvZiBjb3Vyc2UsIHJlc3VsdHMgaW4gY2xlYW5lciwgeWV0IHN0aWxsIGVhc3kg
dG8gdW5kZXJzdGFuZAo+ICAgY29kZS4KPgo+IFsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCNzaW1wbGUtc3RydG9sLXNpbXBs
ZS1zdHJ0b2xsLXNpbXBsZS1zdHJ0b3VsLXNpbXBsZS1zdHJ0b3VsbAo+Cj4gU2lnbmVkLW9mZi1i
eTogWXVyYW4gUGVyZWlyYSA8eXVyYW4ucGVyZWlyYUBob3RtYWlsLmNvbT4KClNpbmNlIHRoaXMg
d2FzIFl1cmFuJ3MgcGF0Y2ggb3JpZ2luYWxseSBhbmQgaXMgc3RpbGwgc3Vic3RhbnRpYWxseSB0
aGUKc2FtZSwga2VlcGluZyB0aGVpciBzaWduLW9mZiBmaXJzdCB3YXMgZ29vZC4gLi4uYnV0OgoK
KiBZb3Ugc2hvdWxkIGhhdmUga2VwdCBZdXJhbiBhcyB0aGUgImF1dGhvciIuIFRoaXMgc2hvdWxk
IGhhdmUKaGFwcGVuZWQgYXV0b21hdGljYWxseSBpbiB5b3VyIGxvY2FsICJnaXQiIHJlcG8gd2hl
biB5b3UgcGlja2VkCll1cmFuJ3MgcGF0Y2ggYW5kIHRoZW4gbWFkZSBjaGFuZ2VzLiBJZiBpdCBk
aWRuJ3QgeW91IGNvdWxkIG1hbnVhbGx5CnNldCB0aGUgYXV0aG9yIHdpdGggImdpdCBjb21taXQg
LS1hbWVuZCAtLWF1dGhvcj1ibGFoIi4gRXZlbiBpZiBpdCdzCnJpZ2h0IGluIHlvdXIgbG9jYWwg
cmVwb3NpdG9yeSwgdGhvdWdoLCBpdCB3b24ndCBiZSByaWdodCB3aGVuIHNvbWVvbmUKYXBwbGll
cyB5b3VyIHBhdGNoLiBUaGlzIGlzIGJlY2F1c2Ugd2hlbiBzb21lb25lIGVsc2UgaXMgdGhlIGF1
dGhvcgp0aGUgZmlyc3QgbGluZSBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgc3VwcG9zZWQgdG8g
YmUgIkZyb206IE9yaWdpbmFsCkF1dGhvciA8dGhlaXItZW1haWxAYWRkcmVzcz4iLiBZb3VyIG1l
c3NhZ2UgZG9lc24ndCBoYXZlIHRoYXQgc28gd2hlbgpJIGdyYWIgaXQgaXQgbG9va3MgbGlrZSBp
dCBjYW1lIGZyb20geW91LiBJZiB5b3UgdXNlIGEgdG9vbCBsaWtlCiJwYXRtYW4iIG9yICJiNCIg
dG8gcG9zdCB5b3VyIHBhdGNoZXMgKG9yIGV2ZW4gZ2l0LXNlbmQtZW1haWwpIHRoaXMgaXMKaGFu
ZGxlZCBmb3IgeW91LgoKKiBXaGVuIHlvdSB0YWtlIHNvbWVvbmUgZWxzZSdzIHBhdGNoIGFuZCBt
YWtlIGEgc21hbGwgY2hhbmdlIGl0J3MgbmljZQp0byBtZW50aW9uIHdoYXQgeW91IGNoYW5nZWQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKSWYgeW91IHdhbnQgdG8gc2VlIGFuIGV4YW1wbGUgb2Yg
d2hlcmUgSSB0b29rIHNvbWVvbmUgZWxzZSdzIHBhdGNoIGFuZApwb3N0ZWQgaXQsIHlvdSBjYW4g
c2VlOgoKaHR0cDovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMDA0MTcxMzQwLnYyLjEuSTkzOGM5
MWQxMGU0NTRlODQxZmRmNWQ2NDQ5OWE4YWU4NTE0ZGMwMDRAY2hhbmdlaWQKCi4uLnRob3VnaCBt
YXliZSBpZ25vcmUgdGhlIGZhY3QgdGhhdCBJIG1hbmFnZWQgdG8gYWNjaWRlbnRhbGx5IGFkZCBh
ClNpZ25lZC1vZmYtYnkgZm9yIGJvdGggb2YgbXkgZW1haWwgYWRkcmVzc2VzLS1vb3BzLiBZb3Ug
Y2FuIHNlZSB0aGF0Cml0IGhhcyBhICJGcm9tOiAiIGxpbmUgdGhhdCBwYXRtYW4vZ2l0LXNlbmQt
ZW1haWwgYWRkZWQgZm9yIG1lIGFuZCB5b3UKY2FuIGFsc28gc2VlIG15IG1lbnRpb24gb2Ygd2hh
dCBJIGRpZDoKCltkaWFuZGVyczogcmViYXNlZCB0byBtb2Rlcm4ga2VybmVsc10KCgo+IEBAIC00
MDIsNDIgKzQwMiwxNSBAQCBzdGF0aWMgdm9pZCBrZGJfcHJpbnRlbnYodm9pZCkKPiAgICovCj4g
IGludCBrZGJnZXR1bGFyZyhjb25zdCBjaGFyICphcmcsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+
ICB7Cj4gLSAgICAgICBjaGFyICplbmRwOwo+IC0gICAgICAgdW5zaWduZWQgbG9uZyB2YWw7Cj4g
LQo+IC0gICAgICAgdmFsID0gc2ltcGxlX3N0cnRvdWwoYXJnLCAmZW5kcCwgMCk7Cj4gLQo+IC0g
ICAgICAgaWYgKGVuZHAgPT0gYXJnKSB7Cj4gLSAgICAgICAgICAgICAgIC8qCj4gLSAgICAgICAg
ICAgICAgICAqIEFsc28gdHJ5IGJhc2UgMTYsIGZvciB1cyBmb2xrcyB0b28gbGF6eSB0byB0eXBl
IHRoZQo+IC0gICAgICAgICAgICAgICAgKiBsZWFkaW5nIDB4Li4uCj4gLSAgICAgICAgICAgICAg
ICAqLwoKSW4gbXkgb3JpZ2luYWwgcmVzcG9uc2UgWzFdIEkgc3VnZ2VzdGVkIHRoYXQgdGhlIHJl
bW92YWwgb2YgdGhlIGJhc2UKMTYgZmFsbGJhY2sgc2hvdWxkIHByb2JhYmx5IGhhdmUgYmVlbiBk
b25lIGluIGEgc2VwYXJhdGUgcGF0Y2ggKGluCm90aGVyIHdvcmRzIGNoYW5nZSB0aGlzIGZyb20g
YSAyLXBhdGNoIHNlcmllcyB0byBhIDMtcGF0Y2ggc2VyaWVzKS4KVGhhdCBrZWVwcyB0aGUgImNs
ZWFudXAiIHBhdGNoIHNlcGFyYXRlIGZyb20gdGhlIG9uZSB0aGF0J3MgY2hhbmdpbmcKZnVuY3Rp
b25hbGl0eS4gSXQncyBub3QgYSBodWdlIGRlYWwgYnV0IGl0IHdvdWxkIGJlIG5pY2UgaWYgeW91
IGNvdWxkCnNwbGl0IGl0IG91dC4KCklmLCBmb3Igc29tZSByZWFzb24sIHlvdSBkaWRuJ3Qgc3Bs
aXQgaXQgb3V0IHRoZW4geW91J2QgY2VydGFpbmx5IGhhdmUKd2FudGVkIHRvIG1lbnRpb24gaXQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9mIHRoZSBwYXRjaCBzaW5jZSBpdCdzIGEKY2hhbmdlIGlu
IGZ1bmN0aW9uYWxpdHkuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9DQUQ9RlY9Vlo2
MVhGYjFLczc5QkhyMWpMMWp3Zl8zNndZWHJ5eTBaWE96MXhUUTl6T2dAbWFpbC5nbWFpbC5jb20v
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1i
dWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3Jl
cG9ydAo=
