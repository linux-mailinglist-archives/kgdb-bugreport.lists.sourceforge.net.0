Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2183B704BDA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 May 2023 13:09:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pysYS-0000KK-En
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 May 2023 11:09:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1pysYQ-0000K2-FQ
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 May 2023 11:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/lEOYeeU5eTLm7de7UnRvbY+9wcsAqP7XOcqCDjWADA=; b=fpEdihTRzDdo5Ngznjhck+PCiH
 wEDKjgoXy1/Wcq7HYGwozTW62LwAgOJK3ekpCQtsmya/lqiEl+j8ljmN7+3tL6b4TiNqtel5kuj65
 xftRAx9KyXipXMUo3BXCT7hJOOzHmNuSPr4my1kFjag/O/rfHmeCCzqza5uv1YhogOtc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/lEOYeeU5eTLm7de7UnRvbY+9wcsAqP7XOcqCDjWADA=; b=U6Xz0r/QFWOyYQTqcLz1NFqTd1
 NGNUTsLXkaOZ9T70Gaq8n3LMyWzLxAarZY2gVbonKtuM3f1CV1S8Oy6fO/lSdIMZ7OVX+K2YtCv6Q
 M68uCHNrw+a1li8VIvs7nvrsBDqkfLb9RjOtB2pHAK7TTrgDhoWPYoR4Hsc/p9pQ8aog=;
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pysYN-009SSy-3Y for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 May 2023 11:09:19 +0000
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-77cfcf7cfbaso8238705241.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 May 2023 04:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684235349; x=1686827349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lEOYeeU5eTLm7de7UnRvbY+9wcsAqP7XOcqCDjWADA=;
 b=F91DaGXtu8cS1xTXwl7OWZvIyv+be8t56bCpR4Bp7Qset+JdM9XIhqvV74Js0AWtjn
 CrOGWbJrTdeVeeckthIABj4nZKZIOcIFclUyw3N5nlAEl7jUZjfD2BMUMFBmRPCPpOP2
 OIkXWHgH8yiK7IpLdiq2ER2BTgwYnnJu76IQ2nOHSoUCbVQao/NlPvFi9qygXbndEyMn
 vXXBHMj44xswev4Y5ShqXjLPkDnVolwQizzYz9pJfo8DBpRHrzEt7z5OmR1VC5Ly//38
 t14HhdyJ686HvNfVwZtIGmr6iZhcmAdSW5sVJuFTSvlX6pZySgCDvbzAXPPRhqz8qJyu
 BY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684235349; x=1686827349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lEOYeeU5eTLm7de7UnRvbY+9wcsAqP7XOcqCDjWADA=;
 b=ZeGX5y8dXPkmurvOwEDoSmFPyC0y4JKa+Kv82D0yjVmO+4ZxJb7uLMoc2cuWwK/gje
 7Cf6NrzyLbglJ+ZiYiuq2IbgN9IiIssbadNXj/JDxap0bRHhJscQhtcoCF+Qj3evHKhN
 xoxCuBesJkjvpo7AXc4/bxkVm/QXUBI6wtaTpSd2aydhpWlmJzw5mlFQmb+QMQGWa9t1
 lqGn37jPE9DiX+/FxEDpogGw+u9qs4LZqxzkX1RNCXdyZtBhAWkWn7ACXLxCxXEGAuIn
 eh4qdzQlNYHX1uUpRnXiudEd/dWvzysmEXwX1kaYoDQ5nrYZM24Y/xr3C4PjBTYFcnyl
 iA5w==
X-Gm-Message-State: AC+VfDwxBBILRBsqi6aLCGoniNpqC9pqiHsKsI4uNv+V2ZavkcLhLEtx
 IT14Ihi3K1p84vTEwLlpzBNA/MWF7035dlD8qkdIFqMfPQgLvU1XNZo=
X-Google-Smtp-Source: ACHHUZ6TLbLYd474B27i7fOyl3BsnPpQ4fbmukWnlRJS2Ui51PNk1Fw9UBPkdN9uxCCarlSOI3HX0KcO/kJKITuV9Sk=
X-Received: by 2002:a1f:6dc6:0:b0:44f:eb0a:77db with SMTP id
 i189-20020a1f6dc6000000b0044feb0a77dbmr13395898vkc.11.1684231772863; Tue, 16
 May 2023 03:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
 <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
 <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
In-Reply-To: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 16 May 2023 15:39:21 +0530
Message-ID: <CAFA6WYOU8HW2JVBfCeFEkn-5cd81TM-x=ArUKeaSi3NzxgKaGQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, 10 May 2023 at 22:20, Doug Anderson <dianders@chromium.org>
    wrote: > > Hi, > > On Wed, May 10, 2023 at 9:30 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > > > On Wed, May 10, 2023 at 08:2 [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.47 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1pysYN-009SSy-3Y
Subject: Re: [Kgdb-bugreport] [PATCH v8 00/10] arm64: Add framework to turn
 an IPI as NMI
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Ulf Hansson <ulf.hansson@linaro.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Pierre Gondois <Pierre.Gondois@arm.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>,
 Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ito-yuichi@fujitsu.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCAxMCBNYXkgMjAyMyBhdCAyMjoyMCwgRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgOToz
MOKAr0FNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0IDA4OjI4OjE3QU0gLTA3MDAsIERvdWcgQW5kZXJzb24g
d3JvdGU6Cj4gPiA+IEhpLAo+ID4KPiA+IEhpIERvdWcsCj4gPgo+ID4gPiBPbiBXZWQsIEFwciAx
OSwgMjAyMyBhdCAzOjU34oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPiB3cm90ZToKPiA+ID4gPiBUaGlzIGlzIGFuIGF0dGVtcHQgdG8gcmVzdXJyZWN0IFN1bWl0
J3Mgb2xkIHBhdGNoIHNlcmllcyBbMV0gdGhhdAo+ID4gPiA+IGFsbG93ZWQgdXMgdG8gdXNlIHRo
ZSBhcm02NCBwc2V1ZG8tTk1JIHRvIGdldCBiYWNrdHJhY2VzIG9mIENQVXMgYW5kCj4gPiA+ID4g
YWxzbyB0byByb3VuZCB1cCBDUFVzIGluIGtkYi9rZ2RiLiBUaGUgbGFzdCBwb3N0IGZyb20gU3Vt
aXQgdGhhdCBJCj4gPiA+ID4gY291bGQgZmluZCB3YXMgdjcsIHNvIEkgY2FsbGVkIHRoaXMgc2Vy
aWVzIHY4LiBJIGhhdmVuJ3QgY29waWVkIGFsbCBvZgo+ID4gPiA+IGhpcyBvbGQgY2hhbmdlbG9u
Z3MgaGVyZSwgYnV0IHlvdSBjYW4gZmluZCB0aGVtIGZyb20gdGhlIGxpbmsuCj4gPiA+ID4KClRo
YW5rcyBEb3VnIGZvciBwaWNraW5nIHVwIHRoaXMgd29yayBhbmQgZm9yIGFsbCB5b3VyIGFkZGl0
aW9ucy9pbXByb3ZlbWVudHMuCgo+ID4gPiA+IFNpbmNlIHY3LCBJIGhhdmU6Cj4gPiA+ID4gKiBB
ZGRyZXNzZWQgdGhlIHNtYWxsIGFtb3VudCBvZiBmZWVkYmFjayB0aGF0IHdhcyB0aGVyZSBmb3Ig
djcuCj4gPiA+ID4gKiBSZWJhc2VkLgo+ID4gPiA+ICogQWRkZWQgYSBuZXcgcGF0Y2ggdGhhdCBw
cmV2ZW50cyB1cyBmcm9tIHNwYW1taW5nIHRoZSBsb2dzIHdpdGggaWRsZQo+ID4gPiA+ICAgdGFz
a3MuCj4gPiA+ID4gKiBBZGRlZCBhbiBleHRyYSBwYXRjaCB0byBncmFjZWZ1bGx5IGZhbGwgYmFj
ayB0byByZWd1bGFyIElQSXMgaWYKPiA+ID4gPiAgIHBzZXVkby1OTUlzIGFyZW4ndCB0aGVyZS4K
PiA+ID4gPgo+ID4gPiA+IFNpbmNlIHRoZXJlIGFwcGVhciB0byBiZSBhIGZldyBkaWZmZXJlbnQg
cGF0Y2hlcyBzZXJpZXMgcmVsYXRlZCB0bwo+ID4gPiA+IGJlaW5nIGFibGUgdG8gdXNlIE5NSXMg
dG8gZ2V0IHN0YWNrIHRyYWNlcyBvZiBjcmFzaGVkIHN5c3RlbXMsIGxldCBtZQo+ID4gPiA+IHRy
eSB0byBvcmdhbml6ZSB0aGVtIHRvIHRoZSBiZXN0IG9mIG15IHVuZGVyc3RhbmRpbmc6Cj4gPiA+
ID4KPiA+ID4gPiBhKSBUaGlzIHNlcmllcy4gT24gaXRzIG93biwgYSkgd2lsbCAoYW1vbmcgb3Ro
ZXIgdGhpbmdzKSBlbmFibGUgc3RhY2sKPiA+ID4gPiAgICB0cmFjZXMgb2YgYWxsIHJ1bm5pbmcg
cHJvY2Vzc2VzIHdpdGggdGhlIHNvZnQgbG9ja3VwIGRldGVjdG9yIGlmCj4gPiA+ID4gICAgeW91
J3ZlIGVuYWJsZWQgdGhlIHN5c2N0bCAia2VybmVsLnNvZnRsb2NrdXBfYWxsX2NwdV9iYWNrdHJh
Y2UiLiBPbgo+ID4gPiA+ICAgIGl0cyBvd24sIGEpIGRvZXNuJ3QgZ2l2ZSBhIGhhcmQgbG9ja3Vw
IGRldGVjdG9yLgo+ID4gPiA+Cj4gPiA+ID4gYikgQSBkaWZmZXJlbnQgcmVjZW50bHktcG9zdGVk
IHNlcmllcyBbMl0gdGhhdCBhZGRzIGEgaGFyZCBsb2NrdXAKPiA+ID4gPiAgICBkZXRlY3RvciBi
YXNlZCBvbiBwZXJmLiBPbiBpdHMgb3duLCBiKSBnaXZlcyBhIHN0YWNrIGNyYXdsIG9mIHRoZQo+
ID4gPiA+ICAgIGxvY2tlZCB1cCBDUFUgYnV0IG5vIHN0YWNrIGNyYXdscyBvZiBvdGhlciBDUFVz
IChldmVuIGlmIHRoZXkncmUKPiA+ID4gPiAgICBsb2NrZWQgdG9vKS4gVG9nZXRoZXIgd2l0aCBh
KSArIGIpIHdlIGdldCBldmVyeXRoaW5nIChmdWxsIGxvY2t1cAo+ID4gPiA+ICAgIGRldGVjdCwg
ZnVsbCBhYmlsaXR5IHRvIGdldCBzdGFjayBjcmF3bHMpLgo+ID4gPiA+Cj4gPiA+ID4gYykgVGhl
IG9sZCBBbmRyb2lkICJidWRkeSIgaGFyZCBsb2NrdXAgZGV0ZWN0b3IgWzNdIHRoYXQgSSdtCj4g
PiA+ID4gICAgY29uc2lkZXJpbmcgdHJ5aW5nIHRvIHVwc3RyZWFtLiBJZiBiKSBsYW5kcyB0aGVu
IEkgYmVsaWV2ZSBjKSB3b3VsZAo+ID4gPiA+ICAgIGJlIHJlZHVuZGFudCAoYXQgbGVhc3QgZm9y
IGFybTY0KS4gYykgb24gaXRzIG93biBpcyByZWFsbHkgb25seQo+ID4gPiA+ICAgIHVzZWZ1bCBv
biBhcm02NCBmb3IgcGxhdGZvcm1zIHRoYXQgY2FuIHByaW50IENQVV9EQkdQQ1NSIHNvbWVob3cK
PiA+ID4gPiAgICAoc2VlIFs0XSkuIGEpICsgYykgaXMgcm91Z2hseSBhcyBnb29kIGFzIGEpICsg
YikuCj4gPgo+ID4gPiBJdCdzIGJlZW4gMyB3ZWVrcyBhbmQgSSBoYXZlbid0IGhlYXJkIGEgcGVl
cCBvbiB0aGlzIHNlcmllcy4gVGhhdAo+ID4gPiBtZWFucyBub2JvZHkgaGFzIGFueSBvYmplY3Rp
b25zIGFuZCBpdCdzIGFsbCBnb29kIHRvIGxhbmQsIHJpZ2h0Pwo+ID4gPiBSaWdodD8gOi1QCgpG
b3IgbWUgaXQgd2FzIG1vbnRocyB3YWl0aW5nIHdpdGhvdXQgYW55IGZlZWRiYWNrLiBTbyBJIHRo
aW5rIHlvdSBhcmUKbHVja3kgOikgb3IgYXRsZWFzdCBiZXR0ZXIgdGhhbiBtZSBhdCBwb2tpbmcg
YXJtNjQgbWFpbnRhaW5lcnMuCgo+ID4KPiA+IEZXSVcsIHRoZXJlIGFyZSBzdGlsbCBsb25nc3Rh
bmRpbmcgc291bmRuZXNzIGlzc3VlcyBpbiB0aGUgYXJtNjQgcHNldWRvLU5NSQo+ID4gc3VwcG9y
dCAoYW5kIGZpeGluZyB0aGF0IHJlcXVpcmVzIGFuIG92ZXJoYXVsIG9mIG91ciBEQUlGIC8gSVJR
IGZsYWcKPiA+IG1hbmFnZW1lbnQsIHdoaWNoIEkndmUgYmVlbiBjaGlwcGluZyBhd2F5IGF0IGZv
ciBhIG51bWJlciBvZiByZWxlYXNlcyksIHNvIEkKPiA+IGhhZG4ndCBsb29rZWQgYXQgdGhpcyBp
biBkZXRhaWwgeWV0IGJlY2F1c2UgdGhlIGZvdW5kYXRpb25zIGFyZSBzdGlsbCBzb21ld2hhdAo+
ID4gZG9kZ3kuCj4gPgo+ID4gSSBhcHByZWNpYXRlIHRoYXQgdGhpcyBoYXMgYmVlbiBhcm91bmQg
Zm9yIGEgd2hpbGUsIGFuZCBpdCdzIG9uIG15IHF1ZXVlIHRvCj4gPiBsb29rIGF0Lgo+Cj4gQWgs
IHRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwISBXZSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IHR1cm5p
bmcgdGhpcyBvbgo+IGluIHByb2R1Y3Rpb24gaW4gQ2hyb21lT1MgYmVjYXVzZSBpdCB3aWxsIGhl
bHAgdXMgdHJhY2sgZG93biBhIHdob2xlCj4gY2xhc3Mgb2YgZmllbGQtZ2VuZXJhdGVkIGNyYXNo
IHJlcG9ydHMgdGhhdCBhcmUgb3RoZXJ3aXNlIG9wYXF1ZSB0bwo+IHVzLiBJdCBzb3VuZHMgYXMg
aWYgbWF5YmUgdGhhdCdzIG5vdCBhIGdvb2QgaWRlYSBxdWl0ZSB5ZXQ/IERvIHlvdQo+IGhhdmUg
YW55IGlkZWEgb2YgaG93IG11Y2ggZmFydGhlciBhbG9uZyB0aGlzIG5lZWRzIHRvIGdvPyAuLi5v
Zgo+IGNvdXJzZSwgd2UndmUgYWxzbyBydW4gaW50byBpc3N1ZXMgd2l0aCBNZWRpYXRlayBkZXZp
Y2VzIGJlY2F1c2UgdGhleQo+IGRvbid0IHNhdmUvcmVzdG9yZSBHSUNSIHJlZ2lzdGVycyBwcm9w
ZXJseSBbMV0uIEluIHRoZW9yeSwgd2UgbWlnaHQgYmUKPiBhYmxlIHRvIHdvcmsgYXJvdW5kIHRo
YXQgaW4gdGhlIGtlcm5lbC4KPgo+IEluIGFueSBjYXNlLCBldmVuIGlmIHRoZXJlIGFyZSBidWdz
IHRoYXQgd291bGQgcHJldmVudCB0dXJuaW5nIHRoaXMgb24KPiBmb3IgcHJvZHVjdGlvbiwgaXQg
c3RpbGwgc2VlbXMgbGlrZSB3ZSBjb3VsZCBzdGlsbCBsYW5kIHRoaXMgc2VyaWVzLgo+IEl0IHNp
bXBseSB3b3VsZG4ndCBkbyBhbnl0aGluZyB1bnRpbCBzb21lb25lIHR1cm5lZCBvbiBwc2V1ZG8g
Tk1JcywKPiB3aGljaCB3b3VsZG4ndCBoYXBwZW4gdGlsbCB0aGUga2lua3MgYXJlIHdvcmtlZCBv
dXQuCgpJIGFncmVlIGhlcmUuIFdlIHNob3VsZCBiZSBhYmxlIHRvIG1ha2UgdGhlIGZvdW5kYXRp
b25zIHJvYnVzdCBsYXRlcgpvbi4gSU1ITywgdW50aWwgd2UgdHVybiBvbiBmZWF0dXJlcyBzdXJy
b3VuZGluZyBwc2V1ZG8gTk1JcywgSSBhbSBub3QKc3VyZSBob3cgd2UgY2FuIGhhdmUgdHJ1ZSBj
b25maWRlbmNlIGluIHRoZSB1bmRlcmx5aW5nIHJvYnVzdG5lc3MuCgotU3VtaXQKCj4KPiAuLi5h
Y3R1YWxseSwgSSBndWVzcyBJIHNob3VsZCBzYXkgdGhhdCBpZiBhbGwgdGhlIHBhdGNoZXMgb2Yg
dGhlCj4gY3VycmVudCBzZXJpZXMgZG8gbGFuZCB0aGVuIGl0IGFjdHVhbGx5IF93b3VsZF8gc3Rp
bGwgZG8gc29tZXRoaW5nLAo+IGV2ZW4gd2l0aG91dCBwc2V1ZG8tTk1JLiBBc3N1bWluZyB0aGUg
bGFzdCBwYXRjaCBsb29rcyBPSywgaXQgd291bGQgYXQKPiBsZWFzdCBzdGFydCBmYWxsaW5nIGJh
Y2sgdG8gdXNpbmcgcmVndWxhciBJUElzIHRvIGRvIGJhY2t0cmFjZXMuIFRoYXQKPiB3b3VsZG4n
dCBnZXQgYmFja3RyYWNlcyBvbiBoYXJkIGxvY2tlZCB1cCBDUFVzIGJ1dCBpdCB3b3VsZCBiZSBi
ZXR0ZXIKPiB0aGFuIHdoYXQgd2UgaGF2ZSB0b2RheSB3aGVyZSB3ZSBkb24ndCBnZXQgYW55IGJh
Y2t0cmFjZXMuIFRoaXMgd291bGQKPiBnZXQgYXJtNjQgb24gcGFyIHdpdGggYXJtMzIuLi4KPgo+
IFsxXSBodHRwczovL2lzc3VldHJhY2tlci5nb29nbGUuY29tLzI4MTgzMTI4OAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1h
aWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
