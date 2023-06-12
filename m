Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD372C6BA
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jun 2023 15:59:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q8i51-0006gg-U0
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Jun 2023 13:59:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1q8i50-0006ga-Su
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Jun 2023 13:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mcfr681nvbjsce6uOZx3n/G0oulxIlOq9VGmkGkuQPA=; b=FArLSWQUESpxKlP6H8i8QdlLls
 I82TMkKlrxa3y3YVbJ4cdotFbl/ujUP8HMeWNjwaLMoczBD31sOU4EBzijICy8YBWMwvG+rVAaINZ
 pVdHIa+EEo9FK9ZtY2QsYqwbUzpgubMtbrWa/APMua2fx39cTHXBkC7MoDVek1bMq/iI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mcfr681nvbjsce6uOZx3n/G0oulxIlOq9VGmkGkuQPA=; b=gnsCvxluk0hN/FK1YeRMMWRCu2
 p48qUWMDjTxQiwd1tw8wWnuhpmWyFe0gIpyax9JwogwhM7WTm3zG9LB+2xqKqlvtUYswIJ/p5WGva
 Ml3nDdSMM4GrMM9hD3f+F8J8yLgBuUfBVChpghez4VHlF1nekZXrLp+Vwh1uBoA9ftJw=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1q8i4x-000mYV-6W for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Jun 2023 13:59:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA4FB1FB;
 Mon, 12 Jun 2023 07:00:10 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.27.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8E63F71E;
 Mon, 12 Jun 2023 06:59:20 -0700 (PDT)
Date: Mon, 12 Jun 2023 14:59:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZIckscgmirrgxZ75@FVFF77S0Q05N>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
 <ZIb0hd8djM+jJviF@FVFF77S0Q05N>
 <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Jun 12, 2023 at 06:55:37AM -0700, Doug Anderson wrote:
    > Mark, > > On Mon, Jun 12, 2023 at 3:33 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > > > On Fri, May 19, 2023 at 10:18:39AM -0700 [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8i4x-000mYV-6W
Subject: Re: [Kgdb-bugreport] [PATCH v5 15/18] watchdog/perf: Add a weak
 function for an arch to detect if perf can use NMIs
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
Cc: Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMDY6NTU6MzdBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBNYXJrLAo+IAo+IE9uIE1vbiwgSnVuIDEyLCAyMDIzIGF0IDM6MzPigK9BTSBNYXJr
IFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIE1h
eSAxOSwgMjAyMyBhdCAxMDoxODozOUFNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+
ID4gPiBPbiBhcm02NCwgTk1JIHN1cHBvcnQgbmVlZHMgdG8gYmUgZGV0ZWN0ZWQgYXQgcnVudGlt
ZS4gQWRkIGEgd2Vhawo+ID4gPiBmdW5jdGlvbiB0byB0aGUgcGVyZiBoYXJkbG9ja3VwIGRldGVj
dG9yIHNvIHRoYXQgYW4gYXJjaGl0ZWN0dXJlIGNhbgo+ID4gPiBpbXBsZW1lbnQgaXQgdG8gZGV0
ZWN0IHdoZXRoZXIgTk1JcyBhcmUgYXZhaWxhYmxlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gPiA+IC0tLQo+ID4g
PiBXaGlsZSBJIHdvbid0IG9iamVjdCB0byB0aGlzIHBhdGNoIGxhbmRpbmcsIEkgY29uc2lkZXIg
aXQgcGFydCBvZiB0aGUKPiA+ID4gYXJtNjQgcGVyZiBoYXJkbG9ja3VwIGVmZm9ydC4gSSB3b3Vs
ZCBiZSBPSyB3aXRoIHRoZSBlYXJsaWVyIHBhdGNoZXMKPiA+ID4gaW4gdGhlIHNlcmllcyBsYW5k
aW5nIGFuZCB0aGVuIG5vdCBsYW5kaW5nICR7U1VCSkVDVH0gcGF0Y2ggbm9yCj4gPiA+IGFueXRo
aW5nIGVsc2UgbGF0ZXIuCj4gPgo+ID4gRldJVywgZXZlcnl0aGluZyBwcmlvciB0byB0aGlzIGxv
b2tzIGZpbmUgdG8gbWUsIHNvIEkgcmVja29uIGl0J2QgYmUgd29ydGgKPiA+IHNwbGl0dGluZyB0
aGUgc2VyaWVzIGhlcmUgYW5kIGdldHRpbmcgdGhlIGJ1ZGR5IGxvY2t1cCBkZXRlY3RvciBpbiBm
aXJzdCwgdG8KPiA+IGF2b2lkIGEgbG9nLWphbSBvbiBhbGwgdGhlIHN1YnNlcXVlbnQgTk1JIGJp
dHMuCj4gCj4gSSB0aGluayB0aGUgd2hvbGUgc2VyaWVzIGhhcyBhbHJlYWR5IGxhbmRlZCBpbiBB
bmRyZXcncyB0cmVlLAo+IGluY2x1ZGluZyB0aGUgYXJtNjQgInBlcmYiIGxvY2t1cCBkZXRlY3Rv
ciBiaXRzLiBJIHNhdyBhbGwgdGhlCj4gbm90aWZpY2F0aW9ucyBmcm9tIEFuZHJldyBnbyB0aHJv
dWdoIG92ZXIgdGhlIHdlZWtlbmQgdGhhdCB0aGV5IHdlcmUKPiBtb3ZlZCBmcm9tIGFuICJ1bnN0
YWJsZSIgYnJhbmNoIHRvIGEgInN0YWJsZSIgb25lIGFuZCBJIHNlZSB0aGVtIGF0Ogo+IAo+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FrcG0vbW0uZ2l0
L2xvZy8/aD1tbS1ub25tbS1zdGFibGUKPiAKPiBXaGVuIEkgZmlyc3Qgc2F3IEFuZGVydyBsYW5k
IHRoZSBhcm02NCBwZXJmIGxvY2t1cCBkZXRlY3RvciBiaXRzIGluCj4gaGlzIHVuc3RhYmxlIGJy
YW5jaCBzZXZlcmFsIHdlZWtzIGFnbywgSSBzZW50IGEgcHJpdmF0ZSBtZXNzYWdlIHRvIHRoZQo+
IGFybTY0IG1haW50YWluZXJzICh5b3Vyc2VsZiBpbmNsdWRlZCkgdG8gbWFrZSBzdXJlIHlvdSB3
ZXJlIGF3YXJlIG9mCj4gaXQgYW5kIHRoYXQgaXQgaGFkbid0IGJlZW4gY2F1Z2h0IGluIG1haWwg
ZmlsdGVycy4gSSBnb3QgdGhlCj4gaW1wcmVzc2lvbiB0aGF0IGV2ZXJ5dGhpbmcgd2FzIE9LLiBJ
cyB0aGF0IG5vdCB0aGUgY2FzZT8KClNvcnJ5OyBJJ20gc2xvd2x5IGNhdGNoaW5nIHVwIHdpdGgg
YSBiYWNrbG9nIG9mIGVtYWlsLCBhbmQgSSdtIGp1c3QgYmVoaW5kLgoKRmVlbCBmcmVlIHRvIGln
bm9yZSB0aGlzOyBzb3JyeSBmb3IgdGhlIG5vaXNlIQoKSWYgd2Ugc3BvdCBhbnl0aGluZyBnb2lu
ZyB3cm9uZyBpbiB0ZXN0aW5nIHdlIGNhbiBsb29rIGF0IGZpeGluZyB0aG9zZSB1cC4KClRoYW5r
cywKTWFyay4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tn
ZGItYnVncmVwb3J0Cg==
