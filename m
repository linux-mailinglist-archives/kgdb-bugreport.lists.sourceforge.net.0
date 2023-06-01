Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9F71F523
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:56:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4qHR-0004zC-3Q
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:56:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4qHP-0004z5-9Z
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eogoQvqQO6ZvyvYBhcgWNYvozKgAFgLZqqjPS4QzrXk=; b=eBRjbrwzTd+jFQEFmbIOjo6e3L
 6q/+sjJquOBa1YXAHzyBn00Kx5UDHqxMG5qX5Hw7GJDosiS4R/h3WSSM//m6Fimrm8nwOVrcDmWED
 c1asnX0tA+JlS6AMMz/zstJ+K0O7Q6YjzECNXVi257/rkY226EDzIyA8n0LhWN1sz8ns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eogoQvqQO6ZvyvYBhcgWNYvozKgAFgLZqqjPS4QzrXk=; b=EynU122WJ6e+trIzEDu5u3shfA
 QGLaDcxtAvyQVPUE15vBliGbMdg2CPFYjRU6yfxMbsvisHkqwk/34d0cMVtfbIOSwv5u98t7s4TRQ
 fDiKNUp/5u/JWetx993FOfFvqoa/bRCpBCGEm0F1Th8beg0DCa2Y9rrXkbYiN1iZ8Lro=;
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4qHO-008l0n-FT for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:56:24 +0000
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-33d0b7114a9so5578845ab.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685656576; x=1688248576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eogoQvqQO6ZvyvYBhcgWNYvozKgAFgLZqqjPS4QzrXk=;
 b=n+u0TSjGaRFOVRNqNesFA09VT5tefoPlA2/rBhBQx+mFm6mlHIyO75i0mkGSorLwYP
 Mv2tQzkIZfBLz3i9Y7zdQcn8Nvkf2xmpXxJbCJmcumz6/WYt9+zyE3wajMd54170LqAQ
 MPgLi6hpDjaMUyJTm5YZGbMhwZTX7Km/EryDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685656576; x=1688248576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eogoQvqQO6ZvyvYBhcgWNYvozKgAFgLZqqjPS4QzrXk=;
 b=BoIhsC78f4njxFU+MEUBqVLj3s2hGe1x4SMXN6qfGLaWuI7WgVMyC1CTJ42MSV7V6Z
 W2maRznktVUuarVD1d+NZjd6WnR01nCR62LpvuZMc/j7zk+AfdTLv+8IDAamAyD/G5Q+
 a3LAPjVCwvjDwNIU2I4J6Z9j+ClpSU6e8d5wHI8ZsHByqbiZXOJuZ1kDIfATU3MAutkL
 lfxoxgpZnwETdnuB8YpORMApSC0tbhSbK7NB+L29+as9+xp2vjvZN8bybMiKdINy/PHO
 oWYHW2EAmbniw4vnwLe24Ce84JhMIs4SFBTGGXJnnYj3JHqLl6uhapS/6xO5m3ok22gZ
 +gVA==
X-Gm-Message-State: AC+VfDyYVCxNw5VLAW/7oXyY+vb8aJkLP/yCyAr/mJqK5Hm5Fof/RY/w
 vB9PLBi1ZcisFuxYm2AgNNeWFSEsBld7LLtHUz0=
X-Google-Smtp-Source: ACHHUZ4FhWhk2oXRID5Bc8Oc2mBvHoFPdqr372cM+27IyskNqXXIYzBnw9dLvdj8NoluM6ZxdTb/cQ==
X-Received: by 2002:a92:cc11:0:b0:331:105c:81f9 with SMTP id
 s17-20020a92cc11000000b00331105c81f9mr7073604ilp.29.1685656576365; 
 Thu, 01 Jun 2023 14:56:16 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173]) by smtp.gmail.com with ESMTPSA id
 t13-20020a92cc4d000000b00325e4c39de8sm3166593ilq.66.2023.06.01.14.56.16
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 14:56:16 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-33b398f2ab8so44755ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:56:16 -0700 (PDT)
X-Received: by 2002:a05:6e02:214e:b0:33b:3d94:afb5 with SMTP id
 d14-20020a056e02214e00b0033b3d94afb5mr11901ilv.25.1685656080333; Thu, 01 Jun
 2023 14:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.7.I21d92f8974c8e4001a5982fea6c98da1bed33ef5@changeid>
 <20230512134853.GA216623@aspen.lan>
 <CAD=FV=W4owWm4pVhXWKJpjFj75E=hzYkOZ6ZrZu2DqUF8Nt0cw@mail.gmail.com>
In-Reply-To: <CAD=FV=W4owWm4pVhXWKJpjFj75E=hzYkOZ6ZrZu2DqUF8Nt0cw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Jun 2023 14:47:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLAMv1rHiWWAoP8aTCpjWyzuHRuZtYAQRP3BwxFY0YNQ@mail.gmail.com>
Message-ID: <CAD=FV=WLAMv1rHiWWAoP8aTCpjWyzuHRuZtYAQRP3BwxFY0YNQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, May 15, 2023 at 4:21 PM Doug Anderson <dianders@chromium.org>
    wrote: > > Hi, > > On Fri, May 12, 2023 at 6:49 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > On Wed, Apr 1 [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.181 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.181 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4qHO-008l0n-FT
Subject: Re: [Kgdb-bugreport] [PATCH v8 07/10] kgdb: Expose default CPUs
 roundup fallback mechanism
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jason Wessel <jason.wessel@windriver.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIE1heSAxNSwgMjAyMyBhdCA0OjIx4oCvUE0gRG91ZyBBbmRlcnNvbiA8ZGlh
bmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gRnJpLCBNYXkgMTIsIDIw
MjMgYXQgNjo0OeKAr0FNIERhbmllbCBUaG9tcHNvbgo+IDxkYW5pZWwudGhvbXBzb25AbGluYXJv
Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMDM6NTY6MDFQTSAt
MDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gRnJvbTogU3VtaXQgR2FyZyA8c3Vt
aXQuZ2FyZ0BsaW5hcm8ub3JnPgo+ID4gPgo+ID4gPiBBZGQgYSBuZXcgQVBJIGtnZGJfc21wX2Nh
bGxfbm1pX2hvb2soKSB0byBleHBvc2UgZGVmYXVsdCBDUFVzIHJvdW5kdXAKPiA+ID4gbWVjaGFu
aXNtIHRvIGEgcGFydGljdWxhciBhcmNoaWNoZWN0dXJlIGFzIGEgcnVudGltZSBmYWxsYmFjayBp
ZiBpdAo+ID4gPiBkZXRlY3RzIHRvIG5vdCBzdXBwb3J0IE5NSSByb3VuZHVwLgo+ID4gPgo+ID4g
PiBDdXJyZW50bHkgc3VjaCBhbiBhcmNoaXRlY3R1cmUgZXhhbXBsZSBpcyBhcm02NCBzdXBwb3J0
aW5nIHBzZXVkbyBOTUlzCj4gPiA+IGZlYXR1cmUgd2hpY2ggaXMgb25seSBhdmFpbGFibGUgb24g
cGxhdGZvcm1zIHdoaWNoIGhhdmUgc3VwcG9ydCBmb3IgR0lDdjMKPiA+ID4gb3IgbGF0ZXIgdmVy
c2lvbi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0Bs
aW5hcm8ub3JnPgo+ID4gPiBUZXN0ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4gPiA+Cj4g
PiA+ICBpbmNsdWRlL2xpbnV4L2tnZGIuaCAgICAgIHwgMTIgKysrKysrKysrKysrCj4gPiA+ICBr
ZXJuZWwvZGVidWcvZGVidWdfY29yZS5jIHwgIDggKysrKysrKy0KPiA+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9rZ2RiLmggYi9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ID4gPiBp
bmRleCAyNThjZGRlOGQzNTYuLjg3NzEzYmQzOTBmMyAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVk
ZS9saW51eC9rZ2RiLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC9rZ2RiLmgKPiA+ID4gQEAg
LTE5OSw2ICsxOTksMTggQEAga2dkYl9hcmNoX2hhbmRsZV9xeGZlcl9wa3QoY2hhciAqcmVtY29t
X2luX2J1ZmZlciwKPiA+ID4KPiA+ID4gIGV4dGVybiB2b2lkIGtnZGJfY2FsbF9ubWlfaG9vayh2
b2lkICppZ25vcmVkKTsKPiA+ID4KPiA+ID4gKy8qKgo+ID4gPiArICogICBrZ2RiX3NtcF9jYWxs
X25taV9ob29rIC0gUHJvdmlkZSBkZWZhdWx0IGZhbGxiYWNrIG1lY2hhbmlzbSB0bwo+ID4gPiAr
ICogICAgICAgICAgICAgICAgICAgICAgICAgICAgcm91bmQtdXAgQ1BVcwo+ID4gPiArICoKPiA+
ID4gKyAqICAgSWYgeW91J3JlIHVzaW5nIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uIG9mIGtn
ZGJfcm91bmR1cF9jcHVzKCkKPiA+ID4gKyAqICAgdGhpcyBmdW5jdGlvbiB3aWxsIGJlIGNhbGxl
ZC4gIEFuZCBpZiBhbiBhcmNoIGRldGVjdHMgYXQgcnVudGltZSB0bwo+ID4gPiArICogICBub3Qg
c3VwcG9ydCBOTUkgYmFzZWQgcm91bmR1cCB0aGVuIGl0IGNhbiBmYWxsYmFjayB0byBkZWZhdWx0
Cj4gPiA+ICsgKiAgIG1lY2hhbmlzbSB1c2luZyB0aGlzIEFQSS4KPiA+ID4gKyAqLwo+ID4gPiAr
Cj4gPiA+ICtleHRlcm4gdm9pZCBrZ2RiX3NtcF9jYWxsX25taV9ob29rKHZvaWQpOwo+ID4KPiA+
IENvbmNlcHQgbG9va3Mgc2Vuc2libGUgYnV0IHRoaXMgaXMgYSB0ZXJyaWJsZSBuYW1lIGZvciBh
YSBjb21tYW5kIHRvCj4gPiByb3VuZCB1cCB0aGUgQ1BVcyB1c2luZyBzbXBfY2FsbC4uLiBmdW5j
dGlvbnMuIFdoaWxzdCBpdCBpcyB0cnVlIGl0IHRoYXQKPiA+IGtnZGJfcm91bmR1cF9jcHVzKCkg
ZG9lcyB1c2Uga2dkYl9jYWxsX25taV9ob29rKCkgaW50ZXJuYWxseSB0aGF0Cj4gPiBkb2Vzbid0
IG1lYW4gd2Ugc2hvdWxkIG5hbWUgZnVuY3Rpb25zIGFmdGVyIGl0LiBUaGV5IHNob3VsZCBiZSBu
YW1lZAo+ID4gYWZ0ZXIgd2hhdCB0aGV5IGFyZSBkbywgbm90IGhvdyB0aGV5IGRvIGl0Lgo+ID4K
PiA+IFNvbWV0aGluZyBtb3JlIGxpa2Uga2dkYl9yb3VuZHVwX2NwdXNfd2l0aF9zbXBfY2FsbCgp
IHdvdWxkIGJlIGEgbXVjaAo+ID4gYmV0dGVyIG5hbWUuCj4KPiBTb3VuZHMgZ29vZC4gSSdtIGhh
cHB5IHRvIHNwaW4gd2l0aCB0aGlzIHJlbmFtZSwgdGhvdWdoIEkgd2FzIGtpbmRhCj4gaG9waW5n
IHRvIGRyb3AgJHtTVUJKRUNUfSBwYXRjaCBpZiBmb2xrcyB3ZXJlIE9LIHdpdGggcGF0Y2ggIzEw
IGluCj4gdGhpcyBzZXJpZXMgWzFdLiBJIHBlcnNvbmFsbHkgdGhpbmsgdGhhdCdzIHRoZSByaWdo
dCB3YXkgdG8gZ28gYnV0Cj4gaXQncyB1bmNsZWFyIHRvIG1lIGlmIGFybTY0IG1haW50YWluZXJz
IHdpbGwgdGhpbmsgaXQncyBhIGhhY2sKPiAoZGVzcGl0ZSB0aGUgZmFjdCB0aGF0IGFybTMyIGlt
cGxlbWVudHMgdGhlICJubWkiIGZ1bmN0aW9ucyB3aXRoCj4gcmVndWxhciBJUElzKS4KPgo+IEZv
ciBub3csIG1heWJlIEknbGwgdGhpbmsgcG9zaXRpdmUgdGhvdWdodHMgYW5kIGhvcGUgdGhhdCBm
b2xrcyB3aWxsCj4gaGF2ZSB0aGUgdGltZSB0byByZXZpZXcgdGhlIHNlcmllcyBzb29uLiBJZiBh
bm90aGVyIGZldyB3ZWVrcyBnbyBieQo+IHRoZW4gSSdsbCBzZW5kIGEgdjkgd2l0aCBqdXN0IHlv
dXIgY29tbWVudHMgYWRkcmVzc2VkLiBJZiBub3RoaW5nCj4gZWxzZSwgbWF5YmUgeW91IGNhbiBs
YW5kIHRoZSBrZ2RiIHBhcnRzIGluIGEgdHJlZSB0YXJnZXRpbmcgdjYuNSBhbmQKPiB0aGVuIHdo
ZW4gYXJtNjQgZm9sa3MgaGF2ZSB0aGUgYmFuZHdpZHRoIHRoZW4gaXQgd2lsbCBiZSBlYXNpZXIg
dG8gZ2V0Cj4gdGhlbSBsYW5kZWQuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIzMDQxOTE1NTM0MS52OC4xMC5JYzM2NTk5OTdkNjI0MzEzOWQwNTIyZmMzYWZjZGZkODhkN2E1
ZjAzMEBjaGFuZ2VpZAoKQnJlYWRjcnVtYnM6IEkndmUgZHJvcHBlZCB0aGlzIHBhdGNoIGFuZCBz
ZXZlcmFsIG90aGVycyBpbiB2OSBbMV0gYnkKZW1icmFjaW5nIHRoZSBpZGVhIG9mIHVzaW5nIGEg
bm9ybWFsIElQSSBhcyBhIGZhbGxiYWNrLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyMzA2MDEyMTM0NDAuMjQ4ODY2Ny0xLWRpYW5kZXJzQGNocm9taXVtLm9yZy8KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBt
YWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
