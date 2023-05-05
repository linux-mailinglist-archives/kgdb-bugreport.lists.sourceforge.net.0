Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8396F86FA
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 18:45:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puyZ4-0007rJ-RA
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 May 2023 16:45:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puyZ2-0007r1-GQ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aPJ3eJX3Wd0Hq9EHdr00dwY2jAtHzFmYEuKOc8G/h4A=; b=W/NsQ+v7HCGJMaX4AWFxIioWYA
 iMsbnlFco1VDozLpzJThEBQgSKM4FuxzuHu8z53AM9wAT906rSr9GfgQhuDndJ9JjUgI6a+g35mj3
 oX/hLA/SMRYoGeSFj/T+Fba+7TpX8n9vsc4sn52twHj33DYtV/YFzhz8BWMWTHo1hh8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aPJ3eJX3Wd0Hq9EHdr00dwY2jAtHzFmYEuKOc8G/h4A=; b=ZGODGq4+xhvysTQgtOo4H2LqaL
 MIWceCHyMpkyQ+5OKE56j8WbhgrZShcY7JUVPIryEI7FK+Gm95Z4AbwhO/QmK2qpKouT6+8yIRtZs
 t//fJjXMWeChtS+eHjbN7/pb6MugQ0+fl1Ah8LNQ6tCxw5XAoOsq7vicxhyb3HQ4uDec=;
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puyZ2-0007hw-9r for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:45:48 +0000
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-332cc0efe88so5760655ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683305139; x=1685897139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPJ3eJX3Wd0Hq9EHdr00dwY2jAtHzFmYEuKOc8G/h4A=;
 b=fgWi6iCq9+XEjo8h/V6ZUZ7cWJXks8+LdWzu62Nilkh3JVhSVLO+gOkwYGeDAgPSJm
 q8rxyyqju83rIMQi/kT78/HXSpgh3gJavSMK+w7n/SV2bkANsRmXXl/ppqEd6re6DkEZ
 f+wYQYM+1XhFz3I+mEcd8AgIXjJjUc5EA4Hhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683305139; x=1685897139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aPJ3eJX3Wd0Hq9EHdr00dwY2jAtHzFmYEuKOc8G/h4A=;
 b=FnbtR27cs/QRk0joek0QyntphXghQjIc/8DG0ByLSOr3COt5NlUUDFyRaCz4nbPxtH
 Lul0Z3pLQe/Al7e5mVLXXf7AZj0RPH3aNXVgnoG8DcBLjBBRA3PQqEB3aEsvInZx+vTJ
 MExmrx6Ew57tIY6ZD993jHGRfeciBzzyWKr/tps20fJV0wQ6bLABuHWSgij2SH1qbh6Z
 4aFP4BdQ8Em63vt6FqFS1zXMkkupJiHb09HN9SgJ3Qf4DwVCElCWzO1ymPzTUnt31B/e
 KgQW2bEkxHAWlmtJD2OoLmrGEMttJTbcJdqUViYNZ6kR4iJoSN6hJ6WIhXM7FCQdJGlp
 DFIw==
X-Gm-Message-State: AC+VfDzrEe4/To7ntsy27mkdb7LsRR9jg0t3gaQ8CxF2eHvXpS3Y9aXv
 yd+YGb6S5One44XUccxXJJmiL+Hx/xhKWZdFgvw=
X-Google-Smtp-Source: ACHHUZ6GEfOOF+Ba6i2kCpxSmFRBkBWznXrqfeSgOw075xy1cinHXBNy8nYK1h1kc5QOYx7BzUcl9Q==
X-Received: by 2002:a92:d38a:0:b0:328:ebec:1967 with SMTP id
 o10-20020a92d38a000000b00328ebec1967mr1489261ilo.16.1683305139789; 
 Fri, 05 May 2023 09:45:39 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173]) by smtp.gmail.com with ESMTPSA id
 o9-20020a92dac9000000b0031595ea003asm543158ilq.85.2023.05.05.09.45.39
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 09:45:39 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-32f4e0f42a7so796975ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:45:39 -0700 (PDT)
X-Received: by 2002:ac8:5716:0:b0:3ef:330c:8f9e with SMTP id
 22-20020ac85716000000b003ef330c8f9emr343597qtw.10.1683304683433; Fri, 05 May
 2023 09:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.7.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
 <CSE09YL4X0XY.1GAQWAFOOEK42@wheely>
In-Reply-To: <CSE09YL4X0XY.1GAQWAFOOEK42@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:37:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vom15dOxnp=x5RFsk7ZCXGVwUjjrA4z1js-cCB=PDLFg@mail.gmail.com>
Message-ID: <CAD=FV=Vom15dOxnp=x5RFsk7ZCXGVwUjjrA4z1js-cCB=PDLFg@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, May 4, 2023 at 7:58 PM Nicholas Piggin <npiggin@gmail.com>
    wrote: > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: >
   > The perf hardlockup detector works by looking at interru [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.171 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puyZ2-0007hw-9r
Subject: Re: [Kgdb-bugreport] [PATCH v4 07/17] watchdog/hardlockup: Move
 perf hardlockup checking/panic to common watchdog.c
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE1heSA0LCAyMDIzIGF0IDc6NTjigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSBNYXkgNSwgMjAyMyBhdCA4OjEzIEFN
IEFFU1QsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBUaGUgcGVyZiBoYXJkbG9ja3VwIGRl
dGVjdG9yIHdvcmtzIGJ5IGxvb2tpbmcgYXQgaW50ZXJydXB0IGNvdW50cyBhbmQKPiA+IHNlZWlu
ZyBpZiB0aGV5IGNoYW5nZSBmcm9tIHJ1biB0byBydW4uIFRoZSBpbnRlcnJ1cHQgY291bnRzIGFy
ZQo+ID4gbWFuYWdlZCBieSB0aGUgY29tbW9uIHdhdGNoZG9nIGNvZGUgdmlhIGl0cyB3YXRjaGRv
Z190aW1lcl9mbigpLgo+ID4KPiA+IEN1cnJlbnRseSB0aGUgQVBJIGJldHdlZW4gdGhlIHBlcmYg
ZGV0ZWN0b3IgYW5kIHRoZSBjb21tb24gY29kZSBpcyBhCj4gPiBmdW5jdGlvbjogaXNfaGFyZGxv
Y2t1cCgpLiBXaGVuIHRoZSBoYXJkIGxvY2t1cCBkZXRlY3RvciBzZWVzIHRoYXQKPiA+IGZ1bmN0
aW9uIHJldHVybiB0cnVlIHRoZW4gaXQgaGFuZGxlcyBwcmludGluZyBvdXQgZGVidWcgaW5mbyBh
bmQKPiA+IGluZHVjaW5nIGEgcGFuaWMgaWYgbmVjZXNzYXJ5Lgo+ID4KPiA+IExldCdzIGNoYW5n
ZSB0aGUgQVBJIGEgbGl0dGxlIGJpdCBpbiBwcmVwYXJhdGlvbiBmb3IgdGhlIGJ1ZGR5Cj4gPiBo
YXJkbG9ja3VwIGRldGVjdG9yLiBUaGUgYnVkZHkgaGFyZGxvY2t1cCBkZXRlY3RvciB3YW50cyB0
byBwcmludAo+Cj4gSSB0aGluayB0aGUgbmFtZSBjaGFuZ2UgaXMgYSBncmF0dWl0b3VzLiBFc3Bl
Y2lhbGx5IHNpbmNlIGl0J3Mgbm93Cj4gc3RhdGljLgo+Cj4gd2F0Y2hkb2dfaGFyZGxvY2t1cF8g
aXMgYSBwcmV0dHkgbG9uZyBwcmVmaXggdG9vLCBoYXJkbG9ja3VwXwo+IHNob3VsZCBiZSBlbm91
Z2g/Cj4KPiBTZWVtcyBva2F5IG90aGVyd2lzZSB0aG91Z2guCgpJIHdlbnQgYmFjayBhbmQgZm9y
dGggb24gbmFtZXMgZmFyIHRvbyBtdWNoIHdoZW4gY29uc3RydWN0aW5nIHRoaXMKcGF0Y2ggc2Vy
aWVzLiBNb3N0bHkgSSB3YXMgdHJ5aW5nIHRvIGJhbGFuY2Ugd2hhdCBsb29rZWQgZ29vZCB0byBt
ZQphbmQgd2hhdCBQZXRyIHN1Z2dlc3RlZCBbMV0uIEknbSBub3Qgc3VwZXIgcGlja3kgYWJvdXQg
dGhlIG5hbWVzIGFuZApJJ20gaGFwcHkgdG8gY2hhbmdlIHRoZW0gYWxsIHRvIGEgImhhcmRsb2Nr
dXBfIiBwcmVmaXguIEknZCBsb3ZlIHRvCmhlYXIgUGV0cidzIG9waW5pb24uCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci9aRkVybXNoY3JjaWtyU1UxQGFsbGV5CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
