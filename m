Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D311C6F7954
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:47:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhjO-00016L-MG
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:47:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhjN-00016E-9o
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/rN99MG5d6M+UabPVww+w9dMJG2WFhR6z4xfKsLbvtE=; b=GGkOqaHazFbwrazIF0U0xaIqIR
 Azqf9/PStIJubAAuOss/Nv3xkPkbxVpmaGIzzGvct9xsmDLfcon3bYUxmXykht3y9afhHd0CHGxJI
 ZIi+z9Mpk0N1Ro+OYXav86q+yzAWzsWLSUP7j9QqOmuA/jpu2hjlNPixGknta39ny0DU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/rN99MG5d6M+UabPVww+w9dMJG2WFhR6z4xfKsLbvtE=; b=J5Vom+hQ+6BjFqiaSO6PNTds17
 Rrr5EJSEbFpORZcOf5EGbr2KBg5+3IV19iVevvTN38wLPx0xxnq4nw8segWP/B83676VFcA1Wy2mQ
 sE+P/GOFnbNJH1r1FGql/a2gY5wXVgYsYKbNvct1jiXQ8vLf1aoLeSSpkB/M03hu/dEY=;
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhjL-0001u0-FE for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:47:21 +0000
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3315ccc1d38so2833055ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683240433; x=1685832433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rN99MG5d6M+UabPVww+w9dMJG2WFhR6z4xfKsLbvtE=;
 b=fIRmKg4ckB8WjecHXHP0LYAYWtgUMHapIMJAzziDu81DjxEGKYKE7RKkX3eWSwTMoF
 +Z5Y2u0K9gvb0VwXv/DZfKy3CLeglqql1qBp+LrEwi3HOqyWEQ2m1MbTBFFfoBFqGgI9
 5KNaJ7I0Thq/REZfmrhq32SWd+TSdY1Wcnlxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683240433; x=1685832433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rN99MG5d6M+UabPVww+w9dMJG2WFhR6z4xfKsLbvtE=;
 b=AjaIIBle+GxiOX66jKbRgVnoDxBTq64bxFiYBmfco0BDlhl+rBCoeTIKL7agpJ1KI9
 B6tUMthNV+xRkzuv7ABZkdh613onRKLN2vr0Z5tmiEovTCAdvfXzgaUWCq1f26dui034
 qSh6wLO7hffe7KSgFcYnbUJdrhlbvhz8vdsM8f0xoZ9o3o9O3tLcJkNLmcuVfnwfr1RZ
 FzZEP/1rhgUUhXHONCZO5SasMyZsa31usRO9qO93PTsquEWrInTj8YFrDltC7CztLO/0
 otscixUT2z/zTIimFDWkCc1xluZFVLhDIBR0C+gxDBgJobXgikL0QKH2kLKZ4HpU7BT+
 vKqw==
X-Gm-Message-State: AC+VfDyrWltOV8OzVso4OadEnUyLIe5tGWtJ2GGcQn5RCGCdKG7IEhvz
 b1mLTMG7ODOZkKwBwKeWesBP4Of/hBmF455dKjI=
X-Google-Smtp-Source: ACHHUZ43Zg6EwkIPIuLzSm0dd6y/xDlmAYHI062MQlSCJJ94PSnA7ZMT4tUdUxlr8ff2rwKwL+9/Yw==
X-Received: by 2002:a92:dc44:0:b0:331:55d1:49c6 with SMTP id
 x4-20020a92dc44000000b0033155d149c6mr328354ilq.1.1683240433296; 
 Thu, 04 May 2023 15:47:13 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178]) by smtp.gmail.com with ESMTPSA id
 t13-20020a92d14d000000b0033154d10283sm69461ilg.40.2023.05.04.15.47.12
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 15:47:13 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-330ec047d3bso633015ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:47:12 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:3ef:3510:7c3a with SMTP id
 g5-20020ac85805000000b003ef35107c3amr17232qtg.3.1683239933101; Thu, 04 May
 2023 15:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
In-Reply-To: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 May 2023 15:38:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wz8u0+WHqiLwcE-3BhbtdVVCnSQjs7bxp=-tisyYQwWw@mail.gmail.com>
Message-ID: <CAD=FV=Wz8u0+WHqiLwcE-3BhbtdVVCnSQjs7bxp=-tisyYQwWw@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, May 1, 2023 at 8:25 AM Douglas Anderson <dianders@chromium.org>
    wrote: > > From: Colin Cross <ccross@android.com> > > Implement a hardlockup
    detector that doesn't doesn't need any extra > ar [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhjL-0001u0-FE
Subject: Re: [Kgdb-bugreport] [PATCH v3] hardlockup: detect hard lockups
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>, Vlastimil Babka <vbabka@suse.cz>,
 Sami Tolvanen <samitolvanen@google.com>, kgdb-bugreport@lists.sourceforge.net,
 Miguel Ojeda <ojeda@kernel.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Borislav Petkov <bp@suse.de>,
 Zhaoyang Huang <zhaoyang.huang@unisoc.com>, ito-yuichi@fujitsu.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIE1heSAxLCAyMDIzIGF0IDg6MjXigK9BTSBEb3VnbGFzIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gQ3Jvc3MgPGNjcm9z
c0BhbmRyb2lkLmNvbT4KPgo+IEltcGxlbWVudCBhIGhhcmRsb2NrdXAgZGV0ZWN0b3IgdGhhdCBk
b2Vzbid0IGRvZXNuJ3QgbmVlZCBhbnkgZXh0cmEKPiBhcmNoLXNwZWNpZmljIHN1cHBvcnQgY29k
ZSB0byBkZXRlY3QgbG9ja3Vwcy4gSW5zdGVhZCBvZiB1c2luZwo+IHNvbWV0aGluZyBhcmNoLXNw
ZWNpZmljIHdlIHdpbGwgdXNlIHRoZSBidWRkeSBzeXN0ZW0sIHdoZXJlIGVhY2ggQ1BVCj4gd2F0
Y2hlcyBvdXQgZm9yIGFub3RoZXIgb25lLiBTcGVjaWZpY2FsbHksIGVhY2ggQ1BVIHdpbGwgdXNl
IGl0cwo+IHNvZnRsb2NrdXAgaHJ0aW1lciB0byBjaGVjayB0aGF0IHRoZSBuZXh0IENQVSBpcyBw
cm9jZXNzaW5nIGhydGltZXIKPiBpbnRlcnJ1cHRzIGJ5IHZlcmlmeWluZyB0aGF0IGEgY291bnRl
ciBpcyBpbmNyZWFzaW5nLgo+Cj4gTk9URTogdW5saWtlIHRoZSBvdGhlciBoYXJkIGxvY2t1cCBk
ZXRlY3RvcnMsIHRoZSBidWRkeSBvbmUgY2FuJ3QKPiBlYXNpbHkgc2hvdyB3aGF0J3MgaGFwcGVu
aW5nIG9uIHRoZSBDUFUgdGhhdCBsb2NrZWQgdXAganVzdCBieSBkb2luZyBhCj4gc2ltcGxlIGJh
Y2t0cmFjZS4gSXQgcmVsaWVzIG9uIHNvbWUgb3RoZXIgbWVjaGFuaXNtIGluIHRoZSBzeXN0ZW0g
dG8KPiBnZXQgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGxvY2tlZCB1cCBDUFVzLiBUaGlzIGNvdWxk
IGJlIHN1cHBvcnQgZm9yCj4gTk1JIGJhY2t0cmFjZXMgbGlrZSBbMV0sIGl0IGNvdWxkIGJlIGEg
bWVjaGFuaXNtIGZvciBwcmludGluZyB0aGUgUEMKPiBvZiBsb2NrZWQgQ1BVcyBhdCBwYW5pYyB0
aW1lIGxpa2UgWzJdIC8gWzNdLCBvciBpdCBjb3VsZCBiZSBzb21ldGhpbmcKPiBlbHNlLiBFdmVu
IHRob3VnaCB0aGF0IG1lYW5zIHdlIHN0aWxsIHJlbHkgb24gYXJjaC1zcGVjaWZpYyBjb2RlLCB0
aGlzCj4gYXJjaC1zcGVjaWZpYyBjb2RlIHNlZW1zIHRvIG9mdGVuIGJlIGltcGxlbWVudGVkIGV2
ZW4gb24gYXJjaGl0ZWN0dXJlcwo+IHRoYXQgZG9uJ3QgaGF2ZSBhIGhhcmRsb2NrdXAgZGV0ZWN0
b3IuCj4KPiBUaGlzIHN0eWxlIG9mIGhhcmRsb2NrdXAgZGV0ZWN0b3Igb3JpZ2luYXRlZCBpbiBz
b21lIGRvd25zdHJlYW0KPiBBbmRyb2lkIHRyZWVzIGFuZCBoYXMgYmVlbiByZWJhc2VkIG9uIC8g
Y2FycmllZCBpbiBDaHJvbWVPUyB0cmVlcyBmb3IKPiBxdWl0ZSBhIGxvbmcgdGltZSBmb3IgdXNl
IG9uIGFybSBhbmQgYXJtNjQgYm9hcmRzLiBIaXN0b3JpY2FsbHkgb24KPiB0aGVzZSBib2FyZHMg
d2UndmUgbGV2ZXJhZ2VkIG1lY2hhbmlzbSBbMl0gLyBbM10gdG8gZ2V0IGluZm9ybWF0aW9uCj4g
YWJvdXQgaHVuZyBDUFVzLCBidXQgd2UgY291bGQgbW92ZSB0byBbMV0uCj4KPiBBbHRob3VnaCB0
aGUgb3JpZ2luYWwgbW90aXZhdGlvbiBmb3IgdGhlIGJ1ZGR5IHN5c3RlbSB3YXMgZm9yIHVzZSBv
bgo+IHN5c3RlbXMgd2l0aG91dCBhbiBhcmNoLXNwZWNpZmljIGhhcmRsb2NrdXAgZGV0ZWN0b3Is
IGl0IGNhbiBzdGlsbCBiZQo+IHVzZWZ1bCB0byB1c2UgZXZlbiBvbiBzeXN0ZW1zIHRoYXQgX2Rv
XyBoYXZlIGFuIGFyY2gtc3BlY2lmaWMKPiBoYXJkbG9ja3VwIGRldGVjdG9yLiBPbiB4ODYsIGZv
ciBpbnN0YW5jZSwgdGhlcmUgaXMgYSAyNC1wYXJ0IHBhdGNoCj4gc2VyaWVzIFs0XSBpbiBwcm9n
cmVzcyBzd2l0Y2hpbmcgdGhlIGFyY2gtc3BlY2lmaWMgaGFyZCBsb2NrdXAKPiBkZXRlY3RvciBm
cm9tIGEgc2NhcmNlIHBlcmYgY291bnRlciB0byBhIGxlc3Mtc2NhcmNlIGhhcmR3YXJlCj4gcmVz
b3VyY2UuIFBvdGVudGlhbGx5IHRoZSBidWRkeSBzeXN0ZW0gY291bGQgYmUgYSBzaW1wbGVyIGFs
dGVybmF0aXZlCj4gdG8gZnJlZSB1cCB0aGUgcGVyZiBjb3VudGVyIGJ1dCBzdGlsbCBnZXQgaGFy
ZCBsb2NrdXAgZGV0ZWN0aW9uLgo+Cj4gT3ZlcmFsbCwgcHJvcyAoKykgYW5kIGNvbnMgKC0pIG9m
IHRoZSBidWRkeSBzeXN0ZW0gY29tcGFyZWQgdG8gYW4KPiBhcmNoLXNwZWNpZmljIGhhcmRsb2Nr
dXAgZGV0ZWN0b3I6Cj4gKyBUaGUgYnVkZHkgc3lzdGVtIGlzIHVzYWJsZSBvbiBzeXN0ZW1zIHRo
YXQgZG9uJ3QgaGF2ZSBhbgo+ICAgYXJjaC1zcGVjaWZpYyBoYXJkbG9ja3VwIGRldGVjdG9yLCBs
aWtlIGFybTMyIGFuZCBhcm02NCAodGhvdWdoIGl0J3MKPiAgIGJlaW5nIHdvcmtlZCBvbiBmb3Ig
YXJtNjQgWzVdKS4KPiArIFRoZSBidWRkeSBzeXN0ZW0gbWF5IGZyZWUgdXAgc2NhcmNlIGhhcmR3
YXJlIHJlc291cmNlcy4KPiArIElmIGEgQ1BVIHRvdGFsbHkgZ29lcyBvdXQgdG8gbHVuY2ggKGNh
bid0IHByb2Nlc3MgTk1JcykgdGhlIGJ1ZGR5Cj4gICBzeXN0ZW0gY291bGQgc3RpbGwgZGV0ZWN0
IHRoZSBwcm9ibGVtICh0aG91Z2ggaXQgd291bGQgYmUgdW5saWtlbHkKPiAgIHRvIGJlIGFibGUg
dG8gZ2V0IGEgc3RhY2sgdHJhY2UpLgo+ICsgVGhlIGJ1ZGR5IHN5c3RlbSB1c2VzIHRoZSBzYW1l
IHRpbWVyIGZ1bmN0aW9uIHRvIHBldCB0aGUgaGFyZGxvY2t1cAo+ICAgZGV0ZWN0b3Igb24gdGhl
IHJ1bm5pbmcgQ1BVIGFzIGl0IHVzZXMgdG8gZGV0ZWN0IGhhcmRsb2NrdXBzIG9uCj4gICBvdGhl
ciBDUFVzLiBDb21wYXJlZCB0byBvdGhlciBoYXJkbG9ja3VwIGRldGVjdG9ycywgdGhpcyBtZWFu
cyBpdAo+ICAgZ2VuZXJhdGVzIGZld2VyIGludGVycnVwdHMgYW5kIHRodXMgaXMgbGlrZWx5IGJl
dHRlciBhYmxlIHRvIGxldAo+ICAgQ1BVcyBzdGF5IGlkbGUgbG9uZ2VyLgo+IC0gSWYgYWxsIENQ
VXMgYXJlIGhhcmQgbG9ja2VkIHVwIGF0IHRoZSBzYW1lIHRpbWUgdGhlIGJ1ZGR5IHN5c3RlbQo+
ICAgY2FuJ3QgZGV0ZWN0IGl0Lgo+IC0gSWYgd2UgZG9uJ3QgaGF2ZSBTTVAgd2UgY2FuJ3QgdXNl
IHRoZSBidWRkeSBzeXN0ZW0uCj4gLSBUaGUgYnVkZHkgc3lzdGVtIG5lZWRzIGFuIGFyY2gtc3Bl
Y2lmaWMgbWVjaGFuaXNtIChwb3NzaWJseSBOTUkKPiAgIGJhY2t0cmFjZSkgdG8gZ2V0IGluZm8g
YWJvdXQgdGhlIGxvY2tlZCB1cCBDUFUuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDIzMDQxOTIyNTYwNC4yMTIwNC0xLWRpYW5kZXJzQGNocm9taXVtLm9yZwo+IFsyXSBodHRw
czovL2lzc3VldHJhY2tlci5nb29nbGUuY29tLzE3MjIxMzEyOQo+IFszXSBodHRwczovL2RvY3Mu
a2VybmVsLm9yZy90cmFjZS9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNwdS1kZWJ1Zy5odG1sCj4gWzRd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAzMDEyMzQ3NTMuMjg1ODItMS1yaWNh
cmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29tLwo+IFs1XSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjIwOTAzMDkzNDE1LjE1ODUwLTEtbGVjb3B6ZXIu
Y2hlbkBtZWRpYXRlay5jb20vCj4KPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBDcm9zcyA8Y2Nyb3Nz
QGFuZHJvaWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hy
b21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGdyb2Vja0BjaHJvbWl1
bS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBjaHJvbWl1bS5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgo+IC0tLQo+IFRoaXMgcGF0Y2ggaGFzIGJlZW4gcmViYXNlZCBpbiBDaHJvbWVPUyBrZXJu
ZWwgdHJlZXMgbWFueSB0aW1lcywgYW5kCj4gZWFjaCB0aW1lIHNvbWVvbmUgaGFkIHRvIGRvIHdv
cmsgb24gaXQgdGhleSBhZGRlZCB0aGVpcgo+IFNpZ25lZC1vZmYtYnkuIEkndmUgaW5jbHVkZWQg
dGhvc2UgaGVyZS4gSSd2ZSBhbHNvIGxlZnQgdGhlIGF1dGhvciBhcwo+IENvbGluIENyb3NzIHNp
bmNlIHRoZSBjb3JlIGNvZGUgaXMgc3RpbGwgaGlzLgo+Cj4gSSdsbCBhbHNvIG5vdGUgdGhhdCB0
aGUgQ0MgbGlzdCBpcyBwcmV0dHkgZ2lhbnQsIGJ1dCB0aGF0J3Mgd2hhdAo+IGdldF9tYWludGFp
bmVycyBjYW1lIHVwIHdpdGggKHBsdXMgYSBmZXcgb3RoZXIgZm9sa3MgSSB0aG91Z2h0IHdvdWxk
Cj4gYmUgaW50ZXJlc3RlZCkuIEFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGVyZSdzIG5vIHRydWUg
TUFJTlRBSU5FUgo+IGxpc3RlZCBmb3IgdGhlIGV4aXN0aW5nIHdhdGNoZG9nIGNvZGUuIEFzc3Vt
aW5nIHBlb3BsZSBkb24ndCBoYXRlCj4gdGhpcywgbWF5YmUgaXQgd291bGQgZ28gdGhyb3VnaCBB
bmRyZXcgTW9ydG9uJ3MgdHJlZT8KPgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBNb3JlIGNwdSA9PiBD
UFUgKGluIEtjb25maWcgYW5kIGNvbW1lbnRzKS4KPiAtIEFkZGVkIGEgbm90ZSBpbiBjb21taXQg
bWVzc2FnZSBhYm91dCB0aGUgZWZmZWN0IG9uIGlkbGUuCj4gLSBDbGVhbmVkIHVwIGNvbW1pdCBt
ZXNzYWdlIHByb3MvY29ucyB0byBiZSBjb21wbGV0ZSBzZW50ZW5jZXMuCj4gLSBObyBjb2RlIGNo
YW5nZXMgb3RoZXIgdGhhbiBjb21tZW50cy4KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBjcHUgPT4g
Q1BVIChpbiBjb21taXQgbWVzc2FnZSkuCj4gLSBSZXdvcmtlZCBkZXNjcmlwdGlvbiBhbmQgS2Nv
bmZpZyBiYXNlZCBvbiB2MSBkaXNjdXNzaW9uLgo+IC0gTm8gY29kZSBjaGFuZ2VzLgo+Cj4gIGlu
Y2x1ZGUvbGludXgvbm1pLmggICAgICAgICB8ICAxOCArKysrLQo+ICBrZXJuZWwvTWFrZWZpbGUg
ICAgICAgICAgICAgfCAgIDEgKwo+ICBrZXJuZWwvd2F0Y2hkb2cuYyAgICAgICAgICAgfCAgMjQg
KysrKy0tCj4gIGtlcm5lbC93YXRjaGRvZ19idWRkeV9jcHUuYyB8IDE0MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL0tjb25maWcuZGVidWcgICAgICAgICAgIHwg
IDIzICsrKysrLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDE5NiBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKClRvIGxlYXZlIGJyZWFkY3J1bWJzOiBJJ3ZlIHBvc3RlZCB2NCB3aGljaCBpcyBu
b3cgYSBiaWcgc2VyaWVzCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNTA0MjIxMzQ5
LjE1MzU2NjktMS1kaWFuZGVyc0BjaHJvbWl1bS5vcmcKCkkgdG9vayBzb21lIHBlb3BsZSBvZmYg
dGhlIENDIGxpc3QgdGhhdCBnZXRfbWFpbnRhaW5lcnMgaGFkIGFkZGVkIG9uCnYzLCBtb3N0bHkg
YmVjYXVzZSBpdCB3YXMgZ2V0dGluZyB1bmJlYXJhYmxlLiBJIHRyaWVkIHRvIGNvcHkgYWxsCnJl
bGV2YW50IG1haWxpbmcgbGlzdHMsIHNvIGhvcGVmdWxseSBhbnlvbmUgd2hvIG5lZWRzIHY0IGNh
biBmaW5kIGl0CnNvbWV3aGVyZSB3aGVyZSBpdCdzIGVhc3kgZm9yIHRoZW0gdG8gcmVwbHkgdG8u
IElmIHlvdSBnb3QgZHJvcHBlZCBvZmYKdGhlIENDIGxpc3QgYW5kIHdhbnQgYmFjayBvbiBmb3Ig
ZnV0dXJlIHZlcnNpb25zLCBwbGVhc2UgeWVsbCBhbmQgSSdsbAphZGQgeW91LiBVbmxlc3MgSSBt
ZXNzZWQgdXAsIEkndmUgQ0NlZCBhbnlvbmUgd2hvIHJlcGxpZWQgdG8gcHJldmlvdXMKdmVyc2lv
bnMuCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
a2dkYi1idWdyZXBvcnQK
