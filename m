Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4D6F321E
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 May 2023 16:36:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ptUe3-0001Yn-BK
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 01 May 2023 14:36:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ptUe2-0001Yh-Nb
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 May 2023 14:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uz6FJXzkJkqPDcrEIjMfZPfzlnpS0r8oHDAuwuJCMM8=; b=hykks7EEOlSziQCO9UMXAigVDf
 isYexHWi47vgMzN4n6o4sBr1nrIca7bdLMDhYnYpbswp6Kh0jgLbhqXC4iQ0zA+vFQ5ZaPDAFkR/K
 Jb9wuKOlF1Js4bDIA5oyRRdltWC5tnJ442HRKZagRSr3vz+0ypnvFlV5AmD/BGOsfdus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uz6FJXzkJkqPDcrEIjMfZPfzlnpS0r8oHDAuwuJCMM8=; b=WyzUMFHvx+OBQMo5k5aBOJElEc
 uHyuyJYQ1P2IC0s850VEjzSZDyeHfpi+FrYsRVVfFwR1Rn4TajQVhlvCD1junLm/H2v+k/bwcfLAQ
 gmnm6/SlkLq+XnUO93AHppiUKo1uME9kOvFSVyV6xbTQOd4OALP6GyPCpYbqoKZnRniw=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ptUe2-00ABw9-MU for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 May 2023 14:36:51 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-50a14564d17so40131432a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 May 2023 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682951804; x=1685543804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uz6FJXzkJkqPDcrEIjMfZPfzlnpS0r8oHDAuwuJCMM8=;
 b=k2upjTCLcVuTEfFVoDzpzSgGGSc1s45yJMzsEFVgtnhD0S+SjcMYp9gZ4SaWyNLXJa
 z6ovoJcPhf9dusDaC1xGZA1qRX6iUepEn8s2ReEdfAJq8+HPnzuBCz3y7KPJJ6/JmBuK
 ssx1GmqM73Nkrds+nUtA2F8KERxZWN3uvpgb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682951804; x=1685543804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uz6FJXzkJkqPDcrEIjMfZPfzlnpS0r8oHDAuwuJCMM8=;
 b=hTzrDL1aQqeEHycuYWZ2MikPI+DQDNr3nlXDDbhTH8N6NEC1upKze3OUgsZ798YOND
 fU+594Kb8ropOXekMYvWbsjM0/8IkPYUfKTF+gVdMJi2cG4cbHBzfPKFkVVC/QuiwIRt
 fX/FQfJ7CZYX6qdNEu9Z7O5RTnz2WnPN7QdvdKLr9bgm747nDAaWfT9RVA4qB+ErWZlF
 EN+ilG0GV+OJkU/Kukg2HZKVQvqEO7+lukoijxzWqMKazc6z4LEKTAxZevyDX8qCR37B
 4PAJ/2wpa9ZM4etKSXXiKxFVimZf7k//HKiPvrurH1Ex5w9H4mH3sIo1JjPDghgbl1B2
 BWkg==
X-Gm-Message-State: AC+VfDyMza/uNy+2i/ZpVJe1qXr5jnRMopaplXYTrO8rdnEVj6brt4/u
 A9infdKSGNN284sxef2c2C+zokI/leYKmWPG+M6YRIFa
X-Google-Smtp-Source: ACHHUZ7mDtGnQmzl9zo65VLRzIkNt2Q7VEvmOgbGIPmNxpQl4C37eNzjJcSnXNwyQ9eSLaY2cgMUPg==
X-Received: by 2002:a17:907:988:b0:933:4d47:55b7 with SMTP id
 bf8-20020a170907098800b009334d4755b7mr11657884ejc.2.1682949902146; 
 Mon, 01 May 2023 07:05:02 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 re4-20020a170906d8c400b0094a82a236cbsm14698112ejb.129.2023.05.01.07.04.59
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 07:04:59 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-3f2548256d0so277775e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 May 2023 07:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3c84:b0:3f1:9396:6fbf with SMTP id
 bg4-20020a05600c3c8400b003f193966fbfmr531828wmb.4.1682949899295; Mon, 01 May
 2023 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230428163507.v2.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <217e697c-ad13-96ca-3829-a046469fd86a@infradead.org>
In-Reply-To: <217e697c-ad13-96ca-3829-a046469fd86a@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 May 2023 07:04:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V0tzeqCrFUrytbe0OByYkC23i61H+jdgZRXfMKbShMcA@mail.gmail.com>
Message-ID: <CAD=FV=V0tzeqCrFUrytbe0OByYkC23i61H+jdgZRXfMKbShMcA@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Apr 28, 2023 at 5:36 PM Randy Dunlap <rdunlap@infradead.org>
    wrote: > > Hi-- > > On 4/28/23 16:37, Douglas Anderson wrote: > > From: Colin
    Cross <ccross@android.com> > > > > Implement a hard [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ptUe2-00ABw9-MU
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
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
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgoKT24gRnJpLCBBcHIgMjgsIDIwMjMgYXQgNTozNuKAr1BNIFJhbmR5IER1bmxhcCA8cmR1
bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IEhpLS0KPgo+IE9uIDQvMjgvMjMgMTY6Mzcs
IERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBGcm9tOiBDb2xpbiBDcm9zcyA8Y2Nyb3NzQGFu
ZHJvaWQuY29tPgo+ID4KPiA+IEltcGxlbWVudCBhIGhhcmRsb2NrdXAgZGV0ZWN0b3IgdGhhdCBk
b2Vzbid0IGRvZXNuJ3QgbmVlZCBhbnkgZXh0cmEKPiA+IGFyY2gtc3BlY2lmaWMgc3VwcG9ydCBj
b2RlIHRvIGRldGVjdCBsb2NrdXBzLiBJbnN0ZWFkIG9mIHVzaW5nCj4gPiBzb21ldGhpbmcgYXJj
aC1zcGVjaWZpYyB3ZSB3aWxsIHVzZSB0aGUgYnVkZHkgc3lzdGVtLCB3aGVyZSBlYWNoIENQVQo+
ID4gd2F0Y2hlcyBvdXQgZm9yIGFub3RoZXIgb25lLiBTcGVjaWZpY2FsbHksIGVhY2ggQ1BVIHdp
bGwgdXNlIGl0cwo+ID4gc29mdGxvY2t1cCBocnRpbWVyIHRvIGNoZWNrIHRoYXQgdGhlIG5leHQg
Q1BVIGlzIHByb2Nlc3NpbmcgaHJ0aW1lcgo+ID4gaW50ZXJydXB0cyBieSB2ZXJpZnlpbmcgdGhh
dCBhIGNvdW50ZXIgaXMgaW5jcmVhc2luZy4KPiA+Cj4gPiBOT1RFOiB1bmxpa2UgdGhlIG90aGVy
IGhhcmQgbG9ja3VwIGRldGVjdG9ycywgdGhlIGJ1ZGR5IG9uZSBjYW4ndAo+ID4gZWFzaWx5IHNo
b3cgd2hhdCdzIGhhcHBlbmluZyBvbiB0aGUgQ1BVIHRoYXQgbG9ja2VkIHVwIGp1c3QgYnkgZG9p
bmcgYQo+ID4gc2ltcGxlIGJhY2t0cmFjZS4gSXQgcmVsaWVzIG9uIHNvbWUgb3RoZXIgbWVjaGFu
aXNtIGluIHRoZSBzeXN0ZW0gdG8KPiA+IGdldCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbG9ja2Vk
IHVwIENQVXMuIFRoaXMgY291bGQgYmUgc3VwcG9ydCBmb3IKPiA+IE5NSSBiYWNrdHJhY2VzIGxp
a2UgWzFdLCBpdCBjb3VsZCBiZSBhIG1lY2hhbmlzbSBmb3IgcHJpbnRpbmcgdGhlIFBDCj4gPiBv
ZiBsb2NrZWQgQ1BVcyBhdCBwYW5pYyB0aW1lIGxpa2UgWzJdIC8gWzNdLCBvciBpdCBjb3VsZCBi
ZSBzb21ldGhpbmcKPiA+IGVsc2UuIEV2ZW4gdGhvdWdoIHRoYXQgbWVhbnMgd2Ugc3RpbGwgcmVs
eSBvbiBhcmNoLXNwZWNpZmljIGNvZGUsIHRoaXMKPiA+IGFyY2gtc3BlY2lmaWMgY29kZSBzZWVt
cyB0byBvZnRlbiBiZSBpbXBsZW1lbnRlZCBldmVuIG9uIGFyY2hpdGVjdHVyZXMKPiA+IHRoYXQg
ZG9uJ3QgaGF2ZSBhIGhhcmRsb2NrdXAgZGV0ZWN0b3IuCj4gPgo+ID4gVGhpcyBzdHlsZSBvZiBo
YXJkbG9ja3VwIGRldGVjdG9yIG9yaWdpbmF0ZWQgaW4gc29tZSBkb3duc3RyZWFtCj4gPiBBbmRy
b2lkIHRyZWVzIGFuZCBoYXMgYmVlbiByZWJhc2VkIG9uIC8gY2FycmllZCBpbiBDaHJvbWVPUyB0
cmVlcyBmb3IKPiA+IHF1aXRlIGEgbG9uZyB0aW1lIGZvciB1c2Ugb24gYXJtIGFuZCBhcm02NCBi
b2FyZHMuIEhpc3RvcmljYWxseSBvbgo+ID4gdGhlc2UgYm9hcmRzIHdlJ3ZlIGxldmVyYWdlZCBt
ZWNoYW5pc20gWzJdIC8gWzNdIHRvIGdldCBpbmZvcm1hdGlvbgo+ID4gYWJvdXQgaHVuZyBDUFVz
LCBidXQgd2UgY291bGQgbW92ZSB0byBbMV0uCj4gPgo+ID4gQWx0aG91Z2ggdGhlIG9yaWdpbmFs
IG1vdGl2YXRpb24gZm9yIHRoZSBidWRkeSBzeXN0ZW0gd2FzIGZvciB1c2Ugb24KPiA+IHN5c3Rl
bXMgd2l0aG91dCBhbiBhcmNoLXNwZWNpZmljIGhhcmRsb2NrdXAgZGV0ZWN0b3IsIGl0IGNhbiBz
dGlsbCBiZQo+ID4gdXNlZnVsIHRvIHVzZSBldmVuIG9uIHN5c3RlbXMgdGhhdCBfZG9fIGhhdmUg
YW4gYXJjaC1zcGVjaWZpYwo+ID4gaGFyZGxvY2t1cCBkZXRlY3Rvci4gT24geDg2LCBmb3IgaW5z
dGFuY2UsIHRoZXJlIGlzIGEgMjQtcGFydCBwYXRjaAo+ID4gc2VyaWVzIFs0XSBpbiBwcm9ncmVz
cyBzd2l0Y2hpbmcgdGhlIGFyY2gtc3BlY2lmaWMgaGFyZCBsb2NrdXAKPiA+IGRldGVjdG9yIGZy
b20gYSBzY2FyY2UgcGVyZiBjb3VudGVyIHRvIGEgbGVzcy1zY2FyY2UgaGFyZHdhcmUKPiA+IHJl
c291cmNlLiBQb3RlbnRpYWxseSB0aGUgYnVkZHkgc3lzdGVtIGNvdWxkIGJlIGEgc2ltcGxlciBh
bHRlcm5hdGl2ZQo+ID4gdG8gZnJlZSB1cCB0aGUgcGVyZiBjb3VudGVyIGJ1dCBzdGlsbCBnZXQg
aGFyZCBsb2NrdXAgZGV0ZWN0aW9uLgo+ID4KPiA+IE92ZXJhbGwsIHByb3MgKCspIGFuZCBjb25z
ICgtKSBvZiB0aGUgYnVkZHkgc3lzdGVtIGNvbXBhcmVkIHRvIGFuCj4gPiBhcmNoLXNwZWNpZmlj
IGhhcmRsb2NrdXAgZGV0ZWN0b3I6Cj4gPiArIFVzYWJsZSBvbiBzeXN0ZW1zIHRoYXQgZG9uJ3Qg
aGF2ZSBhbiBhcmNoLXNwZWNpZmljIGhhcmRsb2NrdXAKPiA+ICAgZGV0ZWN0b3IsIGxpa2UgYXJt
MzIgYW5kIGFybTY0ICh0aG91Z2ggaXQncyBiZWluZyB3b3JrZWQgb24gZm9yCj4gPiAgIGFybTY0
IFs1XSkuCj4gPiArIE1heSBmcmVlIHVwIHNjYXJjZSBoYXJkd2FyZSByZXNvdXJjZXMuCj4gPiAr
IElmIGEgQ1BVIHRvdGFsbHkgZ29lcyBvdXQgdG8gbHVuY2ggKGNhbid0IHByb2Nlc3MgTk1Jcykg
dGhlIGJ1ZGR5Cj4gPiAgIHN5c3RlbSBjb3VsZCBzdGlsbCBkZXRlY3QgdGhlIHByb2JsZW0gKHRo
b3VnaCBpdCB3b3VsZCBiZSB1bmxpa2VseQo+ID4gICB0byBiZSBhYmxlIHRvIGdldCBhIHN0YWNr
IHRyYWNlKS4KPiA+IC0gSWYgYWxsIENQVXMgYXJlIGhhcmQgbG9ja2VkIHVwIGF0IHRoZSBzYW1l
IHRpbWUgdGhlIGJ1ZGR5IHN5c3RlbQo+ID4gICBjYW4ndCBkZXRlY3QgaXQuCj4gPiAtIElmIHdl
IGRvbid0IGhhdmUgU01QIHdlIGNhbid0IHVzZSB0aGUgYnVkZHkgc3lzdGVtLgo+ID4gLSBUaGUg
YnVkZHkgc3lzdGVtIG5lZWRzIGFuIGFyY2gtc3BlY2lmaWMgbWVjaGFuaXNtIChwb3NzaWJseSBO
TUkKPiA+ICAgYmFja3RyYWNlKSB0byBnZXQgaW5mbyBhYm91dCB0aGUgbG9ja2VkIHVwIENQVS4K
PiA+Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMDQxOTIyNTYwNC4yMTIw
NC0xLWRpYW5kZXJzQGNocm9taXVtLm9yZwo+ID4gWzJdIGh0dHBzOi8vaXNzdWV0cmFja2VyLmdv
b2dsZS5jb20vMTcyMjEzMTI5Cj4gPiBbM10gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvdHJhY2Uv
Y29yZXNpZ2h0L2NvcmVzaWdodC1jcHUtZGVidWcuaHRtbAo+ID4gWzRdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMzAzMDEyMzQ3NTMuMjg1ODItMS1yaWNhcmRvLm5lcmktY2FsZGVy
b25AbGludXguaW50ZWwuY29tLwo+ID4gWzVdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWFybS1rZXJuZWwvMjAyMjA5MDMwOTM0MTUuMTU4NTAtMS1sZWNvcHplci5jaGVuQG1lZGlhdGVr
LmNvbS8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBDcm9zcyA8Y2Nyb3NzQGFuZHJvaWQu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5v
cmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxncm9lY2tAY2hyb21pdW0ub3Jn
Pgo+ID4gU2lnbmVkLW9mZi1ieTogVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBjaHJvbWl1bS5vcmc+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5v
cmc+Cj4gPiAtLS0KPiA+IFRoaXMgcGF0Y2ggaGFzIGJlZW4gcmViYXNlZCBpbiBDaHJvbWVPUyBr
ZXJuZWwgdHJlZXMgbWFueSB0aW1lcywgYW5kCj4gPiBlYWNoIHRpbWUgc29tZW9uZSBoYWQgdG8g
ZG8gd29yayBvbiBpdCB0aGV5IGFkZGVkIHRoZWlyCj4gPiBTaWduZWQtb2ZmLWJ5LiBJJ3ZlIGlu
Y2x1ZGVkIHRob3NlIGhlcmUuIEkndmUgYWxzbyBsZWZ0IHRoZSBhdXRob3IgYXMKPiA+IENvbGlu
IENyb3NzIHNpbmNlIHRoZSBjb3JlIGNvZGUgaXMgc3RpbGwgaGlzLgo+ID4KPiA+IEknbGwgYWxz
byBub3RlIHRoYXQgdGhlIENDIGxpc3QgaXMgcHJldHR5IGdpYW50LCBidXQgdGhhdCdzIHdoYXQK
PiA+IGdldF9tYWludGFpbmVycyBjYW1lIHVwIHdpdGggKHBsdXMgYSBmZXcgb3RoZXIgZm9sa3Mg
SSB0aG91Z2h0IHdvdWxkCj4gPiBiZSBpbnRlcmVzdGVkKS4gQXMgZmFyIGFzIEkgY2FuIHRlbGws
IHRoZXJlJ3Mgbm8gdHJ1ZSBNQUlOVEFJTkVSCj4gPiBsaXN0ZWQgZm9yIHRoZSBleGlzdGluZyB3
YXRjaGRvZyBjb2RlLiBBc3N1bWluZyBwZW9wbGUgZG9uJ3QgaGF0ZQo+ID4gdGhpcywgbWF5YmUg
aXQgd291bGQgZ28gdGhyb3VnaCBBbmRyZXcgTW9ydG9uJ3MgdHJlZT8KPiA+Cj4gPiBDaGFuZ2Vz
IGluIHYyOgo+ID4gLSBjcHUgPT4gQ1BVLgo+ID4gLSBSZXdvcmtlZCBkZXNjcmlwdGlvbiBhbmQg
S2NvbmZpZyBiYXNlZCBvbiB2MSBkaXNjdXNzaW9uLgo+Cj4gb3IgYXQgbGVhc3Qgc29tZSBvZiB0
aGUgY29tbWVudHMgZnJvbSB2MS4gOigKCk9oIG5vISBNeSBlbWFpbCBwcm9ncmFtIGNvbmZ1c2Vk
IG1lIGFuZCBJIHRob3VnaHQgYWxsIG9mIHlvdXIgY3B1PT5DUFUKc3R1ZmYgd2FzIGluIHRoZSBw
YXRjaCBkZXNjcmlwdGlvbiwgbm90IGluIHRoZSBLY29uZmlnLiBJJ2xsIHdoaXAgdXAgYQpxdWlj
ayB2My4KCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9rZ2RiLWJ1Z3JlcG9ydAo=
