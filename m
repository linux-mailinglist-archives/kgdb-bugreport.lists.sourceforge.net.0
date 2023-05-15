Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315970415E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 May 2023 01:21:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pyhVp-00015o-Uf
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 15 May 2023 23:21:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pyhVp-00015e-7A
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 15 May 2023 23:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHuslTqJZ+9z+0LpFkq3T91ljIFdmNLjNbw3NtdKpY8=; b=V2/TVMyFFECP1rDoGGMrwmBEVx
 HfyXE15z3T4X1PV2aMkcmrg8Crv/ZgzUEoEc5FvTDufEuPKZ90/S9d1mYjTFaB2iBzJ4/4w8LIdgW
 /tqECBpEfgKZG29R9bulQSRB31k5+mTKCaYNserafg67fghWOJSf5brBmOVKOncudVB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KHuslTqJZ+9z+0LpFkq3T91ljIFdmNLjNbw3NtdKpY8=; b=BFejP/nLdDXOBnT7G4McMF5kVL
 LFSvVo93aQnFPRF+0KxLym/uwreL44RarKWAcfRPAeubz9K2w0uCH+91kXUgSxavVaDgDAf23rmJG
 Cn5cpcEPvZydvEhdaEDPgz31w5kiI5zlJNH4N3Wmwi4IHM4MuGNbGwR0Y66gUdxMRqY0=;
Received: from mail-qv1-f52.google.com ([209.85.219.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pyhVo-0004Zd-6R for kgdb-bugreport@lists.sourceforge.net;
 Mon, 15 May 2023 23:21:53 +0000
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-61b6a4233a1so116957336d6.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 15 May 2023 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684192905; x=1686784905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KHuslTqJZ+9z+0LpFkq3T91ljIFdmNLjNbw3NtdKpY8=;
 b=WV+e5ycnc9CmtNhVoOJM+RnyC8sf/CkiFLEpwRmiOwJMne6CjD1d/vrWXvOcLNVSc1
 rsb1zH0hj/e6XheuQ/j6Ngi70dbhGglWsTcF98F24jOm3hah+M5EWqN5k7eDvC9LvWTn
 3I52SnRgApuDVsXIqdIWq4CHqQMu1KWrvgivw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684192905; x=1686784905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHuslTqJZ+9z+0LpFkq3T91ljIFdmNLjNbw3NtdKpY8=;
 b=L/Band6VAHex+gr6oFIde7HWUuZ8eXUGLSqikgQXKBEZa2UXZPO7SRiZFF3a0Tc8+I
 3jtC9c07z6yIgePBBr6tdJu6/68WWS8kyqceN79AToTKtfY68UMjXrTr4T7tFXw4QE/p
 tyPRHqCpcwPPH0bj9kqROFHWwnRpqtLukl4PEzU2gdOG2Ym9JejUBIibRUFwPrubddaO
 W6CFZsWybgEAIYT0xbIIJukur1dUCvoNq2JcQxaoogQYkJapkBwllQc9h8CxSeQEivrG
 QKK93W31MdN5IPrCydtdHff3bX3PdcQAEGMwS4D+upg0tPVOUdPeeBEhQ0tkHa9RWxFU
 DMtw==
X-Gm-Message-State: AC+VfDypotgOx6+r/ycvmZQBRE1LMtuHpNwjanbcS9btnhj8zEXLsun1
 TGlSwowK6d77efLGhtbeNrurMN7sXTYM8iIO6s0=
X-Google-Smtp-Source: ACHHUZ5SeTUfHMWWOUEDEOUxnjasDFHTUZB+xw1xWes1xNFQCNy2JKRwQAwxS7m9P7rAFeAMa+jSPw==
X-Received: by 2002:a05:6214:dce:b0:614:9b92:cac1 with SMTP id
 14-20020a0562140dce00b006149b92cac1mr66511017qvt.47.1684192904984; 
 Mon, 15 May 2023 16:21:44 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 ea1-20020ad458a1000000b005e938eb99ecsm5244147qvb.122.2023.05.15.16.21.44
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 16:21:44 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-3f51ea3a062so373571cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 15 May 2023 16:21:44 -0700 (PDT)
X-Received: by 2002:a05:622a:88:b0:3f3:9c91:fee7 with SMTP id
 o8-20020a05622a008800b003f39c91fee7mr75321qtw.16.1684192903654; Mon, 15 May
 2023 16:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.7.I21d92f8974c8e4001a5982fea6c98da1bed33ef5@changeid>
 <20230512134853.GA216623@aspen.lan>
In-Reply-To: <20230512134853.GA216623@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 May 2023 16:21:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4owWm4pVhXWKJpjFj75E=hzYkOZ6ZrZu2DqUF8Nt0cw@mail.gmail.com>
Message-ID: <CAD=FV=W4owWm4pVhXWKJpjFj75E=hzYkOZ6ZrZu2DqUF8Nt0cw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, May 12, 2023 at 6:49 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Wed, Apr 19, 2023 at 03:56:01PM -0700, Douglas Anderson wrote:
    > > From: Sumit Garg <sumit.garg@linaro.org> [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.52 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pyhVo-0004Zd-6R
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

SGksCgpPbiBGcmksIE1heSAxMiwgMjAyMyBhdCA2OjQ54oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEFwciAxOSwgMjAy
MyBhdCAwMzo1NjowMVBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gRnJvbTog
U3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+ID4KPiA+IEFkZCBhIG5ldyBBUEkg
a2dkYl9zbXBfY2FsbF9ubWlfaG9vaygpIHRvIGV4cG9zZSBkZWZhdWx0IENQVXMgcm91bmR1cAo+
ID4gbWVjaGFuaXNtIHRvIGEgcGFydGljdWxhciBhcmNoaWNoZWN0dXJlIGFzIGEgcnVudGltZSBm
YWxsYmFjayBpZiBpdAo+ID4gZGV0ZWN0cyB0byBub3Qgc3VwcG9ydCBOTUkgcm91bmR1cC4KPiA+
Cj4gPiBDdXJyZW50bHkgc3VjaCBhbiBhcmNoaXRlY3R1cmUgZXhhbXBsZSBpcyBhcm02NCBzdXBw
b3J0aW5nIHBzZXVkbyBOTUlzCj4gPiBmZWF0dXJlIHdoaWNoIGlzIG9ubHkgYXZhaWxhYmxlIG9u
IHBsYXRmb3JtcyB3aGljaCBoYXZlIHN1cHBvcnQgZm9yIEdJQ3YzCj4gPiBvciBsYXRlciB2ZXJz
aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAbGluYXJv
Lm9yZz4KPiA+IFRlc3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+ID4gU2ln
bmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4g
LS0tCj4gPgo+ID4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4gPgo+ID4gIGluY2x1ZGUvbGludXgv
a2dkYi5oICAgICAgfCAxMiArKysrKysrKysrKysKPiA+ICBrZXJuZWwvZGVidWcvZGVidWdfY29y
ZS5jIHwgIDggKysrKysrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rZ2RiLmgg
Yi9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ID4gaW5kZXggMjU4Y2RkZThkMzU2Li44NzcxM2JkMzkw
ZjMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ID4gKysrIGIvaW5jbHVk
ZS9saW51eC9rZ2RiLmgKPiA+IEBAIC0xOTksNiArMTk5LDE4IEBAIGtnZGJfYXJjaF9oYW5kbGVf
cXhmZXJfcGt0KGNoYXIgKnJlbWNvbV9pbl9idWZmZXIsCj4gPgo+ID4gIGV4dGVybiB2b2lkIGtn
ZGJfY2FsbF9ubWlfaG9vayh2b2lkICppZ25vcmVkKTsKPiA+Cj4gPiArLyoqCj4gPiArICogICBr
Z2RiX3NtcF9jYWxsX25taV9ob29rIC0gUHJvdmlkZSBkZWZhdWx0IGZhbGxiYWNrIG1lY2hhbmlz
bSB0bwo+ID4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJvdW5kLXVwIENQVXMKPiA+
ICsgKgo+ID4gKyAqICAgSWYgeW91J3JlIHVzaW5nIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9u
IG9mIGtnZGJfcm91bmR1cF9jcHVzKCkKPiA+ICsgKiAgIHRoaXMgZnVuY3Rpb24gd2lsbCBiZSBj
YWxsZWQuICBBbmQgaWYgYW4gYXJjaCBkZXRlY3RzIGF0IHJ1bnRpbWUgdG8KPiA+ICsgKiAgIG5v
dCBzdXBwb3J0IE5NSSBiYXNlZCByb3VuZHVwIHRoZW4gaXQgY2FuIGZhbGxiYWNrIHRvIGRlZmF1
bHQKPiA+ICsgKiAgIG1lY2hhbmlzbSB1c2luZyB0aGlzIEFQSS4KPiA+ICsgKi8KPiA+ICsKPiA+
ICtleHRlcm4gdm9pZCBrZ2RiX3NtcF9jYWxsX25taV9ob29rKHZvaWQpOwo+Cj4gQ29uY2VwdCBs
b29rcyBzZW5zaWJsZSBidXQgdGhpcyBpcyBhIHRlcnJpYmxlIG5hbWUgZm9yIGFhIGNvbW1hbmQg
dG8KPiByb3VuZCB1cCB0aGUgQ1BVcyB1c2luZyBzbXBfY2FsbC4uLiBmdW5jdGlvbnMuIFdoaWxz
dCBpdCBpcyB0cnVlIGl0IHRoYXQKPiBrZ2RiX3JvdW5kdXBfY3B1cygpIGRvZXMgdXNlIGtnZGJf
Y2FsbF9ubWlfaG9vaygpIGludGVybmFsbHkgdGhhdAo+IGRvZXNuJ3QgbWVhbiB3ZSBzaG91bGQg
bmFtZSBmdW5jdGlvbnMgYWZ0ZXIgaXQuIFRoZXkgc2hvdWxkIGJlIG5hbWVkCj4gYWZ0ZXIgd2hh
dCB0aGV5IGFyZSBkbywgbm90IGhvdyB0aGV5IGRvIGl0Lgo+Cj4gU29tZXRoaW5nIG1vcmUgbGlr
ZSBrZ2RiX3JvdW5kdXBfY3B1c193aXRoX3NtcF9jYWxsKCkgd291bGQgYmUgYSBtdWNoCj4gYmV0
dGVyIG5hbWUuCgpTb3VuZHMgZ29vZC4gSSdtIGhhcHB5IHRvIHNwaW4gd2l0aCB0aGlzIHJlbmFt
ZSwgdGhvdWdoIEkgd2FzIGtpbmRhCmhvcGluZyB0byBkcm9wICR7U1VCSkVDVH0gcGF0Y2ggaWYg
Zm9sa3Mgd2VyZSBPSyB3aXRoIHBhdGNoICMxMCBpbgp0aGlzIHNlcmllcyBbMV0uIEkgcGVyc29u
YWxseSB0aGluayB0aGF0J3MgdGhlIHJpZ2h0IHdheSB0byBnbyBidXQKaXQncyB1bmNsZWFyIHRv
IG1lIGlmIGFybTY0IG1haW50YWluZXJzIHdpbGwgdGhpbmsgaXQncyBhIGhhY2sKKGRlc3BpdGUg
dGhlIGZhY3QgdGhhdCBhcm0zMiBpbXBsZW1lbnRzIHRoZSAibm1pIiBmdW5jdGlvbnMgd2l0aApy
ZWd1bGFyIElQSXMpLgoKRm9yIG5vdywgbWF5YmUgSSdsbCB0aGluayBwb3NpdGl2ZSB0aG91Z2h0
cyBhbmQgaG9wZSB0aGF0IGZvbGtzIHdpbGwKaGF2ZSB0aGUgdGltZSB0byByZXZpZXcgdGhlIHNl
cmllcyBzb29uLiBJZiBhbm90aGVyIGZldyB3ZWVrcyBnbyBieQp0aGVuIEknbGwgc2VuZCBhIHY5
IHdpdGgganVzdCB5b3VyIGNvbW1lbnRzIGFkZHJlc3NlZC4gSWYgbm90aGluZwplbHNlLCBtYXli
ZSB5b3UgY2FuIGxhbmQgdGhlIGtnZGIgcGFydHMgaW4gYSB0cmVlIHRhcmdldGluZyB2Ni41IGFu
ZAp0aGVuIHdoZW4gYXJtNjQgZm9sa3MgaGF2ZSB0aGUgYmFuZHdpZHRoIHRoZW4gaXQgd2lsbCBi
ZSBlYXNpZXIgdG8gZ2V0CnRoZW0gbGFuZGVkLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMzA0MTkxNTUzNDEudjguMTAuSWMzNjU5OTk3ZDYyNDMxMzlkMDUyMmZjM2FmY2RmZDg4
ZDdhNWYwMzBAY2hhbmdlaWQKCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3Jl
cG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
