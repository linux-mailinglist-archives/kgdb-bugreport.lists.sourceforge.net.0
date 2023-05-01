Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C02436F32AC
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 May 2023 17:15:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ptVF7-0008KE-VM
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 01 May 2023 15:15:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ptVF3-0008K8-8m
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 May 2023 15:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQb1XVaufUW5DJA/7lHcfBPSDH2dGqwat0C76pMtYrg=; b=VRfojFH8ky0LapO7/tLR0c+r5H
 6m+uzFEmlQDHq9BslOEIk12UsBLiSyKJyaqK0APvTO16Vgm+8v1bwLBXaLAguhq5tRKHHRQSiu4rj
 8GpNN9WWUFOHEdSv8LK+Q5I0sJdq3MWBS2lxbq7FPMwuO2XnS9BkIF5VO9MtqsbBedBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sQb1XVaufUW5DJA/7lHcfBPSDH2dGqwat0C76pMtYrg=; b=J4a5UQb2hJJI9Q3W/gthkJqxhh
 lFTwNki2FXb9k6zKMIMLvGToKRIcYpxmq9sZDFUelLKKAopLnm/5Ds3i4bUtTKGE51rVVsiNtbgNj
 1MJY7qypf9rV9OeISnnelQpbObdKOdTAvlMmOoaSDwrix4CpHaFHedoIExQ0V7MXuhZU=;
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ptVF1-00AO8A-IX for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 May 2023 15:15:05 +0000
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2a8b1b51dbdso24560741fa.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 May 2023 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682954096; x=1685546096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQb1XVaufUW5DJA/7lHcfBPSDH2dGqwat0C76pMtYrg=;
 b=e1cvjKMXuZGDKTLMm7g9D+HZ1HyFTVoWVhtbQxC0TnY5ycF4OG7TqFGuJr7s2LWScT
 l+Lc6AlVeJQfkxqwTqYhmrTd+jvNIzxbJNDhbKDil+zgn+G9YnO1/tRT7gdh0cbGQC+4
 2Bqg/0v7bmZLilRvZIRkn30JG8AcYmcJiy0k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682954096; x=1685546096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQb1XVaufUW5DJA/7lHcfBPSDH2dGqwat0C76pMtYrg=;
 b=etOdt2YbmuoLgyWfVhZXWqA6LnN0WmYdWh0xDs3Wec32pl2XxEZAvQh1z5ExEt3bvm
 rcula0aXE9xm231dc8Umw/QERKUetP4A1YX3l8NLePQVjApdO0EdejKT/hWR/VVeIcqj
 6YL/Q/L7b0CBqoW5k+FcXP/duVPEnLPxHaYVuhGK53ghVo25hoi181mp8YY09//SqPAR
 yyXJFPkyhUHHLHhShztIuDcv9OkMOfqyp3a8kmx2rvvz0FKVYv2PPyUJ6fmpzWH0cL8q
 mQ2S18mI4lQqdfqQxf3m5y37pctlQfY80K25WD3O9J6xHqHgMH/b760P9RHckgK0eJPw
 shOQ==
X-Gm-Message-State: AC+VfDypYAR0EaXCcnujwzPwsXmGQeHHYIBy2iATBjugF3VhEdg+HCSM
 nEkEGIWeKbnk9p12o211gb6RKjf13bmPOqVjJQYR8XNi
X-Google-Smtp-Source: ACHHUZ6Dn/ucCmWJ4lJxGxeEPn6PlosvqZgy1yeOlIQUKVTNusj+QSteTGWLpSPap3lvJQbDIgEaeg==
X-Received: by 2002:a2e:9305:0:b0:2a8:b286:8272 with SMTP id
 e5-20020a2e9305000000b002a8b2868272mr4005186ljh.15.1682954095813; 
 Mon, 01 May 2023 08:14:55 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 b7-20020ac25627000000b004efef5cf939sm3716939lff.83.2023.05.01.08.14.55
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 08:14:55 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4edc63e066fso22460e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 May 2023 08:14:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3d87:b0:3f1:74cf:8563 with SMTP id
 bi7-20020a05600c3d8700b003f174cf8563mr484739wmb.5.1682953706729; Mon, 01 May
 2023 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230428163507.v2.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CAP-5=fUJJ-JBxWuHm573jRDcrLCp4kRUhvOSw3jjsMAc5VbdMg@mail.gmail.com>
In-Reply-To: <CAP-5=fUJJ-JBxWuHm573jRDcrLCp4kRUhvOSw3jjsMAc5VbdMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 May 2023 08:08:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xpmkju4g8fWnh3AahgqtMRkCfkUtfEsgm_z23W+7BY+A@mail.gmail.com>
Message-ID: <CAD=FV=Xpmkju4g8fWnh3AahgqtMRkCfkUtfEsgm_z23W+7BY+A@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Apr 29, 2023 at 2:22 PM Ian Rogers <irogers@google.com>
    wrote: > > On Fri, Apr 28, 2023 at 4:41 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > > > From: Colin Cross <ccross@android [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.179 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ptVF1-00AO8A-IX
Subject: Re: [Kgdb-bugreport] [PATCH v2] hardlockup: detect hard lockups
 using secondary (buddy) CPUs
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
Cc: Mark Rutland <mark.rutland@arm.com>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, ravi.v.shankar@intel.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Vlastimil Babka <vbabka@suse.cz>, Sami Tolvanen <samitolvanen@google.com>,
 kgdb-bugreport@lists.sourceforge.net, Miguel Ojeda <ojeda@kernel.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-mediatek@lists.infradead.org, David Gow <davidgow@google.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Colin Cross <ccross@android.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIEFwciAyOSwgMjAyMyBhdCAyOjIy4oCvUE0gSWFuIFJvZ2VycyA8aXJvZ2Vy
c0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDI4LCAyMDIzIGF0IDQ6NDHigK9Q
TSBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+
IEZyb206IENvbGluIENyb3NzIDxjY3Jvc3NAYW5kcm9pZC5jb20+Cj4gPgo+ID4gSW1wbGVtZW50
IGEgaGFyZGxvY2t1cCBkZXRlY3RvciB0aGF0IGRvZXNuJ3QgZG9lc24ndCBuZWVkIGFueSBleHRy
YQo+ID4gYXJjaC1zcGVjaWZpYyBzdXBwb3J0IGNvZGUgdG8gZGV0ZWN0IGxvY2t1cHMuIEluc3Rl
YWQgb2YgdXNpbmcKPiA+IHNvbWV0aGluZyBhcmNoLXNwZWNpZmljIHdlIHdpbGwgdXNlIHRoZSBi
dWRkeSBzeXN0ZW0sIHdoZXJlIGVhY2ggQ1BVCj4gPiB3YXRjaGVzIG91dCBmb3IgYW5vdGhlciBv
bmUuIFNwZWNpZmljYWxseSwgZWFjaCBDUFUgd2lsbCB1c2UgaXRzCj4gPiBzb2Z0bG9ja3VwIGhy
dGltZXIgdG8gY2hlY2sgdGhhdCB0aGUgbmV4dCBDUFUgaXMgcHJvY2Vzc2luZyBocnRpbWVyCj4g
PiBpbnRlcnJ1cHRzIGJ5IHZlcmlmeWluZyB0aGF0IGEgY291bnRlciBpcyBpbmNyZWFzaW5nLgo+
ID4KPiA+IE5PVEU6IHVubGlrZSB0aGUgb3RoZXIgaGFyZCBsb2NrdXAgZGV0ZWN0b3JzLCB0aGUg
YnVkZHkgb25lIGNhbid0Cj4gPiBlYXNpbHkgc2hvdyB3aGF0J3MgaGFwcGVuaW5nIG9uIHRoZSBD
UFUgdGhhdCBsb2NrZWQgdXAganVzdCBieSBkb2luZyBhCj4gPiBzaW1wbGUgYmFja3RyYWNlLiBJ
dCByZWxpZXMgb24gc29tZSBvdGhlciBtZWNoYW5pc20gaW4gdGhlIHN5c3RlbSB0bwo+ID4gZ2V0
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBsb2NrZWQgdXAgQ1BVcy4gVGhpcyBjb3VsZCBiZSBzdXBw
b3J0IGZvcgo+ID4gTk1JIGJhY2t0cmFjZXMgbGlrZSBbMV0sIGl0IGNvdWxkIGJlIGEgbWVjaGFu
aXNtIGZvciBwcmludGluZyB0aGUgUEMKPiA+IG9mIGxvY2tlZCBDUFVzIGF0IHBhbmljIHRpbWUg
bGlrZSBbMl0gLyBbM10sIG9yIGl0IGNvdWxkIGJlIHNvbWV0aGluZwo+ID4gZWxzZS4gRXZlbiB0
aG91Z2ggdGhhdCBtZWFucyB3ZSBzdGlsbCByZWx5IG9uIGFyY2gtc3BlY2lmaWMgY29kZSwgdGhp
cwo+ID4gYXJjaC1zcGVjaWZpYyBjb2RlIHNlZW1zIHRvIG9mdGVuIGJlIGltcGxlbWVudGVkIGV2
ZW4gb24gYXJjaGl0ZWN0dXJlcwo+ID4gdGhhdCBkb24ndCBoYXZlIGEgaGFyZGxvY2t1cCBkZXRl
Y3Rvci4KPiA+Cj4gPiBUaGlzIHN0eWxlIG9mIGhhcmRsb2NrdXAgZGV0ZWN0b3Igb3JpZ2luYXRl
ZCBpbiBzb21lIGRvd25zdHJlYW0KPiA+IEFuZHJvaWQgdHJlZXMgYW5kIGhhcyBiZWVuIHJlYmFz
ZWQgb24gLyBjYXJyaWVkIGluIENocm9tZU9TIHRyZWVzIGZvcgo+ID4gcXVpdGUgYSBsb25nIHRp
bWUgZm9yIHVzZSBvbiBhcm0gYW5kIGFybTY0IGJvYXJkcy4gSGlzdG9yaWNhbGx5IG9uCj4gPiB0
aGVzZSBib2FyZHMgd2UndmUgbGV2ZXJhZ2VkIG1lY2hhbmlzbSBbMl0gLyBbM10gdG8gZ2V0IGlu
Zm9ybWF0aW9uCj4gPiBhYm91dCBodW5nIENQVXMsIGJ1dCB3ZSBjb3VsZCBtb3ZlIHRvIFsxXS4K
PiA+Cj4gPiBBbHRob3VnaCB0aGUgb3JpZ2luYWwgbW90aXZhdGlvbiBmb3IgdGhlIGJ1ZGR5IHN5
c3RlbSB3YXMgZm9yIHVzZSBvbgo+ID4gc3lzdGVtcyB3aXRob3V0IGFuIGFyY2gtc3BlY2lmaWMg
aGFyZGxvY2t1cCBkZXRlY3RvciwgaXQgY2FuIHN0aWxsIGJlCj4gPiB1c2VmdWwgdG8gdXNlIGV2
ZW4gb24gc3lzdGVtcyB0aGF0IF9kb18gaGF2ZSBhbiBhcmNoLXNwZWNpZmljCj4gPiBoYXJkbG9j
a3VwIGRldGVjdG9yLiBPbiB4ODYsIGZvciBpbnN0YW5jZSwgdGhlcmUgaXMgYSAyNC1wYXJ0IHBh
dGNoCj4gPiBzZXJpZXMgWzRdIGluIHByb2dyZXNzIHN3aXRjaGluZyB0aGUgYXJjaC1zcGVjaWZp
YyBoYXJkIGxvY2t1cAo+ID4gZGV0ZWN0b3IgZnJvbSBhIHNjYXJjZSBwZXJmIGNvdW50ZXIgdG8g
YSBsZXNzLXNjYXJjZSBoYXJkd2FyZQo+ID4gcmVzb3VyY2UuIFBvdGVudGlhbGx5IHRoZSBidWRk
eSBzeXN0ZW0gY291bGQgYmUgYSBzaW1wbGVyIGFsdGVybmF0aXZlCj4gPiB0byBmcmVlIHVwIHRo
ZSBwZXJmIGNvdW50ZXIgYnV0IHN0aWxsIGdldCBoYXJkIGxvY2t1cCBkZXRlY3Rpb24uCj4gPgo+
ID4gT3ZlcmFsbCwgcHJvcyAoKykgYW5kIGNvbnMgKC0pIG9mIHRoZSBidWRkeSBzeXN0ZW0gY29t
cGFyZWQgdG8gYW4KPiA+IGFyY2gtc3BlY2lmaWMgaGFyZGxvY2t1cCBkZXRlY3RvcjoKPiA+ICsg
VXNhYmxlIG9uIHN5c3RlbXMgdGhhdCBkb24ndCBoYXZlIGFuIGFyY2gtc3BlY2lmaWMgaGFyZGxv
Y2t1cAo+ID4gICBkZXRlY3RvciwgbGlrZSBhcm0zMiBhbmQgYXJtNjQgKHRob3VnaCBpdCdzIGJl
aW5nIHdvcmtlZCBvbiBmb3IKPiA+ICAgYXJtNjQgWzVdKS4KPiA+ICsgTWF5IGZyZWUgdXAgc2Nh
cmNlIGhhcmR3YXJlIHJlc291cmNlcy4KPiA+ICsgSWYgYSBDUFUgdG90YWxseSBnb2VzIG91dCB0
byBsdW5jaCAoY2FuJ3QgcHJvY2VzcyBOTUlzKSB0aGUgYnVkZHkKPiA+ICAgc3lzdGVtIGNvdWxk
IHN0aWxsIGRldGVjdCB0aGUgcHJvYmxlbSAodGhvdWdoIGl0IHdvdWxkIGJlIHVubGlrZWx5Cj4g
PiAgIHRvIGJlIGFibGUgdG8gZ2V0IGEgc3RhY2sgdHJhY2UpLgo+ID4gLSBJZiBhbGwgQ1BVcyBh
cmUgaGFyZCBsb2NrZWQgdXAgYXQgdGhlIHNhbWUgdGltZSB0aGUgYnVkZHkgc3lzdGVtCj4gPiAg
IGNhbid0IGRldGVjdCBpdC4KPiA+IC0gSWYgd2UgZG9uJ3QgaGF2ZSBTTVAgd2UgY2FuJ3QgdXNl
IHRoZSBidWRkeSBzeXN0ZW0uCj4gPiAtIFRoZSBidWRkeSBzeXN0ZW0gbmVlZHMgYW4gYXJjaC1z
cGVjaWZpYyBtZWNoYW5pc20gKHBvc3NpYmx5IE5NSQo+ID4gICBiYWNrdHJhY2UpIHRvIGdldCBp
bmZvIGFib3V0IHRoZSBsb2NrZWQgdXAgQ1BVLgo+Cj4gVGhhbmtzIGZvciB0aGlzIGxpc3QsIGl0
IGlzIHJlYWxseSB1c2VmdWwhIElzIGl0IHdvcnRoIG1lbnRpb25pbmcgdGhlCj4gYmVoYXZpb3Ig
YXJvdW5kIGlkbGU/IENvdWxkIHRoaXMgYXBwcm9hY2ggcG90ZW50aWFsbHkgdXNlIG1vcmUgcG93
ZXI/CgpTdXJlLCBJJ2xsIGFkZCBzb21lIHRleHQgaW4gdGhlcmUuIElmIEknbSBhbmFseXppbmcg
dGhlIGNvZGUgcHJvcGVybHksCm15IGJlbGllZiBpcyB0aGF0LCBpZiBhbnl0aGluZywgdGhlIGJ1
ZGR5IGRldGVjdG9yIHNob3VsZCBiZSBiZXR0ZXIKZm9yIGlkbGUvcG93ZXIgdGhhbiBzb21lIG90
aGVyIGRldGVjdG9ycy4KClNwZWNpZmljYWxseSwgbm90ZSB0aGF0IHRoZSBtYWluICJ3b3JrZXIi
IG9mIHRoZSBidWRkeSBkZXRlY3RvciBpcwpjYWxsZWQgZnJvbSB3YXRjaGRvZ190aW1lcl9mbigp
LiBUaGUgdGltZXIgZnVuY3Rpb24gaXMgdGhlIHNhbWUgb25lCnRoYXQgcnVucyBmb3Igb3RoZXIg
aGFyZCBsb2NrdXAgZGV0ZWN0b3JzLCBidXQgaW4gdGhvc2UgY2FzZXMgaXQKX29ubHlfIHBldHMg
dGhlIHdhdGNoZG9nIG9mIHRoZSBydW5uaW5nIENQVS4gV2l0aCB0aGUgYnVkZHkgZGV0ZWN0b3IK
aXQgcGV0cyB0aGUgcnVubmluZyBDUFUncyB3YXRjaGRvZyBhbmQgdGhlbiBjaGVja3Mgb24gdGhl
IGJ1ZGR5J3MKd2F0Y2hkb2cuIFRoZXJlIGlzIG5vIHNlcGFyYXRlIHdha2V1cCAvIGludGVycnVw
dCB0aGF0IG5lZWRzIHRvIHJ1bgpwZXJpb2RpY2FsbHkgdG8gbG9vayBmb3IgaGFyZCBsb2NrdXBz
LgoKSSdtIGFib3V0IHRvIHNlbmQgYSB2MyB0byBmaXggdGhlIGNwdT0+Q1BVIHRoYXQgSSBtaXNz
ZWQgb24gdjIuIEknbGwKYWRkIHRleHQgc2ltaWxhciB0byB0aGUgYWJvdmUgdG8gdGhlIGNvbW1p
dCBtZXNzYWdlLgoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
